from __future__ import absolute_import, division, print_function
import cv2
import tensorflow as tf
from tensorflow import logging
from PIL import Image, ImageEnhance, ImageOps, ImageColor
import scipy.misc
import skimage.util

import numpy as np
import glob
import os.path
import xml.etree.ElementTree as ET
import matplotlib.pyplot as plt
import scipy.io
import random
from scipy import ndimage
from skimage import io, transform
import math
import pickle


from scipy import signal
from sklearn import preprocessing
from sklearn.decomposition import PCA
import warnings
warnings.filterwarnings('ignore')
plt.ion()
plt.switch_backend('macosx')


def sanitize_target(line):
    QUOT_TOKEN_Init = "&quot;"
    QUOT_TOKEN = '"'

    targets = line.strip().replace(QUOT_TOKEN_Init, QUOT_TOKEN)
    targets = np.asarray([vocabulary[x] for x in targets])
    return targets

def get_or_create_vocab_file(vocab_file_path, xml_data_path):
    if os.path.exists(vocab_file_path):
        logging.info("Found vocab file! Reading from that...")
        vocab, vocab_reverse = pickle.load(open(vocab_file_path, "rb"))
        return vocab, vocab_reverse
    else:
        logging.info("Could not find vocab file, creating one now at: {}".format(vocab_file_path))
        vocab = {'%%': 0}
        xml_files = sorted(glob.glob(xml_data_path + "*.xml"))
        char_set = set()
        for i, xml in enumerate(xml_files):
            print("\rFile: {}/{}...".format(i+1, len(xml_files)), end="")
            tree = ET.parse(xml)
            for word in tree.iter('word'):
                char_set.update([c for c in word.attrib['text'] if c not in vocab.keys() and c.isprintable() and not c.isspace()])
        for c in sorted(char_set):
            vocab[c] = len(vocab.keys())

        vocab[' '] = len(vocab.keys())
        vocab[''] = len(vocab.keys())
        vocab_reverse = {vocab[c]: c for c in sorted(vocab.keys())}
        pickle.dump((vocab, vocab_reverse), open(vocab_file_path, "wb"))
        print(" done!")
        return vocab, vocab_reverse


maxi = 0
def process_page(nameXML, nameImage, words=False, maxL=200, maxW=500):
    tree = ET.parse(nameXML)
    root = tree.getroot()
    global maxi

    form = cv2.imread(nameImage, cv2.IMREAD_GRAYSCALE)
    imgs = []
    texts = []
    lengths = []
    for i, line in enumerate(root[1]):
        if int(line.attrib['dsy']) - int(line.attrib['asy']) > maxL:
            continue
        if words:
            b = 0
            e = 0
            t = ""
            ss = 0
            jj = 0
            for w in line:
                if w.tag == "lower-contour" or w.tag == "upper-contour" or len(w) == 0:
                    continue

                b1 = 0
                e1 = 0
                sss = 0
                jjj = 0
                for letter in w:
                    if b1 == 0:
                        b1 = int(letter.attrib['x'])
                        jjj = int(letter.attrib['y'])
                    e1 = max(e1, int(letter.attrib['x']) + int(letter.attrib['width']))
                    b1 = min(b1, int(letter.attrib['x']))
                    jjj = min(jjj, int(letter.attrib['y']))
                    sss = max(sss, int(letter.attrib['y']) + int(letter.attrib['height']))

                if b==0:
                    b = b1
                    e = e1
                    ss = sss
                    jj = jjj
                if e1 - b > maxW and t != "":
                    img = form[jj:ss, b:e]
                    img = cv2.resize(img, (0, 0), fx=0.4, fy=0.4)
                    res, thresh1 = cv2.threshold(img, int(line.attrib['threshold']), 255, cv2.THRESH_BINARY)
                    thresh1 = 1. - (thresh1 / 255)
                    ok = 1
                    if any([char not in vocabulary for char in t]):
                        ok = 0
                    if ok==1 and len(t)*4 < thresh1.shape[1] and ss - jj < maxL:
                        maxi = max(maxi, img.shape[0])
                        texts.append(sanitize_target(t))
                        imgs.append(img)
                        lengths.append(thresh1.shape[1])

                    if e1 - b1 > maxW:
                        b = 0
                        t = ""
                        continue
                    b = b1
                    e = e1
                    jj = min(jj, jjj)
                    ss = max(ss, sss)
                    t = str(w.attrib['text'])
                else:
                    if e1 - b1 > maxW:
                        b = 0
                        continue
                    t = t + " " + str(w.attrib['text'])
                    e = e1
                    jj = min(jj, jjj)
                    ss = max(ss, sss)
            if e - b < maxW and t != "":
                img = form[jj:ss, b:e]
                img = cv2.resize(img, (0, 0), fx=0.4, fy=0.4)
                res, thresh1 = cv2.threshold(img, int(line.attrib['threshold']), 255, cv2.THRESH_BINARY)
                thresh1 = 1. - (thresh1 / 255)
                maxi = max(maxi, img.shape[0])
                ok = 1
                if any([char not in vocabulary for char in t]):
                    ok = 0
                if ok == 1 and len(t)*4 < thresh1.shape[1] and ss - jj < maxL:
                    texts.append(sanitize_target(t))
                    imgs.append(img)
                    lengths.append(thresh1.shape[1])

        else:
            img = form[int(line.attrib['asy']):int(line.attrib['dsy'])]
            ret, thresh1 = cv2.threshold(img, int(line.attrib['threshold']), 255, cv2.THRESH_BINARY)

            maxi = max(maxi, img.shape[0])
            texts.append(sanitize_target(line.attrib['text']))
            imgs.append(thresh1)
            lengths.append(thresh1.shape[1])
        return [texts, imgs, lengths]


