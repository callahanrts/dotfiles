# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME=""

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-syntax-highlighting fzf)

# source $ZSH/oh-my-zsh.sh
autoload -U promptinit; promptinit
prompt pure
export PURE_PROMPT_SYMBOL=" ❯"

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=" ❯"
prompt pure

# Aliases
# -------
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias vim='nvim'
alias ta='tmux attach -t'
alias tn='tmux new-session -s'
alias tk='tmux kill-session -t'
alias tm='tmuxinator'
alias dc="docker-compose"
alias ag='ag --path-to-ignore ~/.ignore'
# alias dcdev="docker-compose -f docker-compose.dev.yml"
alias ls='exa'
alias l='ls -al'
alias fix-audio='sudo killall coreaudiod'
alias uncommit='git reset --soft HEAD\^'
alias temacs='emacs -nw'
alias kitty='/Applications/kitty.app/Contents/MacOS/kitty'
# kitty -o allow_remote_control=yes --listen-on unix:/tmp/mykitty
alias caddys='caddy start --config="/Users/cody/github.com/Caddyfile"'

export EDITOR='nvim'

# Source Files
# ------------
# for f in ~/.zsh/*; do source $f; done

# ===============================================================================================
# Misc. functions
# ===============================================================================================

function work(){
  tmuxinator scs || ta scs
}

function notify() {
  osascript -e 'display notification "'$1'" with title "'$2.'"'
}

function uberrestart() {
  kill -9 $(pgrep bersicht)
  open -a $(ls /Applications | grep bersicht)
}

function piano() {
  cd ~/github.com/callahanrts/learn-piano/
}

function blog() {
  cd ~/github.com/callahanrts/callahanrts.github.io/
}

function caddy_start() {
  caddy start --config ~/github.com/Caddyfile
}

function ss() {
  local dir=$1

  if [ ! -z $dir ]; then
    case $dir in
      mysql) dir=dockermysql ;;
      elastic) dir=dockerelasticsearch ;;
      asterisk) dir=asterisk ;;
      app2) dir=shortstack2 ;;
      2) dir=shortstack2 ;;
      app) dir=shortstack ;;
      *) dir=shortstack$dir ;;
    esac
  fi

  cd ~/github.com/pancakelabs/$dir
}

function scs() {
  cd ~/github.com/sendcutsend/$1
}

function rts() {
  cd ~/github.com/callahanrts/$1
}

function ktheme() {
  local kitty=/Applications/kitty.app/Contents/MacOS/kitty

  case $1 in
    light)
      $kitty @ set-colors -a -c $HOME/.config/kitty/onelight.conf
      ;;
    dark)
      $kitty @ set-colors -a -c $HOME/.config/kitty/onedark.conf
      ;;
  esac
}


# ===============================================================================================
# FZF
# ===============================================================================================

# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/codycallahan/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/codycallahan/.fzf/bin"
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'


# ===============================================================================================
# PATH
# ===============================================================================================

# PG
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# NVM
# ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

export PATH="$PATH:$HOME/.zsh/bin"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOPATH/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Python2 Homebrew
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH=$PATH:$HOME/dotfiles
export PATH=$PATH:$HOME/github.com/SendCutSend/dev/bin

export PATH=$PATH:/Applications/QCAD-Pro.app/Contents/Resources

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/cody/github.com/learn-piano/workstation/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/cody/github.com/learn-piano/workstation/node_modules/tabtab/.completions/electron-forge.zsh

export PATH=$PATH:/Users/cody/.emacs.d/bin
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/cody/go/bin/bitcomplete bit
