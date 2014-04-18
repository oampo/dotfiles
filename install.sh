#!/bin/bash

dir=~/Code/dotfiles # dotfiles directory
olddir=~/Code/dotfiles.bak # old dotfiles backup directory
files="vimrc tmux.conf gitignore" # list of files/folders to symlink in homedir

##########

# create dotfiles_old
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

vim +PluginInstall +qall
