#!/c/Python36/python

"""
This is file is used to rename compiled lib files in boost library
in the ***Windows platform***.

For example, after boost library is built, the lib file names are,
-----------------
...
libboost_atomic-mgw8-mt-d-x64-1_79.dll
libboost_atomic-mgw8-mt-d-x64-1_79.dll.a
libboost_atomic-mgw8-mt-x64-1_79.dll
libboost_atomic-mgw8-mt-x64-1_79.dll.a
libboost_chrono-mgw8-mt-d-x64-1_79.dll
...
-----------------

To make it simple, rename them to the following,
-----------------
...
libboost_atomic-d.dll
libboost_atomic-d.dll.a
libboost_atomic.dll
libboost_atomic.dll.a
libboost_chrono-d.dll
...
-----------------

"""

import os

### If this is set to True, it means just pratice, don't rename
#flag_test = True
flag_test = False

### The lib file names
all_files = []

########################################
### Get all lib files
########################################

fname_prefix="libboost"
fname_suffix=".dll"
fname_suffix_a=".a"

cdir = os.getcwd()
for f in os.listdir(cdir):
	### lib file names should start with "libboost"
	if not f.startswith(fname_prefix):
		continue
	### lib file names should end with ".dll" or ".a"
	if not f.endswith(fname_suffix) and not f.endswith(fname_suffix_a):
		continue
	### lib file should be a regular file
	if not os.path.isfile(f):
		continue
	### Those satisfy the rules are kept to all_files variable
	all_files.append(f)

mingw_version = "12"
mt_version = "mt"
os_bit = "64"
boost_version = "1_79"

# vstr0 = "-mgw12-mt-x64-1_79"
# vstr1 = "-mgw12-mt-d-x64-1_79"

vstr0 = "-mgw" + mingw_version + "-" + mt_version + "-x" + os_bit + "-" + boost_version
vstr1 = "-mgw" + mingw_version + "-" + mt_version + "-d-x" + os_bit + "-" + boost_version

print("To replace string 1: ", vstr0)
print("To replace string 2: ", vstr1)

cnt = 0
cnt0 = 0
cnt1 = 0
misscnt = 0

nfnlist = []

### Till now, all the names in all_files are valid file names we wanted
for fn in all_files:
	nfn = None
	if fn.find(vstr0) >= 0:
		nfn = fn.replace(vstr0, "")
		cnt0 += 1
	elif fn.find(vstr1) >= 0:
		nfn = fn.replace(vstr1, "-d")
		cnt1 += 1
	else:
		misscnt += 1
		
	if nfn is None:
		print("Replacement error for fiel name:", fn)
		continue
	
	if nfn in nfnlist:
		print("Duplicated name is found: {}(original file is {})".format(nfn, fn))
		nfnlist.append(nfn)
		continue
	nfnlist.append(nfn)
	
	### if flag_test is True, just print messages
	### if flag_test is NOT True, rename the files
	if flag_test is True:		
		print("[TEST] Rename file from {} to {}".format(fn, nfn))
	else:
		print("Rename file from {} to {}".format(fn, nfn))
		os.rename(fn, nfn)

print("==== SUMMARY ====")
print("BOOST lib files to rename = {}".format(len(all_files)))
print("Rename count: {}".format(cnt0 + cnt1))
print("Rename count 0: {}".format(cnt0))
print("Rename count 1: {}".format(cnt1))
print("Rename miss count: {}".format(misscnt))
print("len(nfnlist) = {}".format(len(nfnlist)))

setlist = set(nfnlist)

print("len(setlist) = ", len(setlist))

#for nfn in nfnlist:
#	print(nfn)


