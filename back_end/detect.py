
import cv2
import numpy as np
import math


def dist(x, y, c1, c2):
    return math.sqrt((c1 - x) ** 2 + (c2 - y) ** 2)

def filterKeypoint(keypoints, cx, cy):
    points = []
    for kp in keypoints:
        x = kp.pt[0]
        y = kp.pt[1]
        d = dist(x, y, cx, cy)
        p = ( d, (x,y))
        points.append(p)
    sorted_list =  sorted(points, key=lambda x: x[0])[-4:]
    return [p[1] for p in sorted_list]

def detect_markers():

    width = 1000
    height = 1200
    # Read image
    im = cv2.imread("./markers.png", cv2.IMREAD_GRAYSCALE)
    im = cv2.resize(im, (width, height))
    # Setup SimpleBlobDetector parameters.
    params = cv2.SimpleBlobDetector_Params()

    params.filterByCircularity = True
    params.maxCircularity = .85
    params.minCircularity = .785

    MAX_WIDTH = 215.9
    MAX_HEIGHT = 279.4
    # Create a detector with the parameters
    ver = (cv2.__version__).split('.')
    if int(ver[0]) < 3:
        detector = cv2.SimpleBlobDetector(params)
    else:
        detector = cv2.SimpleBlobDetector_create(params)

    # Detect blobs.
    keypoints = detector.detect(im)

    # Draw detected blobs as red circles.
    # cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS ensures
    # the size of the circle corresponds to the size of blob
    points = filterKeypoint(keypoints, width/215.9, height/279.4)
    # for keypoint in keypoints:
    #     print(keypoint.pt[0], keypoint.pt[1])
    for p in points:
        print(p)
    im_with_keypoints = cv2.drawKeypoints(im, keypoints, np.array([]), (0, 0, 255),
    cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
    # Show blobs
    cv2.imshow("Keypoints", im_with_keypoints)
    cv2.waitKey(0)
    # this will define the ELEMENTS that will compose the template.

detect_markers()