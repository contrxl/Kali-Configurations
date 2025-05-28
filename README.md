# Installing - Automatically

The below instruction can be followed to manually configure and customise the settings to match my own. Otherwise, to exactly copy it, simply clone this repo, execute `setup.sh` (in user-context, not as root), then restart your terminal!

The setup script can also be executed in one line without cloning the repo by running:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/contrxl/Kali-Configurations/refs/heads/main/setup.sh)"
```

# Installing - Manually

## Oh My Zsh
Current link is: https://ohmyz.sh/#install

Install line is:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Aliases are set in `~/.oh-my-zsh/custom/aliases.zsh`. You can copy my aliases by downloading [`aliases.zsh`](https://github.com/contrxl/Kali-Configurations/blob/main/aliases.zsh) from this repo and placing it in the aforementioned alias path.
## Oh My Zsh Plugins
I only use one custom plugin: [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh).

Install the plugin by cloning the above repo into `~/.oh-my-zsh/custom/plugins`:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
Once cloned, add the plugin to the `~/.zshrc` file (you can skip this if you're going to use the `.zshrc` file provided in this repo):
```bash
plugins=(
	zsh-autosuggestions
)
```

## Powerlevel 10k
Current link is: https://github.com/romkatv/powerlevel10k/blob/master/README.md

Download the 4 MesloLGS files from the above link or locally from this repo in the [Font folder](https://github.com/contrxl/Kali-Configurations/tree/main/Font). Install the font by executing the following commands:
```bash
mkdir -p ~/.local/share/fonts
sudo mv MesloLGS\ NF\ Regular.ttf ~/.local/share/fonts
sudo mv MesloLGS\ NF\ Bold.ttf ~/.local/share/fonts
sudo mv MesloLGS\ NF\ Italic.ttf ~/.local/share/fonts
sudo mv MesloLGS\ NF\ Bold\ Italic.ttf ~/.local/share/fonts
fc-cache -f -v
```
Restart your terminal and use: `fc-list | grep Meslo` to confirm the font is installed.

Install Powerlevel 10k with:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```
Once installed, open `~/.zshrc` and modify the following line: `ZSH_THEME = powerlevel10k/powerlevel10k` (you can skip this if you're going to use the `.zshrc` file provided in this repo).

Now, proceed through setup by executing `p10k configure`.

## ZSHRC & P10K.ZSH
These can be left as is if you wish to configure fully custom settings, else, download [`zshrc`](https://github.com/contrxl/Kali-Configurations/blob/main/zshrc) and [`p10k.zsh`](https://github.com/contrxl/Kali-Configurations/blob/main/p10k.zsh) from here.

Once downloaded, rename your current `.zshrc` and `.p10k.zsh` files to something like: `.zshrc-bak` & `.p10k.zsh`. Now, copy the files you downloaded to your home directory and rename them `.zshrc` and `.p10k.zsh` respectively.

## Colorls
Current link is: https://github.com/athityakumar/colorls
> [!NOTE]
> This needs `Ruby` to install, if you do not have this installed, you can do so by running `sudo apt install ruby`.
Install the gem using:
`sudo gem install colorls`.

## Actual Terminal Settings
- Background opacity at 20%
- Colour scheme GreenOnBlack
