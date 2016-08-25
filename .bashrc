parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# OLD:
# $debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]
export PS1="\[\033[01;32m\]\u@\h \[\033[01;34m\]\w\[\033[01;34m\]\$(parse_git_branch)$ \[\033[00m\]"
alias ls='ls --color'
alias ll='ls -liah --color'
alias grep="grep --color"
alias ..='cd ..'
alias doco='docker-compose'

#Path settings
export PATH="$PATH:~/.local/bin"
export GRADLE_HOME="~/applications/gradle-2.13"
export PATH="$PATH:~/applications/gradle-2.13/bin"
alias dobash="docker exec -ti $1 /bin/bash"
