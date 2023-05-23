#!/bin/bash

# assumes that tmux is 3.2a

PYTHON_2_NODE_HOST="\/usr\/bin\/python3"
PYTHON_3_NODE_HOST="\/usr\/bin\/python3"
NEOVIM_NODE_HOST="\/home\/linuxbrew\/.linuxbrew\/bin\/neovim-node-host"

sed "s/PYTHON_2_NODE_HOST/$PYTHON_2_NODE_HOST/g" .vimrc | \
    sed "s/PYTHON_3_NODE_HOST/$PYTHON_3_NODE_HOST/g" | \
    sed "s/NEOVIM_NODE_HOST/$NEOVIM_NODE_HOST/g" > ~/.vimrc

cp .tmux.conf ~/

# neovim
npm install -g neovim # for node host
sudo yum install neovim # for neovim
# neovim

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim plug

# poetry
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="/home/ec2-user/.local/bin:$PATH"' >> ~/.zshrc
# poetry

brew install ripgrep fzf gh

vim +PlugInstall +qall

git config --global user.email "niolenelson@gmail.com"
git config --global user.name "niole"

echo "Please run the following command in vim in order to setup copilot. See https://github.com/github/copilot.vim for other Qs."
echo ":Copilot setup"
