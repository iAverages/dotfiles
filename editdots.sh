#!/usr/bin/env bash

set -e

# Open nvim and set cwd to dotfiles
nvim --cmd "~/dotfiles/" ~/dotfiles/

pushd ~/dotfiles/

# Early return if no changes were detected
if git diff --quiet; then
	echo "No changes detected, exiting."
	popd
	exit 0
fi

# Shows your changes
git diff -U0 '*'

echo "Applying changes to zsh..."

source ~/dotfiles/.zshrc

readline -p "What did you change?" commitmsg

# Commit all changes witih the generation metadata
git commit -am "$commitmsg"

# Back to where you were
popd
