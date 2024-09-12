#!/bin/bash

#Update source list
sudo apt-get update

#Install vim
sudo apt-get install vim -y

#Install screen
sudo apt-get install screen -y

#Install ctags
sudo apt-get install exuberant-ctags -y || sudo apt-get install ctags -y

#Install cscope
sudo apt-get install cscope -y

#Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Install ack
sudo apt-get install ack -y

echo "my home is $HOME"

cp ./.vimrc /"$HOME"
cp ./.screenrc /"$HOME"

cd /"$HOME"

#Install vundle plugin
vim +PluginInstall +qall

# CtrlP install
mkdir -p ~/.vim/pack/plugins/start
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp
