#!/bin/bash
rm -rf ~/.vim ~/.bash_prompt
mkdir -p ~/.vim/autoload ~/.vim/bundle

git submodule update

for f in cows vimrc bashrc bash_aliases profile gitconfig gitignore; do
    rm -rf ~/.$f
    ln -vs $PWD/$f ~/.$f
done

ln -vs $PWD/liquidprompt/liquidprompt ~/.bash_prompt
ln -vs $PWD/syntastic ~/.vim/bundle/syntastic
#ln -vs $PWD/ropevim ~/.vim/bundle/ropevim

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
