#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -al'

alias trash='mv -t /tmp'

alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'

PS1='[\u@\h \W]\$ '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
