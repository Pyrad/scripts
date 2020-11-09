#!/home/pyrad/procs/Python-3.8.3/bin/python

import matplotlib.pyplot as plt
import math
from matplotlib.patches import Rectangle
from copy import deepcopy
import numpy as np

class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def shift(self, sobj):
        self.x += sobj.dx
        self.y += sobj.dy

    def set_by(self, other):
        self.x = other.x
        self.y = other.y

class Shift:
    def __init__(self, dx, dy):
        self.dx = dx
        self.dy = dy

    def move_n_x(self, nx):
        self.dx = self.dx * nx

    def move_n_y(self, ny):
        self.dy = self.dy * ny

    def set_by(self, other):
        self.dx = other.dx
        self.dy = other.dy

    def __repr__(self):
        return "dx: {} dy: {}".format(self.dx, self.dy)

class Rect:
    def __init__(self, pt, length, width):
        self.point = Point()
        self.point.set_by(pt)
        self.length = length
        self.width = width

    def set_by_ll_ur(self, pt_ll, pt_ur):
        self.point.set_by(pt_ll)
        self.length = pt_ur.x - pt_ll.x
        self.width = pt_ur.y - pt_ll.y

    def set_by(self, other):
        self.point.set_by(other.point)
        self.length = other.length
        self.width = other.width

    def __repr__(self):
        return "({} {}) L: {}, W: {}".format(self.point.x, self.point.y, self.length, self.width)

    def ll(self):
        return self.point
    def ur(self):
        p = Point(self.point.x + self.length, self.point.y + self.width)
        return p
    def ul(self):
        p = Point(self.point.x, self.point.y + self.width)
        return p
    def lr(self):
        p = Point(self.point.x + self.length, self.point.y)
        return p

    def sw(self):
        return self.ll()
    def se(self):
        return self.lr()
    def nw(self):
        return self.ul()
    def ne(self):
        return self.ur()

    def shift(self, sobj):
        self.point.shift(sobj)

if __name__ == "__main__":

    #fig, ax = plt.subplots()
    #fig, axlist = plt.subplots(ncols=4, nrows=4, constrained_layout=True)
    NROWS = 4
    NCOLS = 4
    fig, axlist = plt.subplots(ncols=NCOLS, nrows=NROWS)
    # print "type(axlist) =", type(axlist)
    # print "len(axlist) =", len(axlist)
    # print "type(axlist[0]) =", type(axlist[0])
    # print "len(axlist[0]) =", len(axlist[0])
    # print "type(axlist[0][0]) =", type(axlist[0][0])
    # ax = axlist[0][0]

    # ll_of_arraybox = [(18, 12), (20, 12), (20, 10), (18, 10)]
    # ur_of_arraybox = [(52, 36), (50, 36), (50, 38), (52, 38)]
    ll_of_arraybox = [(20, 12), (18, 12), (20, 10), (18, 10)]
    ur_of_arraybox = [(50, 36), (50, 38), (52, 36), (52, 38)]

    all_rects = []
    for ll in ll_of_arraybox:
        for ur in ur_of_arraybox:
            rect = Rect(Point(0, 0), 0, 0)
            rect.set_by_ll_ur(Point(ll[0], ll[1]), Point(ur[0], ur[1]))
            all_rects.append(deepcopy(rect))

    rect_origin = Rect(Point(0, 0), 10, 6)
    rect = Rect(Point(0, 0), 10, 6)

    ridx = 0
    for r in all_rects:
        xcnt_to_left = float(r.ll().x - rect_origin.ll().x) / rect_origin.length
        xcnt_to_right = float(r.ur().x - rect_origin.ll().x) / rect_origin.length
        ycnt_to_left = float(r.ll().y - rect_origin.ll().y) / rect_origin.width
        ycnt_to_right = float(r.ur().y - rect_origin.ll().y) / rect_origin.width
        print("{} xcnt_to_left : {}".format(ridx, xcnt_to_left))
        print("   xcnt_to_right: {}".format(xcnt_to_right))
        print("   ycnt_to_left : {}".format(ycnt_to_left))
        print("   ycnt_to_right: {}".format(ycnt_to_right))
        ridx += 1


    shift_obj = Shift(rect.length, rect.width)
    sobj = Shift(rect.length, rect.width)

    rects = []

    rows = 6
    cols = 7

    for ix in range(rows):
        for iy in range(cols):
            sobj.set_by(shift_obj)
            sobj.move_n_x(ix)
            sobj.move_n_y(iy)
            #print "ix: {} iy: {} sobj: {}".format(ix, iy, sobj)

            rect.set_by(rect_origin)
            rect.shift(sobj)
            r = Rect(rect.point, rect.length, rect.width)
            rects.append(deepcopy(r))

            #r = Rectangle((rect.ll().x, rect.ll().y), rect.length, rect.width, fc='none', ec='g', lw='2')
            #ax.add_patch(r)
            #print "ix: {} iy: {} rect: {}".format(ix, iy, rect)

    print("len(rects) =", len(rects))

    # for r in rects:
    #     rect = Rectangle((r.ll().x, r.ll().y), r.length, r.width, fc='none', ec='g', lw='2')
    #     ax.add_patch(rect)

    idx = 0
    for row in range(NROWS):
        for col in range(NCOLS):
            ax = axlist[row][col]
            for r in rects:
                rect = Rectangle((r.ll().x, r.ll().y), r.length, r.width, fc='none', ec='g', lw='2')
                ax.add_patch(rect)
            r = all_rects[idx]
            rect = Rectangle((r.ll().x, r.ll().y), r.length, r.width, fc='none', ec='r', lw='2')
            ax.add_patch(rect)
            idx += 1

            ax.set_xlim((-10, 70))
            ax.set_ylim((-10, 52))
            ax.axes.set_aspect('equal')

    plt.show()


#rect1 = matplotlib.patches.Rectangle((-200, -100), 400, 200, color ='green')
#rect2 = matplotlib.patches.Rectangle((0, 150), 300, 20, color ='pink')
#rect3 = matplotlib.patches.Rectangle((-300, -50), 40, 200, color ='yellow')
#ax.add_patch(rect1)
#ax.add_patch(rect2)
#ax.add_patch(rect3)
#plt.xlim([-400, 400])
#plt.ylim([-400, 400])

