#!/bin/bash

echo "Updating dnf packages"
    sudo dnf check-update
    sudo dnf upgrade
echo "Done!"

echo "Installing flatpak"
    sudo dnf install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Done!"

echo "Adding dnf repos"
    sudo dnf copr enable pschyska/alacritty
    sudo dnf check-update
echo "Done!"

echo "Installing rpm packages"
    wget https://downloads.vivaldi.com/stable/vivaldi-stable-4.2.2406.48-1.x86_64.rpm
    sudo rpm -ivh vivaldi-stable-4.2.2406.48-1.x86_64.rpm

    wget https://static.zenkit.com/downloads/desktop-apps/base/zenkit-base-linux.rpm
    sudo rpm -ivh zenkit-base-linux.rpm

    wget https://zoom.us/client/latest/zoom_x86_64.rpm
    sudo rpm -ivh zoom_x86_64.rpm

    wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
    sudo rpm -ivh appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
echo "Done!"

echo "Installing dnf packages"
    sudo dnf install zathura-pdf-poppler xournalpp alacritty ripgrep python \
                     nodejs zsh bat fzf clangd clangd-tools powerline-fonts \
                     fira-code-fonts gnome-tweaks gnome-shell-extension-pop-shell
echo "Done!"

echo "Installing pip packages"
    sudo pip install conan
echo "Done!"

echo "Installing flatpak packages"
    sudo flatpak install flathub com.spotify.Client
    sudo flatpak install flathub com.discordapp.Discord
    sudo flatpak install flathub com.visualstudio.code
echo "Done!"

echo "Installing snap packages"
    sudo dnf install snapd
    sudo ln -s /var/lib/snapd/snap /snap
    sudo snap install notion-snap
echo "Done!"

echo "Installing vim-plug"
    curl -fLo ~/dotfiles/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Done!"

echo "Setting vim in the system"
    mkdir temp_dirs
    cp .vimrc ~/
echo "Done!"

echo "Setting zsh in the system"
    # Installing oh-my-zsh
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Installing spaceship theme
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

    # Installing zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    cp .zshrc ~/
echo "Done!"

echo "Setting Alacritty in the system"
    cp alacritty/* ~/.config/alacritty
echo "Done!"

echo "Setting gruvbox system theme"
    git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk

    mkdir ~/.themes
    mkdir ~/.icons

    cp gruvbox-material-gtk/themes/* ~/.themes/
    cp gruvbox-material-gtk/icons/* ~/.icons/

    rm -r gruvbox-material-gtk
echo "Done!"

echo "Setting gruvbox zathura theme"
    git clone https://github.com/eastack/zathura-gruvbox

    cp zathura-gruvbox/zathura-gruvbox-dark ~/.config/zathura/zathurarc
    rm -r zathura-gruvbox
echo "Done!"

echo "Installing my favorite wallpapers"
    git clone https://github.com/archcraft-os/archcraft-wallpapers.git
echo "Done!"

