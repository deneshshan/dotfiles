# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# jnrowe
# robbyrussell
# kardan
ZSH_THEME="norm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# clint slack env variables
export ENABLE_SLACK="true"
export SLACKUSER="denesh"
export SLACK_CHANNEL="#zc_private"
export SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ll="ls -al"
alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias tmuxconfig="nvim ~/.tmux.conf"
alias vimconfig="nvim ~/.vimrc"
alias nvimconfig="nvim ~/.config/nvim/init.vim"

# directory navigation
alias store="cd /Users/denesh/Documents/work/zappi/zappistore"
alias dc="cd /Users/denesh/Documents/work/zappi/data-collector"
alias clnt="cd /Users/denesh/Documents/work/zappi/clint"

# rails testing with zeus
alias ztest="zeus test"
alias zserver="zeus server"
alias zconsole="zeus console"
alias zrake="zeus rake"
alias zst="reset && zeus start"
alias be="bundle exec"

# taskwarrior
alias all="reset && task all"
alias next="reset && task next"
alias add="task add"
alias burn="reset && task burndown.daily"

alias dirtsamples="cd ~/Library/Application\ Support/SuperCollider/downloaded-quarks/Dirt-Samples"

alias nv="nvim"

export GOPATH='/Users/denesh/Documents/learning/go'
#export PATH="/usr/local/sbin:/usr/local/opt/gnu-getopt/bin:$PATH:$GOPATH/bin"

if [ -n "$TMUX" ]; then
  source ~/.bash_profile
  echo "PATH IS " $PATH
fi

#alias vim="nvim"
alias aag='reset && ag --pager less --color-match 31 --color-line-number 31 -C'

#alias nv='vim'
#alias tmux="env TERM=xterm-256color tmux"

alias life='cd $GOPATH/src/github.com/deneshshan/electronic_life'
 
alias mmake='docker run --rm -v "$(pwd):/src" -t ownyourbits/mmake'

# control s not working in terminal. this makes it work. useful for command t
# in vim to open a split pane.
stty start undef stop undef
