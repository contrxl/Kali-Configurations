#!/bin/bash

omzdir="$HOME/.oh-my-zsh/"
omzaliasdir="$omzdir/custom/"
omzautosuggest="$omzaliasdir/plugins/zsh-autosuggestions/"

omzaliasurl="https://raw.githubusercontent.com/contrxl/Kali-Configurations/refs/heads/main/aliases.zsh"
omzurl="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

echo "Checking for oh-my-zsh install at $omzdir..."
if [ -d $omzdir ]
then
	echo "Oh My Zsh already installed, moving on..."
else
	echo "Downloading & installing oh-my-zsh..."
	sh -c "$(curl -fsSl $omzurl)"
	echo "Cloning aliases.zsh to $omzaliasdir..."
	cd $omzaliasdir; curl -s -O $omzaliasurl; cd $HOME
fi

echo "Checking for auto-suggest plugin install at $omzautosuggest..."
if [ -d $omzautosuggest ]
then
	echo "Autosuggest plugin already present, moving on..."
else
	echo "Downloading & installing zsh-autosuggest..."
fi
