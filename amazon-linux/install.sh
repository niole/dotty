#!/bin/bash

# assumes that tmux is 3.2a

PYTHON_2_NODE_HOST="/usr/bin/python3"
PYTHON_3_NODE_HOST="/usr/bin/python3"
NEOVIM_NODE_HOST="/home/linuxbrew/.linuxbrew/bin/neovim-node-host"

sed "s/PYTHON_2_NODE_HOST/$PYTHON_2_NODE_HOST/g" .vimrc | \
    sed "s/PYTHON_3_NODE_HOST/$PYTHON_3_NODE_HOST/g" | \
    sed "s/NEOVIM_NODE_HOST/$NEOVIM_NODE_HOST/g" > ~/.vimrc

cp .tmux.conf ~/

npm install -g neovim-node-host
sudo yum install neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
brew install ripgrep

nvim +PlugInstall +qall


