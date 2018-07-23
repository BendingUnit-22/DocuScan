import datetime
import numpy as np
import tensorflow as tf
import os.path as path
import pickle
from MDLSTM.data_preprocess import get_or_create_vocab_file
from MDLSTM.utils import task_as_string


from tensorflow.python.platform import gfile

def levenshtein(source, target, mat=None):
    if len(source) < len(target):
        return levenshtein(target, source)

    # now we've asserted len(source) >= len(target)
    if len(target) == 0:
        return len(source)

    # We call list() to force the strings to become sequences
    source = np.array(list(source))
    target = np.array(list(target))

    mm = np.ones((len(source), len(target)))

    if mat is not None:
        for i, p1 in enumerate(source):
            for j, p2 in enumerate(target):
                mm[i, j] = mat[p1, p2]

    # dynamic programming algorithm - but with added optimization we only need last 2 rows of matrix
    previous_row = np.arange(target.size + 1).astype("float32")
    for i, s in enumerate(source):
        #Insertion (target grows longer than source)
        current_row = previous_row + 1

        # Substitution or matching:
        #Target and source are aligned and either are different or are the same.
        current_row[1:] = np.minimum(current_row[1:], current_row[0:-1] + 2)

        previous_row = current_row
    return previous_row[-1]



def show_prediction(dec, label, lmP=None, top_k=1):
    voc, vocab_reverse = get_or_create_vocab_file('./vocab.pck', '../data/xml/')
    p = []
    for i, word in enumerate(label[:top_k]):
        f = [''.join([vocab_reverse[j] for j in word if j])]

        print('corr: {}'.format([vocab_reverse[j] for j in word if j]))

        for guess_batch in dec:
            print('pred: {}'.format([vocab_reverse[j] for j in guess_batch[i] if j]))

            f.append(''.join([vocab_reverse[j] for j in guess_batch[i] if j]))
        if lmP is not None:
            print("lmP: {}".format([vocab_reverse[j] for j in lmP[i] if j]))
        print('-'*10)
        p.append(f)
    return p

def split_sequence(seq, delimiter=' ', exclude=[0]):
    words = []
    word = []
    for c in seq:
        if c == ord(delimiter):
            if len(word) > 0:
                words.append(word)
            word = []
        elif c not in exclude:
            word.append(c)
    if len(word) > 0:
        words.append(word)
    return words

def cut_zeros(word):
    return [c for c in word if c != 0 and c != 28]


def calculate_model_error_withLangModel(decodedPr, labels_val, vocabulary, top_k):
    if len(vocabulary) == 0:
        return -1

    voc_guess = [i for i in decodedPr[0]]
    voc_guess_v = [len(i) for i in decodedPr[0]]
    for guess_batch in decodedPr:
        for k, guess in enumerate(guess_batch):
            words = split_sequence(guess)
            w = []
            v1 = 0
            for guessW in words:
                v = voc_guess_v[k]
                w1 = []
                for i, word in enumerate(vocabulary):
                    # sorted by length, cut the for when possible
                    if v < len(word) - len(guessW):
                        break
                    ed = levenshtein(word, guessW)
                    if v > ed:
                        v = ed
                        w1 = word
                if len(w) > 0:
                    w.append(27)
                w.extend(w1)
                v1 += v
            if v1 < voc_guess_v[k]:
                voc_guess_v[k] = v1
                voc_guess[k] = w
    err = 0.0
    for k, truth in enumerate(labels_val):
        truth = cut_zeros(truth)
        err += levenshtein(truth, voc_guess[k])/float(len(truth))
    err /= len(labels_val)
    return err, voc_guess

def get_trie(vocabulary, sp=56):
    Trie = {}
    def add_trie(trie, w, n=0):
        if n == len(w):
            trie[0] = 1
            return
        if w[n] == sp:
            add_trie(Trie, w[n+1:])
            return
        if w[n] not in trie:
            trie[w[n]] = {}
        add_trie(trie[w[n]], w, n+1)
    for w in vocabulary:
        add_trie(Trie, w)
    return Trie

def trie_exist(trie, w, n=0):
    if n == len(w):
        if 0 in trie:
            return True
        return False
    if w[n] not in trie:
        return False
    return trie_exist(trie[w[n]], w, n+1)

def bi_gram_model(w, tr, bi, on):
    if len(w) > 2:
        return tr[w[-3], w[-2], w[-1]]
    if len(w) > 1:
        return bi[w[-2], w[-1]]
    if len(w) == 1:
        return on[w[0]]
    return 0.

def softmax(x):
    e_x = np.exp(x - np.max(x))/ np.exp(x - np.max(x)).sum()
    return e_x

