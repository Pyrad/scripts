#!/usr/bin/python

import time
print "Good day today"
local_time_str = time.asctime( time.localtime(time.time()))
print "Local time: ", local_time_str
