# Dotfiles

My set of personalized dot files managed with [`dotfiles`](https://pypi.org/project/dotfiles/)

### Installation

    pip install --user dotfiles

### List dot files not sym-linked in home directory

    find ~/ -maxdepth 1 -type f -name ".*" | sort

### List managed dot files

    dotfiles --list

## Toml Bombadil

Alternative dotfiles manager.
https://github.com/oknozor/toml-bombadil

### Install from main

    cargo install toml-bombadil --git https://github.com/oknozor/toml-bombadil.git --branch main

### Set up the links

    bombadil link
