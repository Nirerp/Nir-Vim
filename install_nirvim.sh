#!/bin/bash

##### remove old nvim folders: ######
sudo rm -r ~/.config/nvim/
sudo rm -r ~/.local/share/nvim/
###########################

#install curl#
sudo apt  install curl

### Installing PIP:
sudo apt install python3-pip

sudo apt install python3-neovim
sudo apt install python3-debugpy
sudo apt install python3-isort
sudo apt install python3-ruff


######## install nvim ########
sudo snap install nvim --classic
##############################


##### pre-reqs: #####

###########  LazyGit:   ##########
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

#################################


######## Install Fonts:#######
mkdir -p /usr/share/fonts/JetBrainsMono/

# Download URL for JetBrains Mono Nerd Font
font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"

# Extract filename from URL
filename="${font_url##*/}"

# Download the font archive
wget "$font_url" -O "$filename"

if [ $? -eq 0 ]; then
    echo "JetBrains Mono Nerd Font downloaded successfully: $filename"
else
    echo "Error downloading JetBrains Mono Nerd Font."
fi

sudo unzip JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMono
sudo fc-cache -fv
#################################


#install python-venv:
sudo apt install python3-venv

# Install npm:
sudo apt update
sudo apt install nodejs
sudo apt install npm
# install live-server
sudo npm install -g live-server

# copy nvim folder to .config
sudo cp -r nvim/ ~/.config/

exit


