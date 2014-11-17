#!/bin/bash
rm -rf ~/.vim ~/.bash_prompt
mkdir -p ~/.vim/autoload ~/.vim/bundle

echo "### installing pathogen"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "### updating submodules"
git submodule init
git submodule update

echo "### linking submodules"
ln -vs $PWD/liquidprompt/liquidprompt ~/.bash_prompt
ln -vs $PWD/syntastic ~/.vim/bundle/syntastic
ln -vs $PWD/ropevim ~/.vim/bundle/ropevim

echo "### linking conf files"
for f in cows vimrc bashrc bash_aliases profile gitconfig gitignore; do
    rm -rvf ~/.$f
    ln -vs $PWD/$f ~/.$f
done
rm -v ~/.config/liquidpromptrc
ln -vs $PWD/liquidpromptrc ~/.config/liquidpromptrc


