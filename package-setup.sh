#!/bin/bash

mkdir -p ${HOME}/{bin,lib,workspace,tmp}
# https://wiki.postgresql.org/wiki/Apt
#sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list.d/pgsql.list
#sudo wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -

sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-add-repository ppa:rwky/redis
sudo apt-add-repository ppa:webupd8team/java
sudo apt-add-repository ppa:fish-shell/release-2
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update

sudo apt-get install python-software-properties lib32gcc1 libc6-dev-i386 python-pip python-setuptools python-dev screen vim bzr subversion build-essential unrar rcs exuberant-ctags perltidy pyflakes curl iotop atop
sudo apt-get install ruby1.9.1 ruby1.9.1-dev rake fish
git clone https://github.com/timconradinc/dotfiles.git
