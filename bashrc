#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# get current branch in git repo

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


export PS1="\[\e[36m\][\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[33m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]\[\e[31m\]\[\e[m\]\\[\e[31m\]\$( parse_git_branch )\e[m\]\e[34m\]\\$\[\e[m\] "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias vi=vim
alias cdce='cd ~/src/cedille'
alias cdp='cd ~/src/perso'
alias lt='ls -lrt'
