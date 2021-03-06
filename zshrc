# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gnzh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable magic functions
# This can help with the bracketed-paste-magic:zle pasting issue
# https://github.com/robbyrussell/oh-my-zsh/issues/5569#issuecomment-491504337
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf git pass)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export MAKEFLAGS="-j$(nproc)"

# glib setting for Ruby
# https://devcenter.heroku.com/changelog-items/1683
#export MALLOC_ARENA_MAX=2

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function curltime() {
  curl --write-out @- -s "$1" <<'EOF'
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
EOF
}

function upto5xdo () {
  for i in `seq 5` ; do
    $@
    [[ ! $? = 0 ]] && break
  done
}

function update_tutanota_appimage() {
  cd ~
  wget -N https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage
  cd -
}

alias reinstall-grub="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArchLinux"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
  export QT_QPA_PLATFORM=wayland
fi

if [[ $PATH != *$HOME/.local/bin* ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

if [ -f "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
elif [ -f /usr/share/nvm/init-nvm.sh ]; then
  source /usr/share/nvm/init-nvm.sh
fi

alias open="xdg-open"

##
# Diagnostics
alias curltime="curl -w \"\n       connect: %{time_connect}s\nstart_transfer: %{time_starttransfer}s\n         total: %{time_total}s\n\" --head"

##
# Git
function git_log_for_release () {
  git log --pretty=format:'- %b [(%cn) %s]' $(git describe --tags --abbrev=0)..HEAD | grep 'Merge pull request\|#[0-9][0-9][0-9][0-9]'
}

# Weather
alias weather-hawley="curl \"wttr.in/Hawley+PA\""
alias weather-nyc="curl wttr.in/NYC"

alias open="xdg-open"
