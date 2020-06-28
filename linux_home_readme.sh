#########################################################################################################
#
# CONTENT
#
#########################################################################################################
#
# I.   Adjust font size
# II.  Mount a shared folder from host(win10) to virtual machine
#      Mount automatically
# III. Install boost (steps)
# IV.  Building Python from source
#
#
## Scale font size since display has very high resolution
gsettings set org.gnome.desktop.interface text-scaling-factor 1.5

## Mount a shared folder from Host(windows10)
## Should use root privilege
# vmhgfs-fuse .host:/VirtualMachinesDataShare /mnt/hgfs/vmWinShare
#
## Mount automatically
# 1. vim /etc/fstab
# 2. Add:
#   .host:/VirtualMachinesDataShare /mnt/hgfs/vmWinShare fuse.vmhgfs-fuse allow_other,defaults 0 0
#
## unmount
# umount /mnt/hgfs/vmWinShare


##########################
# Install boost in linux
##########################
# Build Boost.Build engine
cd <PATH_TO_BOOST>/boost_1_72_0/
./bootstrap.sh --with-libraries=all --with-toolset=gcc
# Build boost libraries, which might take a while
./b2 toolset=gcc
# After build complete, following message will be print out
# The Boost C++ Libraries were successfully built!
# 
# The following directory should be added to compiler include paths:
# 
#     /home/pyrad/procs/boost_1_72_0
# 
# The following directory should be added to linker library paths:
# 
#     /home/pyrad/procs/boost_1_72_0/stage/lib
# Install(copy) libraries into some place
./b2 install --prefix=<SOME_USER_PATH>


##############################
# Building Python from source
##############################
1. download tcl/tk source tar ball, make and install to a specified path
   [tcl]
   tar zxf tcl8.6.10-src.tar.gz
   cd tcl8.6.10-src/unix
   ./configure --prefix=/home/pyrad/procs/tcl8.6.10
   make
   make install

   [tk]
   tar zxf tk8.6.10
   cd tk8.6.10/unix
   ./configure --prefix=/home/pyrad/procs/tk8.6.10
   make
   make install

2. download the tar ball of python source (version 2.7 or version 3.8)
   tar zxf Python-3.8.1.tar.gz
   cd Python-3.8.1

3. Configure as below to include the tcl/tk libs
   ./configure --prefix=/home/pyrad/procs/python38 \
	       --enable-optimizations \
	       --with-lto \
	       --enable-shared \
	       --with-tcltk-includes="-I/home/pyrad/procs/tcl8.6.10/include -I/home/pyrad/procs/tk8.6.10/include" \
	       --with-tcltk-libs="-L/home/pyrad/procs/tcl8.6.10/lib -ltcl8.6 -L/home/pyrad/procs/tk8.6.10/lib -ltk8.6"
4. make && make install



##############################
# Install newer version of gcc
# take gcc8 as an example
##############################
# 1. Login as root
#    $ su
# 
# 2. Install scl
#    $ install centos-release-scl scl-utils-build
# 
# 3. check if there's the tool set in the repo list
#    $ yum list all --enablerepo='centos-sclo-rh' | grep "devtoolset-"
# 
# 4. Install
#    $ yum install -y devtoolset-8-toolchain
#
# 5. Must enable first, otherwise the newer version can't be found 
#    $ scl enable devtoolset-8 bash
#
# 6. Check where it is installed
#    $ rpm -qa | grep "gcc"
#
#    For example, it might be installed into path below:
#    /opt/rh/devtoolset-8/root/usr/bin/


##############################
# Install build-essentials for ubuntu
##############################
1. Step 1: Installing compilers using apt command
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install build-essential

2. Step 2: Installing the dev man pages on a Ubuntu Linux
$ sudo apt-get install manpages-dev man-db manpages-posix-dev

3. Step 3: Installing the X11 development compilers
$ sudo apt install libx11-dev

####################################
# Gvim can not be compiled on Ubuntu
####################################
# One case I encountered is that I need to install libxaw7-dev,
# it will install some file to /usr/include/X11/Xaw/*. (using sudo apt-get install libxaw7-dev)
# While if I used "apt-cache search xaw", libxaw7-dev didn't showed up, very strange.
# Finally I realized that the some packages in the mirror that my OS referred to is missing,
# so I go to the Ali mirror(https://developer.aliyun.com/mirror/ubuntu?spm=a2c6h.13651102.0.0.3e221b11TjzTEt)
# to change the source.list, after that I update the apt using "apt-get update", then I again searched it
# using command "apt-cache search xaw", and it showed up!!! What a shit mirror I used!!
#
# Here are the content of /etc/apt/source.list for Ubuntu 20.04 LTS
# -----------------------
# deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
# 
# deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
# 
# deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
# 
# deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
# 
# deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse

# -----------------------
# Final configure command
# ./configure --with-features=huge --enable-python3interp --with-python3-config-dir=/home/pyrad/procs/python38/lib/python3.8/config-3.8-x86_64-linux-gnu --with-tlib=ncurses --enable-fontset --enable-perlinterp --enable-cscope --enable-multibyte --prefix=/home/pyrad/procs/vim82 --enable-gui=gtk3 --with-compiledby="Pyrad Selong"
# make
# make install
#
# [Note] that use gtk3 on condition that libgtk-3-dev has already been installed



