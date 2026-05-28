# Wawa Rails app — aliases and tmux bootstrap. Only symlinked into
# ~/.config/zsh on the work laptop; the personal laptop doesn't symlink
# this fragment, so no guard is needed here.

alias fsl="lsof -ti :7433 | xargs kill -9 && PROCFILE=Procfile.dev.local bin/dev"
alias rubotest="bin/rubocop && bin/rspec_parallel"
alias changedspecs="git diff --name-only | grep _spec.rb | xargs bin/rspec"

# `dev` bootstraps three tmux sessions if they don't already exist and
# attaches to `code`:
#
#   code    two windows in the project root: claude, nvim
#   server  docker / bin/rails s / bin/sidekiq, each in its own window
#   review  two Claude sessions for PR code reviews
#
# Idempotent — opening a second terminal won't duplicate windows. Skip
# the bootstrap by setting NO_TMUX=1.
dev() {
  [[ -n "$TMUX" ]] && return  # already inside tmux

  local project="$HOME/Documents/work"

  if ! tmux has-session -t code 2>/dev/null; then
    tmux new-session -d -s code -c "$project" -n claude
    tmux new-window  -t code:   -c "$project" -n nvim
  fi

  if ! tmux has-session -t server 2>/dev/null; then
    tmux new-session -d -s server  -c "$project" -n docker
    tmux new-window  -t server:    -c "$project" -n server
    tmux new-window  -t server:    -c "$project" -n sidekiq
  fi

  if ! tmux has-session -t review 2>/dev/null; then
    tmux new-session -d -s review -c "$project" -n claude-review
    tmux new-window  -t review:   -c "$project" -n nvim-review
  fi

  tmux attach -t code
}

# Auto-bootstrap on interactive shell start unless we're already inside
# tmux or NO_TMUX is set.
if [[ -z "$TMUX" ]] && [[ $- == *i* ]] && [[ -z "$NO_TMUX" ]]; then
  dev
fi

alias tcode="tmux attach -t code"
alias tserv="tmux attach -t server"
alias trev="tmux attach -t review"
