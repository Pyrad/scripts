#!/home/pyrad/procs/python27/bin/python

import time

def print_object_attr_info(obj):
    print "len(dir(obj)) =", len(dir(obj))
    for att in dir(obj):
        try:
            attr = getattr(obj, att)
        except:
            print "obj.{} is not an attribute".format(att)
            continue
        print "type(obj.{}) = {}".format(att, type(attr).__name__)


class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def printinfo(self):
        print "(X,Y) = ({}, {})".format(self.x, self.y)

print "Good day today"
time_tag = time.asctime(time.localtime(time.time()))
print "Local time: ", time_tag

alist = []
print_object_attr_info(alist)
