# Dotfiles

There's two options here while I currently prefer bombadil.

## Toml Bombadil

Alternative dotfiles manager.
https://github.com/oknozor/toml-bombadil

### Install from main

    cd

    git clone git@github.com:HarlemSquirrel/Dotfiles.git

    cargo install toml-bombadil

    bombadil install ~/Dotfiles

### Set up the links

    bombadil link

## dotfiles

My set of personalized dot files managed with [`dotfiles`](https://pypi.org/project/dotfiles/)

### Installation

    pip install --user dotfiles

### List dot files not sym-linked in home directory

    find ~/ -maxdepth 1 -type f -name ".*" | sort

### List managed dot files

    dotfiles --list
