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



### git push error
## Once encounter the "Internal Server Error" below, try to use the following commands
# -------------------------------------
#      [pyrad@ssea-ubuntu project_cig]$ git push -u origin master 
#      Enumerating objects: 5, done.
#      Counting objects: 100% (5/5), done.
#      Compressing objects: 100% (3/3), done.
#      Writing objects: 100% (3/3), 332 bytes | 166.00 KiB/s, done.
#      Total 3 (delta 2), reused 0 (delta 0)
#      remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
#      remote: Internal Server Error
#      To github.com:Pyrad/project_cig.git
#       ! [remote failure]  master -> master (remote failed to report status)
#      error: failed to push some refs to 'git@github.com:Pyrad/project_cig.git'
# -------------------------------------
# 1. Rebase
#    $ git pull --rebase origin master
#
#    --> From github.com:Pyrad/project_cig
#    --> * branch            master     -> FETCH_HEAD
#    --> Current branch master is up to date.
# 2. Push again
#    $ git push origin HEAD:master
#
#    --> Enumerating objects: 5, done.
#    --> Counting objects: 100% (5/5), done.
#    --> Compressing objects: 100% (3/3), done.
#    --> Writing objects: 100% (3/3), 332 bytes | 166.00 KiB/s, done.
#    --> Total 3 (delta 2), reused 0 (delta 0)
#    --> remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
#    --> To github.com:Pyrad/project_cig.git
#    -->    4cc5a30..40a473d  HEAD -> master


######################################################
# "aclocal not found" error when compiling cgdb
######################################################
# when compiling cgdb, it maybe complains that "aclocal" is not found, as below
#    [pyrad@ssea-ubuntu cgdb-master]$ ./autogen.sh 
#    -- Update configure.in to reflect the new version number
#    -- Running aclocal
#    ./autogen.sh: 15: aclocal: not found
#    
# This maybe the reason that the 'automake' is not installed in machine, so
#    $ sudo apt-get install automake

######################################################
# Install fonts in linux without root privilege
######################################################
# 1. Create directory ~/.fonts, and download font files inside
#    mkdir ~/.fonts
#    cp <*.ttf> ~/.fonts/

# 2. Execute command fc-cache
#    fc-cache -vf ~/.fonts


######################################################
# VM palyer drag-and-drop issue
######################################################
# After copying files in windows(host), if you switch to
# linux(guest, virtual machine), then the VM Player will
# automatically copy the file from windows to linux, which is
# to say VM Player will automatically copy files from host
# to guest without your permission!!
# Terrible!
# I have not figured out a solution to disable it, but now
# files will be copied to the following directoies, which can
# be deleted to free some space
# Dir1: /var/run/vmblock-fuse/blockdir/*
# Dir2: ~/.cache/vmware/drag_and_drop/*

######################################################
# OpenSUSE packages installed by root
######################################################
  8  2020-07-06 17:07:21 zypper install -t pattern devel_C_C++
 21  2020-07-09 08:49:02 zypper install gvim
 23  2020-07-09 08:49:35 zypper install tkdiff
 57  2020-07-09 09:14:05 zypper install p7zip
 61  2020-07-09 13:45:56 zypper install libX11-devel
 77  2020-07-10 13:05:42 zypper install libXaw7
 78  2020-07-10 13:06:16 zypper install libXaw7-debuginfo 
 80  2020-07-10 13:07:57 zypper install libXaw-devel
 83  2020-07-10 13:28:55 zypper install libXdmcp-devel
 85  2020-07-10 13:29:33 zypper install libnsl-devel
 89  2020-07-10 13:36:41 zypper install libelf-devel
 91  2020-07-13 08:57:03 zypper install gnome-terminal
 94  2020-07-13 09:09:13 zypper install readline-devel
 97  2020-07-13 09:11:08 zypper install readline6
 98  2020-07-13 09:11:27 zypper install libreadline7
100  2020-07-13 09:12:34 zypper install readline-devel
105  2020-07-15 08:48:20 zypper install gitg
108  2020-07-20 08:37:25 history | grep "zypper install" >> /home/pyrad/temp/packages.to.install 
