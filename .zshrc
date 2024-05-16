# Setup zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$ZINIT_HOME"
    git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
        echo "Installed Zinit to: $ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

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