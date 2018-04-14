#
# ~/.bashrc
#

# If not running interactively, don't do anything

PS1='[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}


export PS1="\[\e[36m\][\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[33m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]\[\e[31m\]\[\e[m\]\[\e[34m\]\\$\[\e[m\] "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


alias vi=vim
alias cdce='cd ~/src/cedille'
alias cdp='cd ~/src/perso'
alias lt='ls -lrt'
