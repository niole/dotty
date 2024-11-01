#!/bin/bash

# assumes that tmux is 3.2a

# check for brew
if [[ ! $(which brew) ]]
then
    echo "You must install brew"
    exit 1
fi

PYTHON_2_NODE_HOST="\/usr\/bin\/python3"
PYTHON_3_NODE_HOST="\/usr\/bin\/python3"
NEOVIM_NODE_HOST="\/home\/linuxbrew\/.linuxbrew\/bin\/neovim-node-host"

sed "s/PYTHON_2_NODE_HOST/$PYTHON_2_NODE_HOST/g" .vimrc | \
    sed "s/PYTHON_3_NODE_HOST/$PYTHON_3_NODE_HOST/g" | \
    sed "s/NEOVIM_NODE_HOST/$NEOVIM_NODE_HOST/g" > ~/.vimrc

cp .tmux.conf ~/
cp ../git.plugin.sh ~/

brew install neovim ripgrep gh tmux node

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
