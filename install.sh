#!/bin/bash
echo "[vim-setting]: download vimrc"
curl -o $HOME/.vimrc https://raw.githubusercontent.com/prerabale/vim-setting/plug/vimrc || { echo "download vimrc failure"; exit -1; }

echo "[vim-setting]: vim plugin manager plug installing..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || { echo "install plug        failure";exit -1; }


vim -c 'PlugInstall' -c 'qa!' || { echo "install vim plugin failure"; exit -1; }
echo "[vim-setting]: vim plugin installed successfully!"

# cp -r ~/.vim/bundle/molokai/colors ~/.vim/ || { echo "vim theme [molokai] uninstall. please        install molokai first."; exit -1; }

echo "[vim-setting]: install successfully. have fun!"