#! /bin/bash

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo apt-get install code

# Language extensions
code --install-extension truman.autocomplate-shell
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension twxs.cmake
code --install-extension vector-of-bool.cmake-tools
code --install-extension dotjoshjohnson.xml

# Install extensions based on here(https://qiita.com/sensuikan1973/items/74cf5383c02dbcd82234)
code --install-extension robertohuertasm.vscode-icons
code --install-extension eamodio.gitlens
code --install-extension donjayamanne.githistory
code --install-extension coenraads.bracket-pair-colorizer
code --install-extension ionutvmi.path-autocomplete
code --install-extension mechatroner.rainbow-csv
code --install-extension rogalmic.bash-debug
code --install-extension shardulm94.trailing-spaces
code --install-extension austin.code-gnu-global

# Markdown
code --install-extension yzhang.markdown-all-in-one
code --install-extension yzane.markdown-pdf
code --install-extension bierner.markdown-preview-github-styles

# extensions for ROS
code --install-extension pijar.ros-snippets
code --install-extension ajshort.ros
code --install-extension ajshort.msg