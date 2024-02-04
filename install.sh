#!/bin/bash

# Inspired by https://github.com/bartekspitza/dotfiles/blob/master/install.sh

# Ask Y/n
function ask() {
	read -p "$1 (Y/n): " resp
	if [ -z "$resp" ]; then
		response_lc="y" # empty is Yes
	else
		response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
	fi

	[ "$response_lc" = "y" ]
}

# Check what shell is being used
SH="${HOME}/.bashrc"
ZSHRC="${HOME}/.zshrc"
if [ -f "$ZSHRC" ]; then
	SH="$ZSHRC"
fi

echo >>$SH
echo "Installing in $SH..."

## Tmux conf
if ask "Do you want to install .tmux.conf?"; then
	ln -s "$(realpath ".tmux.conf")" ~/.tmux.conf || true
fi

# NeoVim conf
if ask "Do you want to install the NeoVim config?"; then
	ln -s "$(realpath "nvim")" ~/.config/nvim || true
fi

echo "Do you want $SH to source: "
for file in startup/*; do
	if [ -f "$file" ]; then
		filename=$(basename "$file")
		if ask "${filename}?"; then
			echo "source $(realpath "$file")" >>"$SH"
			source $(realpath "$file")
		fi
	fi
done
