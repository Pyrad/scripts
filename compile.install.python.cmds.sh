#!/bin/bash -

# Base path where all programs are installed into
PREFIX_BASE='/home/pyrad/temp/tmpprocs'

# Python version to install
PY_VERSION='38' #PY_VERSION='27'

# Path to install for python
PREFIX_PYTHON='${PREFIX_BASE}/python${PY_VERSION}'

# Where is the tarball?
TARBALL='/home/pyrad/temp/tmpswap/Python-3.8.3.tar.xz'
# Path of tarball
TARBALL_PATH=`dirname $TARBALL`
# Name of tarball
TARBALL_NAME=`basename $TARBALL`

# Current path
curpath=`pwd`

# Step 0.0: Change directory into where the tarball is
# Step 0.1: Check tarball
cd $TARBALL_PATH

if [[ ! -e $TARBALL ]]; then
    exit
fi

PY_FOLDER=`tar -tf $TARBALL_NAME | head -n 1`
echo "PY_FOLDER is $PY_FOLDER"


# Step 1: decompress the tarball of python source
#tar -xf $TARBALL

# Final step, go back to where I came from
cd $curpath
