#!/usr/bin/env bash

set -e

pushd ~/dotfiles/nixos/

nvim .

# Early return if no changes were detected
if git diff --quiet '*.nix'; then
	echo "No changes detected, exiting."
	popd
	exit 0
fi

# Autoformat your nix files
alejandra . &>/dev/null ||
	(
		alejandra .
		echo "formatting failed!" && exit 1
	)

# Shows your changes
git diff -U0 '*.nix'

# Use sudo before so login is cached and I get this message once authed
sudo echo "NixOS Rebuilding for $(hostname)..."

# Rebuild, output simplified errors, log trackebacks
nh os switch -- --flake ~/dotfiles/nixos/#$(hostname)

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

# Commit all changes witih the generation metadata
git commit -am "$(hostname): $current"

# Back to where you were
popd

# Notify all OK!
notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available$() -a "NixOS Rebuild"
