# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'
export LESS='-R'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# General aliases
# alias nv="nvim"
alias ll="ls -alh"
alias zshconfig="nvim $HOME/.zshrc"
alias zshreload="source $HOME/.zshrc"
alias ohmyzsh="nvim $HOME/.oh-my-zsh"
alias tmuxconfig="nvim $HOME/.tmux.conf"
alias nvimconfig="nvim $HOME/.config/nvim"
alias alacrittyconfig="nvim $HOME/.config/alacritty"
alias be="bundle exec"
alias hist="history | grep"
alias gitloggraph="git log --oneline --graph --all"
alias longlines="grep -rn '.\{121,\}' packs/ --include='*.rb' -l"
alias ag='ag --color-match="31;40" --color'
# open neovim a at a certain line or column:
# nv packs/finance/app/services/finance/transaction_service.rb           # plain — opens at top
# nv packs/finance/app/services/finance/transaction_service.rb:175       # opens at line 175
# nv packs/finance/app/services/finance/transaction_service.rb:175:12    # also opens at 175 (col stripped)
unalias nv 2>/dev/null   # oh-my-zsh's nanoc plugin defines `alias nv='nanoc view'` — drop it
nv() {
    local arg="$1"
    if [[ "$arg" == *:[0-9]* ]]; then
        local file="${arg%%:*}"
        local line="${arg#*:}"
        line="${line%%:*}"   # strip trailing :col if rubocop/rspec output
        command nvim "+$line" "$file"
    else
        command nvim "$@"
    fi
}

# wawa specific
alias wiki="nvim $HOME/Documents/wiki"
alias fsl="lsof -ti :7433 | xargs kill -9 && PROCFILE=Procfile.dev.local bin/dev"
alias rubotest="bin/rubocop && bin/rspec_parallel"
alias changedspecs="git diff --name-only | grep _spec.rb | xargs bundle exec rspec"
# Personal laptop specific
# SuperCollider/tidal stuff
if [[ -x "/Applications/SuperCollider.app" ]]; then
  alias sc='open -a SuperCollider $HOME/Music/SuperCollider/startup.scd'
fi
[[ -x "$HOME/.ghcup/bin/ghci" ]] && export PATH="$HOME/.ghcup/bin:$PATH"
if command -v ghci &>/dev/null && [ -n "$(ls $HOME/.cabal/share/*/tidal-*/BootTidal.hs 2>/dev/null)" ]; then
  alias tidal="ghci -ghci-script $(ls $HOME/.cabal/share/*/tidal-*/BootTidal.hs 2>/dev/null | tail -1)"
  alias dirtopen='cd $HOME/Library/Application\ Support/SuperCollider/downloaded-quarks/Dirt-Samples'
fi

if command -v todoist &>/dev/null; then
  alias t="todoist --color"
  alias tfw='todoist --color l -p -f "#wawa"'
  alias tfi='todoist --color l -p -f "#Inbox"'
  alias taw='todoist --color a -N "wawa"'
else
  echo "\033[38;5;12mtodoist is not installed\033[0m"
fi

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#268bd2,bold"

eval "$(mise activate zsh)"

# Dotfiles reminder
if [ -n "$(git -C $HOME/Documents/github/dotfiles status --porcelain 2>/dev/null)" ]; then
  echo "\033[38;5;9mYour dotfiles have changed. Please commit them.\033[0m"
fi
if [ -n "$(git -C $HOME/Documents/github/dotfiles fetch --dry-run 2>&1)" ]; then
  echo "\033[38;5;9mYour dotfiles have upstream changes. Please pull them.\033[0m"
fi

# Docker CLI completions
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit && compinit
