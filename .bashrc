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

function askForSomething() {
	while true; do
		read -p "Removing every dangling image can be dangerous! Are you sure? (yn)" yn
		case $yn in
			[Yy]* ) eval $1; return;;
			[Nn]* ) return;;
			*) echo "Please press y or n.";;
		esac
	done
}
function removeDanglingImages() {
	IMAGE_COUNT=$(docker images -q -f \"dangling=true\" | wc -l)
	if [[ $IMAGE_COUNT -gt 0 ]]; then
		askForSomething "docker images -q -f \"dangling=true\" | xargs docker rmi"
	else
		echo "There are no dangling images"
	fi
}

function removeDanglingVolumes() {
	VOLUME_COUNT=$(docker volume ls -q -f \"dangling=true\" | wc -l)
	if [[ $VOLUME_COUNT -gt 0 ]]; then
		askForSomething "docker volume ls -q -f dangling=true | xargs docker volume rm"
	else
		echo "There are no dangling volumes"
	fi
}
#Path settings
export PATH="$PATH:~/.local/bin"
export GRADLE_HOME="~/applications/gradle-2.13"
export PATH="$PATH:~/applications/gradle-2.13/bin"
alias veramount='veracrypt /opt/memory.dump /storage/VirtualBox\ VMs/Multiple/'
alias veraumount='veracrypt -d'
alias dobash="docker exec -ti $1 /bin/bash"
alias dopa="docker ps -a"
alias docker-list-dangling-images="docker images -q -f dangling=true"
alias docker-list-dangling-volumes="docker volume ls -q -f dangling=true"
alias docker-remove-dangling-images=removeDanglingImages
alias docker-remove-dangling-volumes=removeDanglingVolumes
alias gis="git status"
alias gid="git diff"
alias gidc="git diff --cached"
# Launch screen if it's not already running
[[ $TERM != "screen" ]] && exec screen -q
