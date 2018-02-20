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
alias dcdev="docker-compose -f docker-compose.dev.yml"
alias ls='exa'
# alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'

# NVM Exports
# -----------
export NVM_DIR=~/.nvm
export EDITOR='nvim'

# Source Files
# ------------
for f in ~/.zsh/*; do source $f; done
# source $(brew --prefix nvm)/nvm.sh

# PG
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# Go Path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=/Users/codycallahan/go/go_appengine:$PATH # AppEngine

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

# rbenv
eval "$(rbenv init -)"

# Python3 Bins
export PATH=/Users/codycallahan/Library//Python/3.6/bin:$PATH

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/codycallahan/Documents/projects/bbookmarks/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/codycallahan/Documents/projects/bbookmarks/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/codycallahan/Documents/projects/bbookmarks/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/codycallahan/Documents/projects/bbookmarks/node_modules/tabtab/.completions/sls.zsh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/codycallahan/go/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/codycallahan/go/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/codycallahan/go/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/codycallahan/go/google-cloud-sdk/completion.zsh.inc'; fi
