#!/bin/bash

if [ -d $HOME/.vim/bundle/Vundle.vim ]
then
  echo 'Vundle.vim exist, skip...'
else
  if command -v git >/dev/null 2>&1; then
    echo "git is installed"
  else
    echo 'git installing'
    if command -v yum >/dev/null 2>&1; then
      yum install git-core || { echo "install git failure"; exit -1; }
      echo "git installed successfully!"
    elif command -v apt-get >/dev/null 2>&1; then
      apt-get update
      apt-get install git || { echo "install git failure"; exit -1; }
      echo "git installed successfully!"
    else
      echo "pls install git first"
      exit -1
    fi
  fi
  echo 'start to clone Vundle.vim...'
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim || { echo "install     Vundle failure";exit -1; }
  echo "vim plugin manager plug installing..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || { echo "install plug  failure";exit -1; }

fi

vim -c 'PlugInstall' -c 'qa!' || { echo "install vim plugin failure"; exit -1; }
echo "vim plugin installed successfully!"

cp -r ~/.vim/bundle/molokai/colors ~/.vim/ || { echo "vim theme [molokai] uninstall. please install  molokai
first."; exit -1; }

echo "download vimrc"
curl -o $HOME/.vimrc https://raw.githubusercontent.com/prerabale/vim-setting/plug/vimrc || { echo  "download vimrc failure"; exit -1; }
echo "finish. have fun!"