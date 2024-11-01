#!/bin/bash

# assumes that tmux is 3.2a

PYTHON_2_NODE_HOST="\/usr\/bin\/python3"
PYTHON_3_NODE_HOST="\/usr\/bin\/python3"
NEOVIM_NODE_HOST="\/home\/linuxbrew\/.linuxbrew\/bin\/neovim-node-host"

sed "s/PYTHON_2_NODE_HOST/$PYTHON_2_NODE_HOST/g" .vimrc | \
    sed "s/PYTHON_3_NODE_HOST/$PYTHON_3_NODE_HOST/g" | \
    sed "s/NEOVIM_NODE_HOST/$NEOVIM_NODE_HOST/g" > ~/.vimrc

cp .tmux.conf ~/
cp ../git.plugin.sh ~/

sudo apt install curl vim neovim ripgrep gh tmux

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# install fzf

# neovim
npm install -g neovim # for node host
# neovim

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim plug

vim +PlugInstall +qall

git config --global user.email "niolenelson@gmail.com"
git config --global user.name "niole"

cat ../common_postinstall_messages.txt
