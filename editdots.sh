#!/usr/bin/env bash

set -e

pushd ~/dotfiles/

nvim .

# Early return if no changes were detected
if git diff --quiet; then
	echo "No changes detected, exiting."
	popd
	exit 0
fi

# Shows your changes
git diff -U0 '*'

echo "Applying changes to zsh..."

# TODO: Work out why sourcing .zshrc fails in here only
#source ~/dotfiles/.zshrc

#read -p "What did you change? " commitmsg

# Commit all changes witih the generation metadata
#git commit -am "$commitmsg"

# Back to where you were
popd
