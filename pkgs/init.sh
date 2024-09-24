# update
sudo pacman -Su

# mandoc -- man pages
sudo pacman -S mandoc

# install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/joel/.zshrc
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# sudo pacman -S base-devel

# git -- version control (only if not installed)
# sudo pacman -S git # pacman
# brew install git # brew

# rustup
rustup-init
. "$HOME/.cargo/env"

# tpm -- tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

# termium -- codeium autocomplete for shell
curl -L https://github.com/Exafunction/codeium/releases/download/termium-v0.2.0/install.sh | bash

# git-lfs
git lfs install
git lfs install --system

# termium authentication
termium auth
termium shell-hook install

# xdph
sudo pacman -S xdg-desktop-portal-hyprland
sudo pacman -S xdg-desktop-portal-gtk

# qt
sudo pacman -S qt5-wayland
sudo pacman -S qt6-wayland

# hyprpaper
sudo pacman -S hyprpaper

ln -s /usr/share/applications ~/.nix-profile/share/applications

# hyprls
go install github.com/ewen-lbh/hyprls/cmd/hyprls@latest

# sddm
sudo pacman -Syu qt6-svg qt6-declarative

# chinese characters
sudo pacman -Sy adobe-source-han-sans-cn-fonts

echo "To use my config files, you can execute config.sh.
IMPORTANT: before executing config.sh, make sure all configuration files in $HOME are deleted."

exec zsh