def add_padding(imgs, pad_to=(25, 350)):
    imgs = [imgs]
    at = []
    H, W = pad_to
    for k, img1 in enumerate(imgs):
        img = imgs[k]
        if img.shape[0] != H and int((H - img.shape[0])/2) > 0:
            img = np.insert(img, [0]*int((H - img.shape[0])/2), 0, axis=0)
        if img.shape[0] != H:
            img = np.insert(img, [img.shape[0]]*(H - img.shape[0]), 0, axis=0)

        if img.shape[1] != W:
            img = np.insert(img, [img.shape[1]]*(W - img.shape[1]), 0, axis=1)
        at.append(img)
    return at[0]


def makeTFRecordBatches(save_path, xml_path, img_path, batch_size, words=False, bounded_size_h=25, bounded_size_w=350):
    if not os.path.exists(save_path):
        os.makedirs(save_path)
    totalT, totalI, totalL = [], [], []
    nr = 0

    xml_files = sorted(glob.glob(xml_path+"*.xml"))
    for i, xml in enumerate(xml_files):
        print("=============================== FILE: {} / {} ===============================".format(i+1, len(xml_files)))
        name = xml.split('.xml')[0].split('/')[-1]
        img = img_path + name + '.png'
        if not os.path.isfile(img):
            continue
        ret = process_page(xml, img, words)
        if ret is None:
            continue

        texts, imgs, lengths = ret
        totalT.extend(texts)
        totalI.extend(imgs)
        totalL.extend(lengths)
        if len(totalT) >= batch_size:
            writer = tf.python_io.TFRecordWriter(path=save_path+"/iam_data-{}.tfrecords".format(nr))

            for ii in range(batch_size):
                imshape_1_bad = False
                imshape_2_bad = False
                old_shape = totalI[ii].shape
                if totalI[ii].shape[0] > bounded_size_h:
                    imshape_1_bad = True
                    totalI[ii] = cv2.resize(totalI[ii], (totalI[ii].shape[1], bounded_size_h))
                if totalI[ii].shape[1] > bounded_size_w:
                    imshape_2_bad = True
                    totalI[ii] = cv2.resize(totalI[ii], (bounded_size_w, totalI[ii].shape[0]))
                if imshape_1_bad or imshape_2_bad:
                    logging.error("Image shape was bounded: (={}) -> (={})".format(old_shape, totalI[ii].shape))
                imgI = add_padding(totalI[ii], pad_to=(bounded_size_h, bounded_size_w))

                example = tf.train.Example(
                    features=tf.train.Features(
                        feature={
                            'seq_len': tf.train.Feature(int64_list=tf.train.Int64List(value=[totalL[ii]])),
                            'target': tf.train.Feature(int64_list=tf.train.Int64List(value=totalT[ii].astype("int64"))),
                            'imageInput': tf.train.Feature(float_list=tf.train.FloatList(value=(imgI).reshape(-1).astype("float")))
                        }
                    )
                )
                serialized = example.SerializeToString()
                writer.write(serialized)
            writer.flush()
            writer.close()
            nr += 1
            print("Batch file #({}) saved successfully to: {}!".format(nr, (save_path+"/iam_data-{}.tfrecords".format(nr))))
            totalT = totalT[batch_size:]
            totalI = totalI[batch_size:]
            totalL = totalL[batch_size:]

            
if __name__ == "__main__":

    vocabulary, vocabulary_reverse = get_or_create_vocab_file("vocab.pck", "../data/xml/")
    print(len(vocabulary.keys()))
    makeTFRecordBatches('./test-batch1', '../data/xml/', '../data/forms/', 35, True)