def get_n_gram(vocab, vocab_size):
    tri_gram = np.zeros([vocab_size]*3)
    bi_gram = np.zeros([vocab_size]*2)
    one_gram = np.zeros([vocab_size])
    mB = 0
    mT = 0
    nrL = 0
    for w in vocab:
        nrL += 1
        if w[0] > vocab_size:
            print(w[0])
        one_gram[w[0]] += 1
        for j in range(1, len(w)):
            nrL += 1
            one_gram[w[j]] += 1
            bi_gram[w[j-1], w[j]] += 1.
            mB = max(mB, bi_gram[w[j-1], w[j]])
            if j > 1:
                tri_gram[w[j-2], w[j-1], w[j]] += 1
                mT = max(mT, tri_gram[w[j-2], w[j-1], w[j]])
    return softmax(one_gram), softmax(bi_gram), softmax(tri_gram)

def beam_search_dict(preds, trans=bi_gram_model, voc_size=29, k=5, bk=100):
    """ Beam search with dict

    Args:
        trans: function that takes the word and returns the probs of last character
        preds: (steps, batch_size, vocab_size)

    Returns:
        float - error,
        (batch_size, steps)
    """
    B = [[[0., 1., []]] for _ in range(preds.shape[1])]
    for i, pred in enumerate(preds):
        bn = [[] for _ in range(preds.shape[1])]
        for j, y in enumerate(B[:bk]):
            for q, w in enumerate(y):
                nv = [0., 0., w[2]]
                if len(nv[2]) > 0:
                    nv[0] = B[j][q][0]*pred[j, nv[2][-1]]
                    for p, v in enumerate(y):
                        if len(v) == len(nv[2])-1 and len([0 for ii, jj in zip(v, nv[2][:-1]) if ii != jj])==0:
                            nv[0] = nv[0] + pred[j, nv[2][-1]]*trans(nv[2])*B[j][q][1]
                nv[1] = (B[j][q][0] + B[j][q][1])*pred[j, 28] # add blank
                bn[j].append(nv)
                for l in range(1, voc_size - 1):
                    if len(w[2]) == 0 or w[2][-1] != l:
                        #extension of y with l=ctc(l)*(transition y->l P)*p(y, t-1, x)-total_a
                        bn[j].insert(0, [pred[j, l]*trans(w[2]+[l])*(B[j][q][0]+B[j][q][1]),
                                         0.0, w[2]+[l]])
                        if len(bn[j]) > bk:
                            bn[j].sort(key=lambda x: x[0]+x[1], reverse=True)
                            while len(bn[j]) > bk:
                                del bn[j][bk]
        del B[:]
        B = bn[:]
    return B

def get_closest_word(guessW, vocabulary):
    v = 100
    w1 = None
    for i, word in enumerate(vocabulary):
        if len(word) < len(guessW)-1 or len(word) > len(guessW)+1:
            continue
        ed = levenshtein(word, guessW)
        if v > ed:
            v = ed
            w1 = word
    return w1, v

def dict_model(bPreds, is_word, labels_val, vocabulary=None, n_gram=None, bk=100):
    nPreds = []
    for preds in bPreds[:bk]:
        wordsList = []
        for pred in preds:
            words = []
            word = []
            nr = 0
            try:
                if len(pred[2]) > 0:
                    pred = pred[2]
            except:
                pass
            for l in pred:
                if l == 0:
                    continue
                if l == 27 and len(word) != 0:
                    words.append([word, is_word(word)])
                    if words[-1][1]:
                        nr += 100
                    else:
                        if vocabulary is not None:
                            w1, v = get_closest_word(word, vocabulary)
                            if v <= 1.5:
                                words[-1][0] = w1
                                nr += 5-v
                    word = []
                else:
                    word.append(l)
            if len(word) != 0:
                words.append([word, is_word(word)])
                if words[-1][1]:
                    nr += 100
                else:
                    if vocabulary is not None:
                        w1, v = get_closest_word(word, vocabulary)
                        if v <= 1.5:
                            words[-1][0] = w1
                            nr += 5 - v
            wordsList.append([words, nr])
        wordsList.sort(key=lambda x: x[1], reverse=True)
        npres = []
        for w in wordsList[0][0]:
            if len(npres) > 0:
                npres += [27]
            npres += w[0]
        nPreds.append(npres)
    err = 0.0
    for k, truth in enumerate(labels_val[:bk]):
        truth = cut_zeros(truth)
        err += levenshtein(truth, nPreds[k])/float(len(truth))
    err /= len(labels_val[:bk])*1.0
    return nPreds, err

def get_error(labels_val, nPreds, bk=100):
    err = 0.0
    for k, truth in enumerate(labels_val[:bk]):
        truth = cut_zeros(truth)
        err += levenshtein(truth, nPreds[k])/float(len(truth))
    err /= len(labels_val[:bk])*1.0
    return err

def mkP(decoder):
    pr = [[] for _ in range(decoder[0].shape[0])]
    for i in decoder:
        for k, j in enumerate(i):
            pr[k].append(j)

    return pr
