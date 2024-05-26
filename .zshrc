# Setup zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$ZINIT_HOME"
    git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
        echo "Installed Zinit to: $ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

# Load completions
autoload -U compinit && compinit

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Configure history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Allow for case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

zinit cdreplay -q

export EDITOR=nvim

eval "$(starship init zsh)"

# Start SSH Agent
eval $(ssh-agent) &>/dev/null
ssh-add -q ~/.ssh/github_rsa 

# Fixes bug being unable to sign commit with git
export GPG_TTY=$(tty)

function add_to_path() {
    if [[ ! "$PATH" == *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

add_to_path "/usr/local/go/bin"

# Load localrc if it exists
# I use this to store local environment 
# variables / secrets that I don't want to
# commit to git
if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

alias ls='ls --color'
alias c='code'
alias editnix='~/dotfiles/rebuild-nix.sh'
alias editdots='~/dotfiles/editdots.sh'
alias res='source ~/dotfiles/.zshrc'

if command -v "batcat" >/dev/null 2>&1; then
    alias cat='batcat'
fi

if command -v "bat" >/dev/null 2>&1;then
    alias cat='bat'
fi

alias g='git'
alias ga='git add .'
alias changed="git diff -w HEAD --staged -- . ':!yarn.lock' ':!*package-lock.json' ':!*pnpm-lock.yaml'"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

