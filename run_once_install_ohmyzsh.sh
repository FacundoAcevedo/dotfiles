#!/bin/env bash

# Install OH MY ZSH
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Getting ohmyz.sh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc --skip-chsh
else
    echo ".oh-my-zsh already found, skipping."
fi

# Install Powerline 10 k
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Cloning Powerlevel10K"
    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
fi