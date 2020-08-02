#!/bin/sh -

########################################
#### The following must be specified
########################################
#### Prerequisites: tcl & tk
TCL_HOME='/home/pyrad/procs/tcl8.6.10'
TK_HOME='/home/pyrad/procs/tk8.6.10'
#### Base path where all programs are installed into
PREFIX_BASE='/home/pyrad/temp/tmpprocs'
#### Where is the tarball?
TARBALL='/home/pyrad/temp/tmpswap/Python-3.8.3.tar.xz'


# tcl & tk include files & libs
TCL_INC="$TCL_HOME/include"
TCL_LIB="$TCL_HOME/lib"
TCL_LIB_NAME="tcl8.6"

TK_INC="$TK_HOME/include"
TK_LIB="$TK_HOME/lib"
TK_LIB_NAME="tk8.6"

# Path of tarball
TARBALL_PATH=`dirname $TARBALL`
# Name of tarball
TARBALL_NAME=`basename $TARBALL`


BLUE_V='\033[38;0;39m'
GREEN_V='\033[38;5;76m'
YELLOW_V='\033[38;0;33m'
RED_V='\033[38;0;31m'
RESET_V='\033[0m'

INFO="${GREEN_V}INFO${RESET_V}"
WARNING="${YELLOW_V}WARNING${RESET_V}"
ERROR="${RED_V}ERROR${RESET_V}"

echo -e "[${INFO}] Tarball path is: $TARBALL_PATH"
echo -e "[${INFO}] Tarball name is: $TARBALL_NAME"

# Current path
curpath=`pwd`

# Step 0.0: Change directory into where the tarball is
cd $TARBALL_PATH
# Step 0.1: Check tarball
if [[ ! -e $TARBALL ]]; then
    echo -e "[${INFO}] Tarball doesn't exist: $TARBALL"
    exit
fi

# Step 1.0: Check the folder name in tarball
PY_FOLDER=`tar -tf $TARBALL_NAME | head -n 1`
echo -e "[${INFO}] PY_FOLDER is $PY_FOLDER"
# Step 1.1: Check whether the folder for installation exists in PREFIX_BASE
#           If it doesn't exist, create it
INSTALL_TO_PATH="${PREFIX_BASE}/$PY_FOLDER"
if [[ ! -e $INSTALL_TO_PATH ]]; then
    echo -e "[${INFO}] Create install folder as it doesn't exist: $INSTALL_TO_PATH"
    mkdir -p $INSTALL_TO_PATH
else
    echo -e "[${INFO}] Install folder exists: $INSTALL_TO_PATH"
fi
echo -e "[${INFO}] Python binary will be installed into $INSTALL_TO_PATH"


# Step 2.0: Before decompressed, check whether it has 
#           already been decompressed or not?
# Step 2.1: decompress the tarball of python source
BUILD_PATH="${TARBALL_PATH}/${PY_FOLDER}"
echo -e "[${INFO}] Check if build folder exists: $BUILD_PATH"
if [[ -d $BUILD_PATH ]]; then
    echo -e "[${INFO}] Tarball has already been decompressed"
else
    echo -e "[${INFO}] Tarball hasn't been decompressed yet, ready to decompress"
    echo -e -n "[${INFO}] Decompressing... "
    tar -xf $TARBALL
    echo -e "Done"
fi

if [[ ! -d $BUILD_PATH ]]; then
    echo -e "[$ERROR] Can't create or find build path, exit"
    exit
fi

# Step 3.0: Change to build path and configure
cd $BUILD_PATH
echo -e "[${INFO}] Change dir to $BUILD_PATH"
echo -e "[$WARNING] Takes a while to configure..."
sleep 3
if [[ -e ./configure ]]; then
    ./configure --prefix="${INSTALL_TO_PATH}" \
        --enable-optimizations --with-lto \
        --enable-shared --with-tcltk-includes="-I${TCL_INC} -I${TK_INC}" \
        --with-tcltk-libs="-L${TCL_LIB} -L${TK_LIB} -l${TCL_LIB_NAME} -l${TK_LIB_NAME}"
else
    echo -e "[$ERROR] Can't find configure file, exit"
    exit
fi

echo -e "[${INFO}] Configuration done"
echo -e "[$WARNING] Takes a while to build..."
sleep 3
make

echo -e "[${INFO}] Build done"
echo -e "[$WARNING] Takes a while to install..."
sleep 3
make install

echo -e "[${INFO}] Installation done"

# Final step, go back to where I came from
echo -e "[${INFO}] All finished, go back to original path"
cd $curpath
