# Dotfiles

My set of personalized dot files managed with [`dotfiles`](https://pypi.org/project/dotfiles/)

### Installation

    pip install --user dotfiles

### List dot files not sym-linked in home directory

    find ~/ -maxdepth 1 -type f -name ".*" | sort

### List managed dot files

    dotfiles --list
