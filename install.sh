#!/bin/bash 

BUNDLE=~/.vim/bundle 
git clone git@github.com:jaesivsm/liquidprompt.git
cp bashrc ~/.bashrc 


cp vimrc ~/.vimrc 
mkdir -p $BUNDLE
cd $BUNDLE
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/python-rope/ropevim.git

