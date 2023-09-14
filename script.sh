#!/bin/bash

#Update source list
apt-get update

#Install vim
apt-get install vim -y

#Install ctags
apt-get install exuberant-ctags -y || apt-get install ctags -y

#Install cscope
apt-get install cscope -y

#Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp ./.vimrc /"$(whoami)"

cd /"$(whoami)"

#Install vundle plugin
vim +PluginInstall +qall

#
mkdir -p ~/.vim/pack/plugins/start
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp
