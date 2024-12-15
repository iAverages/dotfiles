#!/usr/bin/env zsh

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

echo "What did you change?:"
read commitmsg

git commit -am "$commitmsg"

# Back to where you were
popd
