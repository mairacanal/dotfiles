#!/bin/bash

echo "Updating dnf packages"
    sudo dnf check-update
    sudo dnf upgrade
echo "Done!"

echo "Installing flatpak"
    sudo dnf install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Done!"

echo "Syncing repos"
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf check-update
echo "Done!"

echo "Installing rpm packages"

    sudo dnf install liberation-fonts

    wget https://downloads.vivaldi.com/stable/vivaldi-stable-4.2.2406.48-1.x86_64.rpm
    sudo rpm -ivh vivaldi-stable-4.2.2406.48-1.x86_64.rpm
    sudo rm vivaldi-stable-4.2.2406.48-1.x86_64.rpm

    wget https://static.zenkit.com/downloads/desktop-apps/base/zenkit-base-linux.rpm
    sudo rpm -ivh zenkit-base-linux.rpm
    sudo rm zenkit-base-linux.rpm

    wget https://zoom.us/client/latest/zoom_x86_64.rpm
    sudo rpm -ivh zoom_x86_64.rpm
    sudo rm zoom_x86_64.rpm

    wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
    sudo rpm -ivh appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
    sudo rm appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm

echo "Done!"

echo "Installing dnf packages"
    sudo dnf install zathura-pdf-poppler xournalpp ripgrep python \
                     nodejs zsh bat fzf clang clang-tools-extra powerline-fonts \
                     fira-code-fonts gnome-tweaks gnome-shell-extension-pop-shell \
                     ranger htop util-linux-user code
echo "Done!"

echo "Installing flatpak packages"
    sudo flatpak install flathub com.spotify.Client
    sudo flatpak install flathub com.discordapp.Discord
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

echo "Done!"

echo "Setting Alacritty in the system"
    mkdir ~/.config/alacritty
    cp ./alacritty/* ~/.config/alacritty
echo "Done!"

echo "Setting gruvbox system theme"
    git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk

    mkdir ~/.themes
    mkdir ~/.icons

    cp -r gruvbox-material-gtk/themes/* ~/.themes/
    cp -r gruvbox-material-gtk/icons/* ~/.icons/

    sudo rm -r gruvbox-material-gtk
echo "Done!"

echo "Setting gruvbox zathura theme"
    git clone https://github.com/eastack/zathura-gruvbox

    mkdir ~/.config/zathura
    cp zathura-gruvbox/zathura-gruvbox-dark ~/.config/zathura/zathurarc
    sudo rm -r zathura-gruvbox
echo "Done!"

