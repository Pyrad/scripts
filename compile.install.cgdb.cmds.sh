#!/bin/sh -

TIMECHK0=$SECONDS
########################################
#### The following must be specified
########################################
#### Base path where all programs are installed into
PREFIX_BASE='/home/pyrad/procs'
#### Where is the tarball?
TARBALL='/home/pyrad/swap/cgdb-master.zip'
#### Install to where?
INSTALL_DIR_NAME="cgdb"
#### Test mode? If it is, configure, make and
#### make install will be skipped to avoid wasting
#### time for test
TESTMODE=0
#### wait time for reminder
WAIT_SEC=2

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
TCL_FOLDER=`zip -sf $TARBALL_NAME | head -n 2 | tail -n 1`
TCL_FOLDER=`echo $TCL_FOLDER | sed 's/ *$//g' | sed 's/^ *//g'`
TCL_FOLDER=${TCL_FOLDER%/}
echo -e "[${INFO}] TCL_FOLDER is: $TCL_FOLDER"
# Step 1.1: Check whether the folder for installation exists in PREFIX_BASE
#           If it doesn't exist, create it
INSTALL_TO_PATH="${PREFIX_BASE}/${INSTALL_DIR_NAME}"
if [[ ! -e $INSTALL_TO_PATH ]]; then
    echo -e "[${INFO}] Create install folder as it doesn't exist: $INSTALL_TO_PATH"
    mkdir -p $INSTALL_TO_PATH
else
    echo -e "[${INFO}] Install folder exists: $INSTALL_TO_PATH"
fi
echo -e "[${INFO}] Tcl binary will be installed into $INSTALL_TO_PATH"


# Step 2.0: Before decompressed, check whether it has 
#           already been decompressed or not?
# Step 2.1: decompress the tarball of python source
BUILD_PATH="${TARBALL_PATH}/${TCL_FOLDER}"
echo -e "[${INFO}] Check if build folder exists: $BUILD_PATH"
if [[ -d $BUILD_PATH ]]; then
    echo -e "[${INFO}] Tarball has already been decompressed"
else
    echo -e "[${INFO}] Tarball hasn't been decompressed yet, ready to decompress"
    echo -e -n "[${INFO}] Decompressing... "
    unzip -q $TARBALL
    echo -e "Done"
fi

if [[ ! -d $BUILD_PATH ]]; then
    echo -e "[$ERROR] Can't create or find build path, exit"
    exit
fi

TIMECHK_BEFORE_CONFIG=$SECONDS
# Step 3.0: Cgdb needs autogen.sh being executed first
# Step 3.1: Change to build path and configure
cd $BUILD_PATH
echo -e "[${INFO}] Change dir to $BUILD_PATH"
echo -e "[$WARNING] Executing autogen.sh first ..."
sleep $WAIT_SEC
if [[ -e ./autogen.sh ]]; then
    if [[ $TESTMODE -ne 1 ]]; then
        echo -e "[$INFO] Start autogen"
        bash ./autogen.sh
        echo -e "[$INFO] End autogen"
    else
        echo -e "[$WARNING] Test-mode, skip autogen"
    fi
else
    echo -e "[$ERROR] Can't find file autogen.sh, exit"
    exit 1
fi

echo -e "[$WARNING] Takes a while to configure..."
sleep $WAIT_SEC
if [[ -e ./configure ]]; then
    if [[ $TESTMODE -ne 1 ]]; then
        echo "[$INFO] Start configuration"
        ./configure --prefix="$INSTALL_TO_PATH"
        echo -e "[${INFO}] Configuration done"
    else
        echo -e "[$WARNING] Test-mode, skip configuration"
    fi
else
    echo -e "[$ERROR] Can't find configure file, exit"
    exit
fi
TIMECHK_AFTER_CONFIG=$SECONDS

# Step 4.0: make
echo -e "[$WARNING] Takes a while to build..."
sleep $WAIT_SEC
TIMECHK_BEFORE_MAKE=$SECONDS
if [[ $TESTMODE -ne 1 ]]; then
    echo -e "[${INFO}] Start building..."
    make
    echo -e "[${INFO}] Build done"
else
    echo -e "[$WARNING] Test-mode, skip building"
fi
TIMECHK_AFTER_MAKE=$SECONDS

# Step 4.0: make install
echo -e "[$WARNING] Takes a while to install..."
sleep $WAIT_SEC
TIMECHK_BEFORE_MAKEINSTALL=$SECONDS
if [[ $TESTMODE -ne 1 ]]; then
    echo -e "[${INFO}] Start installing..."
    make install
    echo -e "[${INFO}] Installation done"
else
    echo -e "[$WARNING] Test-mode, skip Installation"
fi
TIMECHK_AFTER_MAKEINSTALL=$SECONDS

# Final step, go back to where I came from
echo -e "[${INFO}] All finished, go back to original path"
cd $curpath

t1=`expr $TIMECHK_AFTER_CONFIG - $TIMECHK_BEFORE_CONFIG`
t2=`expr $TIMECHK_AFTER_MAKE - $TIMECHK_BEFORE_MAKE`
t3=`expr $TIMECHK_AFTER_MAKEINSTALL - $TIMECHK_BEFORE_MAKEINSTALL`
echo -e "[$INFO]"
echo -e "[$INFO] -------------------------"
echo -e "[$INFO] Configuration time: $t1 sec"
echo -e "[$INFO] Building time: $t2 sec"
echo -e "[$INFO] Install time: $t3 sec"
echo -e "[$INFO] -------------------------"
