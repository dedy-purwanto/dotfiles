# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="kecebongsoft"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#

eval `dircolors ~/.dotfiles/ls-colors-solarized/dircolors`


plugins=(git mercurial nyan)

source $ZSH/oh-my-zsh.sh
export TERM="screen-256color"
alias ack="ack-grep --color --color-filename=Blue --color-match=Red"
alias google="google --editor=vim"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff --color-words"
alias gl="git l"

# Auto reload Xresources whenever urxvt is launched from shell
alias urxvt="xrdb -load ~/.Xresources && urxvt"

# ack alias
alias ack="ack-grep --color --color-filename=Blue --color-match=Red"

alias pip="pip --timeout=280"
alias rmswap="find /var/tmp -name '*.swp' | xargs -i rm {}"

export WORKON_HOME=$HOME/.envs/
export VIRTUALENVWRAPPER_HOOK_DIR=$HOME/.envs/
source /usr/local/bin/virtualenvwrapper.sh

function precmd() {
    env_name=$(basename "$VIRTUAL_ENV")
    if [[ $env_name != "" ]]; then
        PS1="$_OLD_VIRTUAL_PS1"
        _OLD_RPROMPT="$RPROMPT"
    fi
}
