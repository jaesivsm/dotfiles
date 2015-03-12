#!/bin/bash
rm -rf ~/.vim ~/.bash_prompt
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/after

echo "### installing pathogen"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "### updating submodules"
git submodule init
git submodule update

echo "### linking submodules"
ln -vs $PWD/liquidprompt/liquidprompt ~/.bash_prompt
for vim_addon in pyflakes-vim syntastic ctrlp.vim tlib_vim vim-addon-mw-utils vim-colors-solarized vim-fugitive; do
    ln -vs $PWD/$vim_addon ~/.vim/bundle/$vim_addon
done
ln -vs $PWD/pydoc.vim ~/.vim/after/pydoc.vim


echo "### linking conf files"
for f in cows vimrc bashrc bash_aliases profile gitconfig gitignore; do
    rm -rvf ~/.$f
    ln -vs $PWD/$f ~/.$f
done
rm -v ~/.config/liquidpromptrc
ln -vs $PWD/liquidpromptrc ~/.config/liquidpromptrc
