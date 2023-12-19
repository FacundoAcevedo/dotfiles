#!/bin/env bash

# Install OH MY TMUX
if [ ! -d "$HOME/.tmux/.git" ]; then
    echo "Getting Oh my tmux"
    git clone https://github.com/gpakosz/.tmux.git ~/.tmux
    ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
else
    echo ".oh-my-zsh already found, skipping."
fi