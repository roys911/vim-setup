#!/bin/bash

# create .vim directory structure
echo "Creating .vim directory structure in home folder..."
mkdir $HOME/.vim
cd $HOME/.vim
mkdir -v autoload bundle

# install required dependencies
sudo apt-get install -y build-essential curl cmake

# install pathogen in autoload
echo "-------------------------------"
echo "Installing pathogen..."
echo "-------------------------------"
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install vim airline
echo "----------------------------------------"
echo "Installing vim-airline and themes..."
echo "----------------------------------------"
git clone https://github.com/vim-airline/vim-airline $HOME/.vim/bundle/vim-airline

# install vim airline themes
git clone https://github.com/vim-airline/vim-airline-themes \
          $HOME/.vim/bundle/vim-airline-themes

# install vivid chalk color theme
echo "------------------------------------------"
echo "Installing vivid chalk color scheme..."
echo "------------------------------------------"
git clone https://github.com/tpope/vim-vividchalk.git
cp -Rv vim-vividchalk/colors .
sudo rm -rv vim-vividchalk

# install syntastic
echo "-----------------------------"
echo "Installing syntasic..."
echo "-----------------------------"
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git \
          $HOME/.vim/bundle/syntastic

# install auto-pairs
echo "-----------------------------"
echo "Installing auto pairs..."
echo "-----------------------------"
git clone git://github.com/jiangmiao/auto-pairs.git $HOME/.vim/bundle/auto-pairs

# install SimpylFold
echo "-----------------------------"
echo "Installing SymplFold..."
echo "-----------------------------"
git clone https://github.com/tmhedberg/SimpylFold.git $HOME/.vim/bundle/SimpylFold
cp -Rv bundle/SimpylFold/ftplugin .

# install youcompleteme
echo "-----------------------------"
echo "Installing YouCompleteMe..."
echo "-----------------------------"
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python install.py
cd ..

# install nerdtree
echo "-----------------------------"
echo "Installing NerdTree..."
echo "-----------------------------"
git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree

echo "------------------------------"
echo "All dependencies installed."
echo "------------------------------"
