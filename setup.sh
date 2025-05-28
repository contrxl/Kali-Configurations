#!/bin/zsh

omzdir="$HOME/.oh-my-zsh"
omzaliasdir="$omzdir/custom"
omzplugindir="$omzaliasdir/plugins"
omzautosuggest="$omzplugindir/zsh-autosuggestions"
pl10k="$omzaliasdir/themes/powerlevel10k"
fontsdir="$HOME/.local/share/fonts"

omzaliasurl="https://raw.githubusercontent.com/contrxl/Kali-Configurations/refs/heads/main/aliases.zsh"
omzurl="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
fonts=("https://github.com/contrxl/Kali-Configurations/raw/refs/heads/main/Font/MesloLGS%20NF%20Bold.ttf" "https://github.com/contrxl/Kali-Configurations/raw/refs/heads/main/Font/MesloLGS%20NF%20Italic.ttf" "https://github.com/contrxl/Kali-Configurations/raw/refs/heads/main/Font/MesloLGS%20NF%20Regular.ttf" "https://github.com/contrxl/Kali-Configurations/raw/refs/heads/main/Font/MesloLGS%20NF%20Bold%20Italic.ttf")

echo "Checking for oh-my-zsh install at $omzdir..."
if [ -d $omzdir ]
then
	echo "Oh My Zsh already installed, moving on..."
else
	echo "Downloading & installing oh-my-zsh..."
	sh -c "$(curl -fsSl $omzurl)" "" --unattended
	echo "Done."
fi

echo "Creating alias file..."
echo "Cloning aliases.zsh to $omzaliasdir..."
cd $omzaliasdir; curl -s -O $omzaliasurl; cd $HOME
echo "Done."

echo "Checking for auto-suggest plugin install at $omzautosuggest..."
if [ -d $omzautosuggest ]
then
	echo "Autosuggest plugin already present, moving on..."
else
	echo "Downloading & installing zsh-autosuggest..."
	cd $omzplugindir; git clone https://github.com/zsh-users/zsh-autosuggestions; cd $HOME
	echo "Done."
fi

echo "Checking for Powerlevel 10k & fonts..."
if [ -d $pl10k ]
then
	echo "Powerlevel 10k already present, moving on..."
else
	echo "Downloading & installing Powerlevel 10k..."
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $pl10k
	echo "Done."
fi
if ls $fontsdir/Meslo* 1> /dev/null 2>&1
then
	echo "Fonts already exist, moving on..."
else
	echo "Creating $fontsdir..."
	mkdir -p $fontsdir
	echo "Done."
	cd $fontsdir
	echo "Downloading fonts..."
	for font in ${fonts[@]}
	do
		echo "Downloading $font..."
		wget --no-verbose $font
	done
	fc-cache -f -v
	cd $HOME	
	echo "Done."
fi

echo "Checking for Ruby..."
if dpkg --get-selections | grep -v deinstall | grep ruby 1> /dev/null 2>&1
then
	echo "Ruby already installed..."
	echo "Checking for colorls gem..."
	if gem list | grep colorls 1> /dev/null 2>&1
	then
		echo "Colorls already installed..."
	else
		echo "Installing colorls..."
		sudo gem install colorls
		echo "Done."
	fi
else
	echo "Installing Ruby..."
	sudo apt install Ruby
	echo "Done."
	echo "Installing colorls gem..."
	sudo gem install colorls
	echo "Done."
fi

echo "WARNING! Next step will overwrite your /.zshrc file, continue? Y/N"
read input
if [ $input == "Y" ]
then
	echo "Grabbing .zshrc file..."
	cd $HOME
	curl https://raw.githubusercontent.com/contrxl/Kali-Configurations/refs/heads/main/zshrc > $HOME/.zshrc.new
	mv .zshrc .zshrc-pre-setup
	mv .zshrc.new .zshrc
	echo "Done."
	echo "Grabbing .pk10.zsh file..."
	curl https://raw.githubusercontent.com/contrxl/Kali-Configurations/refs/heads/main/p10k.zsh > $HOME/.p10k.zsh.new
	mv .p10k.zsh.new .p10k.zsh
	echo "Done."
else
	echo "Finishing."
fi
