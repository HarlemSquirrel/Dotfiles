
export NVM_DIR="/home/hs/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scriptingipts

# Set Firefox as the default browser if it is installed.
firefox_path="$(command -v firefox)"
if [[ $firefox_path ]]; then
	export BROWSER="$firefox_path"
fi
