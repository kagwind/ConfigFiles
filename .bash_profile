PATH=$PATH:~/bin
CLICOLOR=1
LSCOLORS=ExFxBxDxCxegedabagacad

export ANDROID_HOME=${HOME}/Android/sdk

alias ls='ls -GFh'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
