## Installing

The below instruction can be followed to manually configure and customise the settings to match my own. Otherwise, to exactly copy it, simply clone this repo, execute `setup.sh` (in user-context, not as root), then restart your terminal!

## Oh My Zsh
Current link is: https://ohmyz.sh/#install

Install line is:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Aliases are set in `~/.oh-my-zsh/custom/aliases.zsh`.
## Oh My Zsh Plugins
One custom plugin to install into `~/.oh-my-zsh/custom/plugins`. 

First is `zsh-autosuggestions` from https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh. Install by cloning repo into `~/.oh-my-zsh/custom/plugins`:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
Once cloned, add the plugin to the `~/.zshrc` file:
```bash
plugins=(
	zsh-autosuggestions
)
```

## Powerlevel 10k
Current link is: https://github.com/romkatv/powerlevel10k/blob/master/README.md

Download the 4 MesloLGS files from the above link. Install the font by:
```bash
mkdir -p ~/.local/share/fonts
sudo mv MesloLGSNFRegular ~/.local/share/fonts
sudo mv MesloLGSNFBold ~/.local/share/fonts
sudo mv MesloLGSNFItalic ~/.local/share/fonts
sudo mv MesloLGSNFBoldItalic ~/.local/share/fonts
fc-cache -f -v
```
Restart your terminal and use: `fc-list | grep Meslo` to confirm the font is installed.

Install Powerlevel 10k with:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```
Once installed, open `~/.zshrc` and modify the following line:
`ZSH_THEME = powerlevel10k/powerlevel10k`. Now, proceed through setup by executing `p10k configure`.

## Colorls
Current link is: https://github.com/athityakumar/colorls

Install using:
`sudo gem install colorls`

## Actual Terminal Settings
- Background opacity at 20%
- Colour scheme GreenOnBlack
