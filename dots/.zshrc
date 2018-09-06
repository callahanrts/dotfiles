# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit-custom"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting fzf)

source $ZSH/oh-my-zsh.sh

# Aliases
# -------
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias vim='nvim'
alias clock='tty-clock -cbtC4'
alias ta='tmux attach -t'
alias tn='tmux new-session -s'
alias tk='tmux kill-session -t'
alias tm='tmuxinator'
alias dc="docker-compose"
# alias dcdev="docker-compose -f docker-compose.dev.yml"
alias ls='exa'

# NVM Exports
# -----------
export NVM_DIR=~/.nvm
export EDITOR='nvim'

# Source Files
# ------------
# for f in ~/.zsh/*; do source $f; done

# ===============================================================================================
# Misc. functions
# ===============================================================================================

function work(){
  tmuxinator work || ta work
}

function notify() {
  osascript -e 'display notification "'$1'" with title "'$2.'"'
}

function uberrefresh() {
  kill -9 $(pgrep bersicht)
  open -a $(ls /Applications | grep bersicht)
}

function go-home() {
  tk work
  docker-restart
}

# ===============================================================================================
# FZF
# ===============================================================================================

# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/codycallahan/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/codycallahan/.fzf/bin"
fi

## Man path
## --------
#if [[ ! "$MANPATH" == */Users/codycallahan/.fzf/man* && -d "/Users/codycallahan/.fzf/man" ]]; then
#  export MANPATH="$MANPATH:/Users/codycallahan/.fzf/man"
#fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/codycallahan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/Users/codycallahan/.fzf/shell/key-bindings.zsh"

# fzf Completion
export FZF_COMPLETION_TRIGGER='**'
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ===============================================================================================
# PATH
# ===============================================================================================

# PG
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# Rust Path
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=/Users/codycallahan/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# NVM
# ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$PATH:$HOME/.zsh/bin"
