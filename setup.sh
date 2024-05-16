#!/usr/bin/env sh

set -e

# Ensure command exists 
function command_exists() {
  command -v "$1" >/dev/null 2>&1
}

if ! command_exists git; then
  echo "Git is not installed, please install git"
  exit 1
fi

if ! command_exists curl; then
  echo "Curl is not installed, please install curl"
  exit 1
fi

if ! command_exists zsh; then
  echo "Zsh is not installed, please install zsh"
  exit 1
fi

REPO_URL=https://github.com/iAverages/dotfiles.git
INSTALL_PATH=$HOME/.config

if [ -d "$INSTALL_PATH" ]; then
  echo "Dotfiles already installed, updating"
  cd $INSTALL_PATH
  git pull
else
  echo "Cloning dotfiles"
  git clone $REPO_URL $INSTALL_PATH
fi

cd $INSTALL_PATH

curl -sS https://starship.rs/install.sh | sh
