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




