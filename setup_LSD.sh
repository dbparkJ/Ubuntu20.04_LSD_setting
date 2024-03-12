#!/bin/bash
# Eigen 3.3.7
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz
tar -xzvf eigen-3.3.7.tar.gz
cd eigen-3.3.7
mkdir build && cd build
cmake ..
make -j 16
sudo make -j 16 install
cd
rm eigen-3.3.7.tar.gz
rm -rf eigen-3.3.7
# ceres-solver-1.14.0 
wget http://ceres-solver.org/ceres-solver-1.14.0.tar.gz
tar -xzvf ceres-solver-1.14.0.tar.gz
cd ceres-solver-1.14.0
mkdir build && cd build
cmake ..
make -j 16
sudo make -j 16 install
cd
rm ceres-solver-1.14.0.tar.gz
rm -rf ceres-solver-1.14.0
# protobuf
git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf
git checkout v3.8.0
./autogen.sh
./configure
make -j 16
sudo make -j 16 install
sudo ldconfig
cd
rm -rf protobuf
#NLopt 2.4.2
sudo apt-get -y install libnlopt-dev

#g2o
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o
mkdir build && cd build
cmake ..
make -j 16
sudo make -j 16 install
cd
rm -rf g2o

#opencv 4.5.5 && opencv_contrib-4.5.5
mkdir opencv && cd opencv
wget https://github.com/opencv/opencv/archive/4.5.5/opencv-4.5.5.tar.gz
tar -xzvf opencv-4.5.5.tar.gz
wget https://github.com/opencv/opencv_contrib/archive/4.5.5/opencv_contrib-4.5.5.tar.gz
tar -xzvf opencv_contrib-4.5.5.tar.gz
cd opencv-4.5.5
mkdir build && cd build
cmake -DOPENCV_EXTRA_MODULES_PATH=~/opencv/opencv_contrib-4.5.5/modules ~/opencv/opencv-4.5.5
make -j 16
sudo make -j 16 install
sudo ldconfig
cd
rm -rf opencv

#boost
wget https://boostorg.jfrog.io/artifactory/main/release/1.84.0/source/boost_1_84_0.tar.gz
tar -xvzf boost_1_84_0.tar.gz
cd boost_1_84_0
./bootstrap.sh --with-python=python3
sudo ./b2 install
cd
rm -rf boost_1_84_0.tar.gz

#libflann-dev
sudo apt-get -y install libflann-dev
#vtk
sudo apt-get install -y libvtk7-dev
#libusb-1.0
sudo apt-get install -y libusb-1.0-0-dev
#openGL
sudo apt-get install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev

#pcl-1.9.1
wget https://github.com/PointCloudLibrary/pcl/archive/refs/tags/pcl-1.9.1.tar.gz
tar -xvzf pcl-1.9.1.tar.gz
cd pcl-pcl-1.9.1
mkdir build && cd build
cmake ..
make -j 16
sudo make -j 16 install
sudo ldconfig
cd
rm -rf pcl-1.9.1.tar.gz
rm -rf pcl-pcl-1.9.1
echo "Now reboot system to apply changes"
