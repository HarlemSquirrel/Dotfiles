source $HOME/.profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [[ $PATH != *$HOME/.rvm/bin ]]; then
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi

# Set Firefox as the default browser if it is installed.
firefox_path="$(command -v firefox)"
if [[ $firefox_path ]]; then
	export BROWSER="$firefox_path"
fi
