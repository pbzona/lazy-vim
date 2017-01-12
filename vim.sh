#!/bin/bash

#Positions user in the install file to 
cd ~/sloth

echo "Updating packages..."
apt-get update && apt-get -y upgrade

echo "Checking for vim and git packages..."
apt-get -y install vim git

echo "Cleaning out old files..."
git pull origin
rm -rf ~/.vim*

echo "Installing vim plugins..."

echo "Cloning Pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Enhancing JS syntax..."
git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript

echo "Growing Mustache..."
git clone https://github.com/mustache/vim-mustache-handlebars.git ~/.vim/bundle/mustache

echo "Getting Luna theme..."
git clone https://github.com/notpratheek/vim-luna.git ~/.vim/vim-luna && mv ~/.vim/vim-luna/colors/luna-term.vim ~/.vim/colors

echo "Installing Airline..."
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/airline
vim -u NONE -c "helptags ~/.vim/bundle/airline/doc" -c q

echo "...and its themes..."
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes

echo "Planting NERDtree..."
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
vim -u NONE -c "helptags ~/.vim/bundle/nerdtree/doc" -c q

echo "Capturing Fugitive..."
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/fugitive
vim -u NONE -c "helptags ~/.vim/bundle/fugitive/doc" -c q

echo "Setting you up for success..."
curl -LSso ~/.vimrc https://raw.githubusercontent.com/pbzona/sloth/master/.vimrc
echo "Welcome to your new vim!" > ./testfile.txt
vim ./testfile.txt

