#! /bin/bash

echo "Before installing, update packages"
sudo apt update -y
sudo apt upgrade -y

echo "Setup your computer to accept software from packages.ros.org."
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

echo "Connecting to key server"
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

echo "Start Updating"
sudo apt-get update -y
echo "Start installing ROS"
sudo apt-get install ros-kinetic-desktop-full -y
sudo apt-get -y install ros-kinetic-rqt* -y

echo "Rosdep initialize"
sudo rosdep init
rosdep update

# Write source command in .bashrc
echo "Updating .bashrc"
source_pass="/opt/ros/kinetic/setup.bash"
if grep  $source_pass ~/.bashrc; then
  echo $source_pass "is already exist."
else
  echo "source "$source_pass >> ~/.bashrc
  source ~/.bashrc
fi

echo "Install other essential packages for ROS."
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential -y

source ~/.bashrc
echo "Making catkin workspace"
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

# Write source command in .bashrc
echo "Updating bashrc"
source_pass="~/catkin_ws/devel/setup.bash"
if grep  $source_pass ~/.bashrc; then
  echo $source_pass "is already exist."
else
  echo "source "$source_pass >> ~/.bashrc
  source ~/.bashrc
fi

# Some Settings for ROS
# By this setting, it does not display ROS time when running nodes.
echo "Setting up ROSCONSOLE FORMAT"
if grep "ROSCONSOLE_FORMAT" ~/.bashrc; then
  echo "ROSCONSOLE_FORMAT has already set up."
else
  echo "export ROSCONSOLE_FORMAT='[\${severity}] \${message}'" >> ~/.bashrc
fi

source ~/.bashrc
echo "Finished!!"
