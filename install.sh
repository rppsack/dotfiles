#!/bin/bash

# Create a temporary directory
TEMP_DIR=$(mktemp -d)
echo "TEMP_DIR installed successfully!"
sleep 5

# Download the font zip file
wget -O "$TEMP_DIR/font.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
echo "Wget installed successfully!"
sleep 5

# Unzip the font file
unzip "$TEMP_DIR/font.zip" -d "$TEMP_DIR"
echo "Unzip installed successfully!"
sleep 5

# Move the font files to the system fonts directory
sudo mv "$TEMP_DIR"/*.{ttf,otf} /usr/local/share/fonts/
echo "sudo installed successfully!"
sleep 5

# Update the font cache
fc-cache -f -v
echo "fc-cache installed successfully!"
sleep 5

# Clean up
rm -rf "$TEMP_DIR"

echo "Fonts installed successfully!"


# curl -o ~/.fonts/MesloLGS_NF_Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
#  --create-dirs --output ~/.fonts
# curl -o ~/.fonts/MesloLGS_NF_Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
# curl -o ~/.fonts/MesloLGS_NF_Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
# curl -o ~/.fonts/MesloLGS_NF_BoldItalic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# sudo apt install fontconfig
# fc-cache

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ~/dotfiles/p10k.zsh ~/p10k.zsh
cp ~/dotfiles/.zshrc ~/.zshrc
exec zsh
