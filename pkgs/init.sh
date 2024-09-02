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

# termium -- codeium autocomplete for shell
curl -L https://github.com/Exafunction/codeium/releases/download/termium-v0.2.0/install.sh | bash

# git-lfs
git lfs install
git lfs install --system

# termium authentication
termium auth
termium shell-hook install

echo "To use my config files, you can execute config.sh.
IMPORTANT: before executing config.sh, make sure all configuration files in $HOME are deleted."

exec zsh

