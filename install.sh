#!/bin/bash

echo "Updating dnf packages"
    sudo dnf check-update
    sudo dnf upgrade
echo "Done!"

echo "Installing flatpak"
    sudo dnf install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Done!"

echo "Installing rpm packages"
    wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
    sudo rpm -ivh appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
    sudo rm appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
echo "Done!"

echo "Installing dnf packages"
    sudo dnf install zathura-pdf-poppler xournalpp ripgrep python \
                     nodejs zsh fzf clang clang-tools-extra \
                     fira-code-fonts gnome-tweaks gnome-shell-extension-pop-shell \
                     htop util-linux-user lld thunderbird xprop \
                     gimp gnome-pomodoro alacritty neovim ripgrep tmux
echo "Done!"

echo "Installing flatpak packages"
    sudo flatpak install flathub com.spotify.Client
echo "Done!"

echo "Setting nvim in the system"
    cp ./config/nvim ~/.config
echo "Done!"

echo "Setting zsh in the system"
    # Installing oh-my-zsh
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Installing starship theme
    curl -sS https://starship.rs/install.sh | sh

    # Installing zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Done!"

echo "Setting tmux in the system"
    cp .tmux.conf ~/
echo "Done!"

echo "Setting Alacritty in the system"
    mkdir ~/.config/alacritty
    cp ./config/alacritty ~/.config
echo "Done!"

echo "Setting nord system theme"
    git clone https://github.com/vinceliuice/Graphite-gtk-theme.git

    ./Graphite-gtk-theme/install.sh --libadwaita --color dark --tweaks nord rimless

    sudo rm -r Graphite-gtk-theme
echo "Done!"

echo "Get Icons"
    sudo dnf install papirus-icon-theme -y
echo "Done!"

echo "Setting nord zathura theme"
    git clone https://github.com/gdnand/zathura-nord.git

    mkdir ~/.config/zathura
    cp zathura-nord/zathura-nord ~/.config/zathura/zathurarc
    sudo rm -r zathura-nord
echo "Done!"

