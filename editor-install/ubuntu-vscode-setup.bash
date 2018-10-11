#! /bin/bash

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo apt-get install code

# Language Extentions
code --install-extention truman.autocomplate-shell
code --install-extention ms-python.python
code --install-extention ms-vscode.cpptools
code --install-extention twxs.cmake
code --install-extention vector-of-bool.cmake-tools
code --install-extention dotjoshjohnson.xml

# Install Extentions based on here(https://qiita.com/sensuikan1973/items/74cf5383c02dbcd82234)
code --install-extention robertohuertasm.vscode-icons
code --install-extention eamodio.gitlens
code --install-extention donjayamanne.githistory
code --install-extention coenraads.bracket-pair-colorizer
code --install-extention ionutvmi.path-autocomplete
code --install-extention mechatroner.rainbow-csv
code --install-extention rogalmic.bash-debug
code --install-extention shardulm94.trailing-spaces

# Extentions for ROS
code --install-extention pijar.ros-snippets
code --install-extention ajshort.ros
code --install-extention ajshort.msg