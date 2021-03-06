#!/bin/bash

version=1.10.0
build_dir=~/openmpi_$version_build
install_dir=/usr/local/mpi/gcc/openmpi/$version

mkdir -p $install_dir

if [ -e openmpi-$version.tar.gz ]
then
  echo "Install tarball exists. Download not required."
else
  echo "Downloading source"
  wget http://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-$version.tar.gz
fi

tar -xzf openmpi-$version.tar.gz
cd openmpi-$version
./configure --prefix=$install_dir
make -j16
make check
make install

