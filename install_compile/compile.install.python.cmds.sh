#!/bin/bash -

TIMECHK0=$SECONDS
########################################
#### The following must be specified
########################################
#### Prerequisites: tcl & tk
TCL_HOME='/home/pyrad/procs/tcl8.6.17'
TK_HOME='/home/pyrad/procs/tk8.6.17'

#### Base path where all programs are installed into
PREFIX_BASE='/home/pyrad/proc'

#### Where is the tarball?
TARBALL='/home/pyrad/swap/Python-3.13.7.tgz'

#### Test mode? If it is, configure, make and
#### make install will be skipped to avoid wasting
#### time for test
TESTMODE=0

#### How many cores to compile?
n_cpu=4

#### wait time for reminder
WAIT_SEC=1

#### Path to openssl root path
SSL_SEARCH_PATH='/home/pyrad/proc/openssl3.5.2'

#### GCC
GCC_PATH="/usr/bin"
CXX_BIN="${GCC_PATH}/g++"
CC_BIN="${GCC_PATH}/gcc"

#### tcl & tk include files & libs
TCL_INC="$TCL_HOME/include"
TCL_LIB="$TCL_HOME/lib"
TCL_LIB_NAME="tcl8.6"

#### Set 2 variables so Python configure can aware of it
export TCLTK_CFLAGS="-I${TCL_INC} -I${TK_INC}"
export TCLTK_LIBS="-L$TCL_LIB -L$TK_LIB -l${TCL_LIB_NAME} -l${TK_LIB_NAME}"


# export LDFLAGS="-L${SSL_SEARCH_PATH}/lib64 -lssl -lpthread -ldl -Wl,--rpath=${SSL_SEARCH_PATH}/lib64:${INSTALL_TO_PATH}/lib"
# export CFLAGS="-I${SSL_SEARCH_PATH}/include"

# LDFLAGS_VAL="-L${SSL_SEARCH_PATH}/lib64"
# LDFLAGS_VAL="$LDFLAGS -lssl -lpthread -ldl"
# LDFLAGS_VAL="$LDFLAGS -Wl,--rpath=${SSL_SEARCH_PATH}/lib64:${INSTALL_TO_PATH}/lib"
# export LDFLAGS=$LDFLAGS_VAL

########################################
#### End setting variables before compile
########################################

TK_INC="$TK_HOME/include"
TK_LIB="$TK_HOME/lib"
TK_LIB_NAME="tk8.6"

# Path of tarball
TARBALL_PATH=`dirname $TARBALL`
TARBALL_PATH=${TARBALL_PATH%/}
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


# Check if gcc and g++ exist
if [[ -f $GXX_BIN ]]; then
    echo -e "[${ERROR}] GXX_BIN is set to $GXX_BIN, but it does not exist, please check."
    exit 1
else
    echo -e "[${INFO}] GXX_BIN is set to $GXX_BIN, it exists."
fi
if [[ -f $GCC_BIN ]]; then
    echo -e "[${ERROR}] GCC_BIN is set to $GCC_BIN, but it does not exist, please check."
    exit 1
else
    echo -e "[${INFO}] GCC_BIN is set to $GCC_BIN, it exists."
fi


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
PY_FOLDER=${PY_FOLDER%/}
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


# Set rpath option by LDFLAGS
LDFLAGS_VAL="-L${SSL_SEARCH_PATH}/lib64"
LDFLAGS_VAL="$LDFLAGS -lssl -lpthread -ldl"
LDFLAGS_VAL="$LDFLAGS -Wl,--rpath=${SSL_SEARCH_PATH}/lib64:${INSTALL_TO_PATH}/lib"
export LDFLAGS=$LDFLAGS_VAL


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
    tar -zxf $TARBALL
    echo -e "Done"
fi

if [[ ! -d $BUILD_PATH ]]; then
    echo -e "[$ERROR] Can't create or find build path, exit"
    exit
fi

TIMECHK_BEFORE_CONFIG=$SECONDS
# Step 3.0: Change to build path and configure
cd $BUILD_PATH
echo -e "[${INFO}] Change dir to $BUILD_PATH"
echo -e "[$WARNING] Takes a while to configure..."
sleep $WAIT_SEC
CONFIG_EXEC_FILE=./configure
if [[ -e $CONFIG_EXEC_FILE ]]; then
    if [[ $TESTMODE -ne 1 ]]; then
        echo "[$INFO] Start configuration"
        # ./configure --prefix="${INSTALL_TO_PATH}" \
        #    --enable-optimizations --with-lto \
        #    --with-ssl \
        #    --enable-shared --with-tcltk-includes="-I${TCL_INC} -I${TK_INC}" \
        #    --with-tcltk-libs="-L${TCL_LIB} -L${TK_LIB} -l${TCL_LIB_NAME} -l${TK_LIB_NAME}"

        $CONFIG_EXEC_FILE --prefix=${INSTALL_TO_PATH} \
           --enable-optimizations \
           --with-lto \
           CXX=${CXX_BIN} CC=${CC_BIN} \
           --enable-shared \
           --with-openssl=$SSL_SEARCH_PATH \
           --with-openssl-rpath=${SSL_SEARCH_PATH}/lib64 \

        if [[ $? -eq 0 ]]; then
           echo -e "[${INFO}] Configuration done (without error)"
        else
           echo -e "[${INFO}] Configuration failed (error occurred)"
           exit 1
        fi

        echo -e "[${INFO}] Configuration done"
    else
        echo -e "[$WARNING] Test-mode, skip configuration"
    fi
else
    echo -e "[$ERROR] Can't find configure file, exit"
    exit
fi
TIMECHK_AFTER_CONFIG=$SECONDS

echo -e "[$WARNING] Takes a while to build..."
sleep $WAIT_SEC
TIMECHK_BEFORE_MAKE=$SECONDS
if [[ $TESTMODE -ne 1 ]]; then
    echo -e "[${INFO}] Start building..."
    make -j $n_cpu
    echo -e "[${INFO}] Build done"
else
    echo -e "[$WARNING] Test-mode, skip building"
fi
TIMECHK_AFTER_MAKE=$SECONDS

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
echo -e "[$INFO] Configuration time: $t1"
echo -e "[$INFO] Building time: $t2"
echo -e "[$INFO] Install time: $t3"
echo -e "[$INFO] -------------------------"
