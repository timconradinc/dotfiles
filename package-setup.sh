#!/bin/bash

mkdir -p ${HOME}/{bin,lib,workspace,tmp}
sudo apt-get install python-software-properties lib32gcc1 libc6-dev-i386 python-pip python-setuptools python-dev screen vim bzr subversion build-essential unrar rcs exuberant-ctags perltidy pyflakes curl iotop atop
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-add-repository ppa:rwky/redis
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install ruby1.9.1 ruby1.9.1-dev rake rubygems ruby-switch
git clone https://github.com/timconradinc/dotfiles.git
