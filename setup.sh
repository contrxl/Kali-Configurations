#!/bin/bash

omzdir="$HOME/.oh-my-zsh"
omzaliasdir="$omzdir/custom"
omzplugindir="$omzaliasdir/plugins"
omzautosuggest="$omzplugindir/zsh-autosuggestions"
pl10k="$omzaliasdir/themes/powerlevel10k"
fontsdir="$HOME/.local/share/fonts"

omzaliasurl="https://raw.githubusercontent.com/contrxl/Kali-Configurations/refs/heads/main/aliases.zsh"
omzurl="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
fonts=("https://github.com/contrxl/Kali-Configurations/raw/refs/heads/main/Font/MesloLGS%20NF%20Bold.ttf" "https://github.com/contrxl/Kali-Configurations/raw/refs/heads/main/Font/MesloLGS%20NF%20Italic.ttf" "https://github.com/contrxl/Kali-Configurations/raw/refs/heads/main/Font/MesloLGS%20NF%20Regular.ttf" "https://github.com/contrxl/Kali-Configurations/raw/refs/heads/main/Font/MesloLGS%20NF%20Bold%20Italic.ttf")

printf '=%.0s' {1..30}
printf "INSTALLING OH-MY-ZSH AND IMPORTING ALIAS FILE"
printf '=%.0s' {1..30}
printf "\n[*] Checking for oh-my-zsh install at $omzdir..."
if [ -d $omzdir ]
then
	printf "\n[+] Oh My Zsh already installed at $omzdir, moving on..."
else
	printf "\n[*] Downloading & installing oh-my-zsh..."
	sh -c "$(curl -fsSl $omzurl)" "" --unattended
	printf "\n[+] Done. Oh My Zsh installed at $omzdir."
fi

printf "\n[*] Creating alias file..."
printf "\n[*] Cloning aliases.zsh to $omzaliasdir..."
cd $omzaliasdir; curl -s -O $omzaliasurl; cd $HOME
printf "\n[+] Done. Alias file imported to $omzaliasdir.\n\n"

printf '=%.0s' {1..30}
printf "INSTALLING ZSH-AUTOSUGGEST PLUGIN"
printf '=%.0s' {1..30}
printf "\n[*] Checking for auto-suggest plugin install at $omzautosuggest..."
if [ -d $omzautosuggest ]
then
	printf "\n[+] Autosuggest plugin already installed at $omzautosuggest, moving on...\n\n"
else
	printf "\n[*] Downloading & installing zsh-autosuggest..."
	cd $omzplugindir; git clone https://github.com/zsh-users/zsh-autosuggestions; cd $HOME
	printf "\n[+] Done. Plugin installed at $omzplugindir.\n\n"
fi

printf '=%.0s' {1..30}
printf "INSTALLING POWERLEVEL10K AND FONTS"
printf '=%.0s' {1..30}
printf "\n[*] Checking for Powerlevel 10k & fonts..."
if [ -d $pl10k ]
then
	printf "\n[+] Powerlevel 10k already installed at $pl10k, moving on..."
else
	printf "\n[*] Downloading & installing Powerlevel 10k..."
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $pl10k
	printf "\n[+] Done. Powerlevel10k installed at $pl10k."
fi
if ls $fontsdir/Meslo* 1> /dev/null 2>&1
then
	printf "\n[+] Fonts already exist, moving on...\n\n"
else
	printf "\n[*] Creating $fontsdir..."
	mkdir -p $fontsdir
	printf "\n[+] Done."
	cd $fontsdir
	printf "\n[*] Downloading fonts...\n"
	for font in ${fonts[@]}
	do
		printf '[*] Downloading '
		wget --no-verbose $font
	done
	fc-cache -f -v 1> /dev/null 2>&1
	cd $HOME	
	printf "\n[+] Done. Fonts installed at $fontsdir.\n\n"
fi

printf '=%.0s' {1..30}
printf "INSTALLING RUBY AND COLORLS GEM"
printf '=%.0s' {1..30}
printf "\n[*] Checking for Ruby..."
if dpkg --get-selections | grep -v deinstall | grep ruby 1> /dev/null 2>&1
then
	printf "\n[+] Ruby already installed..."
	printf "\n[*] Checking for colorls gem..."
	if gem list | grep colorls 1> /dev/null 2>&1
	then
		printf "\n[+] Colorls already installed...\n\n"
	else
		printf "\n[*] Installing colorls...\n"
		sudo gem install colorls 1> /dev/null 2>&1
		printf "\n[+] Done\n\n."
	fi
else
	printf "\n[*] Installing Ruby...\n"
	sudo apt install Ruby
	printf "\n[+] Done."
	printf "\n[*] Installing colorls gem..."
	sudo gem install colorls
	printf "\n[+] Done."
fi

printf '=%.0s' {1..30}
printf "IMPORTING ZSH AND PK10 ZSH FILES"
printf '=%.0s' {1..30}
printf "\n[!] WARNING! Next step will overwrite your /.zshrc and /.pk10.zsh files."
printf "\n[!] A backup of your /.zshrc file will be created at /.zshrc-pre-setup."
printf "\n[!] You can continue without this step if you wish to preserve your existing /.zshrc file."
printf "\n[!] Would you like to proceed? Y/N: "
read input
if [ $input == "Y" ]
then
	printf "\n[*] Grabbing .zshrc file..."
	cd $HOME
	curl -s https://raw.githubusercontent.com/contrxl/Kali-Configurations/refs/heads/main/zshrc > $HOME/.zshrc.new
	mv .zshrc .zshrc-pre-setup
	mv .zshrc.new .zshrc
	printf "\n[+] Done."
	printf "\n[*] Grabbing .pk10.zsh file..."
	curl -s https://raw.githubusercontent.com/contrxl/Kali-Configurations/refs/heads/main/p10k.zsh > $HOME/.p10k.zsh.new
	mv .p10k.zsh.new .p10k.zsh
	printf "\n[+] Done."
else
	printf "\n[-] ZSHRC and P10K not imported."
fi

printf "\n[+] Setup completed! Restart terminal for all logos, fonts and configs to take hold."
