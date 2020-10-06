#!/bin/bash


# Actualizar repos y sistema
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install git -y


# Instalar HyperTerminal
cd ~/
wget https://releases.hyper.is/download/deb
sudo mv deb hyper.deb
sudo apt install -y ./hyper.deb
rm hyper.deb

# Instalar Starship
curl -fsSL https://starship.rs/install.sh | bash
cd ~
cp .zshrc zshrc
echo -n 'eval "$(starship init zsh)"' >> zshrc
echo -n '\n' >> zshrc
echo -n "alias ls='lsd'" >> zshrc
sudo rm .zshrc
mv zshrc .zshrc


# Instalar fuente de Terminal

sudo apt install fonts-firacode


# Instalar plugins OhMyZsh

sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' .zshrc

# Instalar plugins HyperTerm

sudo apt-get install nodejs -y
cd ~/
sudo wget https://raw.githubusercontent.com/JDLHiguera/dotfiles/master/HyperTerm/.hyper.js
sudo mv .hyper.js.1 .hyper.js

# Instalar lsd

sudo wget https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd_0.18.0_amd64.deb
sudo dpkg -i lsd_0.18.0_amd64.deb
sudo rm lsd_0.18.0_amd64.deb


# Instalar OhMyZsh

sudo sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
#| grep "browser_download_url.*deb" \
#| cut -d : -f 2,3 \
#| tr -d \" \
#| wget -qi -
