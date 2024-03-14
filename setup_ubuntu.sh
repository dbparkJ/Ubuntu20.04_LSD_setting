#!/bin/bash
# bash .sh file link -> https://github.com/changh95/setup_ubuntu
# nvidia-driver link -> https://lee-jaewon.github.io/ubuntu/CUDA/ && https://pstudio411.tistory.com/entry/Ubuntu-2004-Nvidia%EB%93%9C%EB%9D%BC%EC%9D%B4%EB%B2%84-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0

# Update system
sudo apt-get -y update
sudo apt-get -y upgrade

# pip3
sudo apt install -y python3-pip #pip update

# Install programs
sudo apt-get -y install ubuntu-unity-desktop # Ubuntu renderer
# sudo snap install clion --classic # CLion IDE
# sudo snap install pycharm-community --classic # Pycharm Community IDE

wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb # Google Chrome
sudo apt -y install ./google-chrome-stable_current_amd64.deb
sudo rm -rf ./google-chrome-stable_current_amd64.deb

# install utils
sudo apt-get install -y build-essential cmake git pkg-config libgoogle-glog-dev libgflags-dev
sudo apt-get install -y libatlas-base-dev autoconf automake libtool curl make unzip
sudo apt-get install -y vim # vim
sudo apt install -y openssh-server # install ssh
sudo ufw allow ssh
sudo apt-get install htop #htop
sudo apt install net-tools #ifconfig
sudo apt-get -y install environment-modules #modules
sudo apt-get install module-assistant

# Docker
sudo apt-get -y remove docker docker-engine docker.io containerd runc
sudo apt-get -y install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER

#nouveau off
echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/blacklist.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist.conf
sudo update-initramfs -u

#nvidia-install
sudo apt install -y nvidia-driver-525 # if you change driver-version command 'ubuntu-drivers devices' and find hope version
#command mok pw limit 8 character

# ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install -y ros-noetic-desktop-full
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install -y python3-rosdep
sudo rosdep init
rosdep update

# Finished
echo "Now reboot system to apply changes"
sudo reboot
