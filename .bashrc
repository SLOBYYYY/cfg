alias ls='ls --color'
alias ll='ls -liah --color'
alias grep="grep --color"
alias ..='cd ..'

#Path settings
export PATH="$PATH:~/.local/bin"

#virtualenvwrapper settings
export WORKON_HOME=~/.local/virtualenvs
export PROJECT_HOME=~/.local/virtualenv_project_home
source /usr/local/bin/virtualenvwrapper.sh
