#!/bin/bash

# requires that tmux is 3.2a or greater

PYTHON_2_NODE_HOST="\/usr\/bin\/python3"
PYTHON_3_NODE_HOST="\/usr\/bin\/python3"
NEOVIM_NODE_HOST="\/home\/linuxbrew\/.linuxbrew\/bin\/neovim-node-host"

sed "s/PYTHON_2_NODE_HOST/$PYTHON_2_NODE_HOST/g" .vimrc | \
    sed "s/PYTHON_3_NODE_HOST/$PYTHON_3_NODE_HOST/g" | \
    sed "s/NEOVIM_NODE_HOST/$NEOVIM_NODE_HOST/g" > ~/.vimrc

cp .tmux.conf ~/

echo "Install brew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/$USER/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "Install node and npm"
sudo dnf install nodejs tmux

# neovim
echo "Install neovim"
sudo npm install -g neovim # for node host
sudo yum install neovim # for neovim
# neovim

# vim plug
echo "Install vimplug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim plug

# poetry
echo "Install poetry"
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="/home/ec2-user/.local/bin:$PATH"' >> ~/.zshrc
# poetry

echo "Install stuff from brew"
brew install ripgrep fzf gh

vim +PlugInstall +qall

git config --global user.email "niolenelson@gmail.com"
git config --global user.name "niole"

cat ../common_postinstall_messages.txt
