#!/bin/bash

#Update source list
apt-get update

#Install vim
apt-get install vim -y

#Install ctags
apt-get install exuberant-ctags -y

#Install cscope
apt-get install cscope -y

#Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd /"$(whoami)"

#Install vundle plugin
vim +PluginInstall +qall
