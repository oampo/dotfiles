#!/bin/bash

dir=$(cd `dirname $0` && pwd) # dotfiles directory
cd -
files="vimrc tmux.conf gitignore" # list of files/folders to symlink in homedir

##########
echo $dir;

cd ~
for file in $files; do
    rm -f .$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file .$file
done

mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +PluginInstall +qall
