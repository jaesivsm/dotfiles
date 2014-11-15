#!/bin/bash
rm -rf ~/.vim ~/.cows ~/.vimrc ~/.bashrc ~/.bash_aliases ~/.bash_prompt
mkdir -p ~/.vim/autoload ~/.vim/bundle

git submodule update

ln -vs $PWD/cows ~/.cows
ln -vs $PWD/vimrc ~/.vimrc
ln -vs $PWD/bashrc ~/.bashrc
ln -vs $PWD/bash_aliases ~/.bash_aliases

ln -vs $PWD/liquidprompt/liquidprompt ~/.bash_prompt
ln -vs $PWD/syntastic ~/.vim/bundle/syntastic
#ln -vs $PWD/ropevim ~/.vim/bundle/ropevim

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
