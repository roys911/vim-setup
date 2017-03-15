#!/bin/bash

# get basic dependencies
apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev \
    python-dev python3-dev checkinstall

# remove default vim if present
apt-get remove -y vim vim-runtime gvim

# clone vim repository
git clone https://github.com/vim/vim.git

# change into vim directory
cd vim

# set configuration settings for vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp=yes \
            --with-python-config-dir=$HOME/miniconda2/lib/python2.7/config \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr

# set vim runtime directory
make VIMRUNTIMEDIR=/usr/share/vim/vim80

# install vim
checkinstall
