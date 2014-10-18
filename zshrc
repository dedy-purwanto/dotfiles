# Path to your oh-my-zsh configuration.
[ -z "$PS1" ] && return
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"
DEFAULT_USER="kecebongsoft"
DISABLE_AUTO_UPDATE="true"
plugins=(git)

function precmd() {
    env_name=$(basename "$VIRTUAL_ENV")
    if [[ $env_name != "" ]]; then
        PS1="$_OLD_VIRTUAL_PS1"
        _OLD_RPROMPT="$RPROMPT"
    fi
}
function gentag() {
    pwd | xargs ctags -f ~/.tags/$1 ~/.envs/$1/
    sed -i '' '/[iv]$/d' ~/.tags/$1
    sed -i '' '/[iv]	/d' ~/.tags/$1
}

export TERM="xterm"
export PATH=$PATH:/Library/Postgres.app/Contents/MacOS/lib/
export PATH=$PATH:/opt/X11/lib/
export PATH=$PATH:/Library/Postgres.app/Contents/MacOS/bin/
export PATH=$PATH:/Library/Postgres.app/Contents/MacOS/include/
export PATH=$PATH:/Users/kecebongsoft/workspaces/opengrads/Contents/
export PATH=$PATH:/Users/kecebongsoft/Workspaces/libs/android-sdk/tools/
export PATH=$PATH:/Users/kecebongsoft/Workspaces/libs/android-sdk/platforms/
export PATH=$PATH:/Users/kecebongsoft/Workspaces/libs/android-sdk/platform-tools/
export PATH=$PATH:/usr/local/mysql-5.6.20-osx10.7-x86_64/lib/
export PATH=$PATH:/usr/local/Cellar/gettext/0.18.3.1/bin
export JAVA_HOME=$(/usr/libexec/java_home)
export C_INCLUDE_PATH=C_INCLUDE_PATH:/Applications/Postgres.app/Contents/MacOS/include/
export C_INCLUDE_PATH=C_INCLUDE_PATH:/usr/local/mysql-5.6.20-osx10.7-x86_64/include/
export DYLD_LIBRARY_PATH="/Library/Postgres.app/Contents/MacOS/include/:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/usr/local/mysql-5.6.20-osx10.7-x86_64/lib/:$DYLD_LIBRARY_PATH"
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export WORKON_HOME=$HOME/.envs/
export VIRTUALENVWRAPPER_HOOK_DIR=$HOME/.envs/
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff --color-words"
alias gl="git l"
alias check='git checkout'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias feature='git flow feature start'
alias hotfix='git flow hotfix start'

alias psql='/Applications/Postgres.app/Contents/MacOS/bin/psql'
alias pg_dump='/Applications/Postgres.app/Contents/MacOS/bin/pg_dump'
alias pg_config='/Applications/Postgres.app/Contents/MacOS/bin/pg_config'
alias gettext=/usr/local/Cellar/gettext/0.18.3.1/bin/gettext
alias pyclear="find . -name '*.pyc' | xargs rm"
alias gitclear="find . -name '*.orig' | xargs rm"
alias pip="pip --timeout=280"
alias rmswap="sudo find /var/tmp -name '*.swp' | xargs sudo rm"
alias w='workon'
alias ctags='/usr/local/bin/ctags'
alias gt=gentag

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/virtualenvwrapper.sh
source ~/.host_alias

unsetopt correct_all
