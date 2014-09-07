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

source $ZSH/oh-my-zsh.sh
export TERM="xterm"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff --color-words"
alias gl="git l"

alias pip="pip --timeout=280"
alias rmswap="sudo find /var/tmp -name '*.swp' | xargs sudo rm"

export WORKON_HOME=$HOME/.envs/
export VIRTUALENVWRAPPER_HOOK_DIR=$HOME/.envs/
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/bin/virtualenvwrapper.sh

function precmd() {
    env_name=$(basename "$VIRTUAL_ENV")
    if [[ $env_name != "" ]]; then
        PS1="$_OLD_VIRTUAL_PS1"
        _OLD_RPROMPT="$RPROMPT"
    fi
}
export PATH=$PATH:/Library/Postgres.app/Contents/MacOS/lib/
export PATH=$PATH:/opt/X11/lib/
export PATH=$PATH:/Library/Postgres.app/Contents/MacOS/bin/
export PATH=$PATH:/Library/Postgres.app/Contents/MacOS/include/
export PATH=$PATH:/Users/kecebongsoft/workspaces/opengrads/Contents/
export PATH=$PATH:/Users/kecebongsoft/Documents/adt-bundle-mac-x86_64-20140702/sdk/tools/
export PATH=$PATH:/Users/kecebongsoft/Documents/adt-bundle-mac-x86_64-20140702/sdk/platforms/
export PATH=$PATH:/Users/kecebongsoft/Documents/apache-ant-1.9.4/bin/
export PATH=$PATH:/usr/local/mysql-5.6.20-osx10.7-x86_64/lib/
export JAVA_HOME=$(/usr/libexec/java_home)
export C_INCLUDE_PATH=C_INCLUDE_PATH:/Applications/Postgres.app/Contents/MacOS/include/
export C_INCLUDE_PATH=C_INCLUDE_PATH:/usr/local/mysql-5.6.20-osx10.7-x86_64/include/
export DYLD_LIBRARY_PATH="/Library/Postgres.app/Contents/MacOS/include/:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/usr/local/mysql-5.6.20-osx10.7-x86_64/lib/:$DYLD_LIBRARY_PATH"
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

alias check='git checkout'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias psql='/Applications/Postgres.app/Contents/MacOS/bin/psql'
alias pg_dump='/Applications/Postgres.app/Contents/MacOS/bin/pg_dump'
alias pg_config='/Applications/Postgres.app/Contents/MacOS/bin/pg_config'
alias gettext=/usr/local/Cellar/gettext/0.18.3.1/bin/gettext
PATH=/usr/local/Cellar/gettext/0.18.3.1/bin:$PATH

alias pyclear="find . -name '*.pyc' | xargs rm"
alias gitclear="find . -name '*.orig' | xargs rm"
alias w='workon'
alias pass='/usr/bin/python ~/workspaces/pass/pass.py'
alias catn='pygmentize -g'
alias ctags='/usr/local/bin/ctags'

function gentag() {
    pwd | xargs ctags -f ~/.tags/$1 ~/.envs/$1/
    sed -i '' '/[iv]$/d' ~/.tags/$1
    sed -i '' '/[iv]	/d' ~/.tags/$1
    sed -i '' '/tests\//d' ~/.tags/$1
}
alias gt=gentag

source ~/.host_alias
