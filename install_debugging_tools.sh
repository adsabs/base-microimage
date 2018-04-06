#!/bin/bash
set -e
set -x
export DEBIAN_FRONTEND=noninteractive
add-apt-repository -y ppa:jonathonf/vim
apt-get update
apt-get install -y --no-install-recommends vim postgresql-client redis-tools
pip install --upgrade pudb==2017.1.4 pytest-pudb==0.5 ipython==5.5.0 
mkdir -p /root/.vim/undodir/
mkdir -p /root/.vim/spell/
mkdir -p /root/.vim/autoload/
wget --quiet https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O /root/.vim/autoload/plug.vim
wget --quiet https://raw.githubusercontent.com/marblestation/vim-complex-sensible/master/vimrc -O /root/.vim/vimrc
ln -s /root/.vim/vimrc /root/.vimrc
vim +"PlugInstall 1" +qall
