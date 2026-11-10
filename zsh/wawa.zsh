# Wawa Rails app — aliases and tmux bootstrap. Only symlinked into
# ~/.config/zsh on the work laptop; the personal laptop doesn't symlink
# this fragment, so no guard is needed here.

alias fsl="lsof -ti :7433 | xargs kill -9 && PROCFILE=Procfile.dev.local bin/dev"
alias rubotest="bin/rubocop && bin/rspec_parallel"
alias tofile=" grep -hoE '[^[:space:]]+_spec\.rb' /dev/null tmp/rspec/failures-*.txt(N) 2>/dev/null | sort -u > tmp/failed_specs.txt"
alias tofile2="grep -hE '\| failed ' /dev/null spec/examples.txt(N) 2>/dev/null | grep -oE '^[^[:space:]]+_spec\.rb' | sort -u > tmp/failed_specs.txt"
alias rubotestfile="rubotest; tofile2"
alias changedspecs="git diff --name-only main...HEAD -- '*_spec.rb' | xargs bin/rspec"
alias claudemem="cd ~/.claude/projects/"

# granted/assume — AWS SSO role assumption; alias active when granted is installed.
if command -v granted &>/dev/null; then
  alias assume="source $(brew --prefix)/bin/assume"
else
  echo "\033[38;5;12mgranted not installed — see 'Setup AWS CLI with SSO' in Notion\033[0m"
fi

if [[ -n "$VAULT_DIR" ]]; then
    alias fwp='cd "$VAULT_DIR" &&  nvim .'
else
    echo "\033[38;5;9mwarning: \$VAULT_DIR not set — 'wiki' alias not registered. Set it in ~/.zshenv (e.g. export WIKI_DIR=\"\$HOME/Documents/wiki\").\033[0m"
  echo
fi

_tattach() {
  if [[ -n $TMUX ]]; then
    tmux switch-client -t "=$1"
  else
    tmux attach -t "=$1"
  fi
}

# tn: new tmux session codeN (next free N) rooted at $PWD with claude / nvim /
# terms windows, plus a tcN alias to get back to it.
tn() {
  local n=1
  while tmux has-session -t "=code$n" 2>/dev/null; do (( n++ )); done

  tmux new-session -d -s "code$n" -c "$PWD" -n claude
  tmux new-window  -t "=code$n:" -c "$PWD" -n nvim
  tmux new-window  -t "=code$n:" -c "$PWD" -n terms

  alias tc$n="_tattach code$n"
  _tattach "code$n"
}

# Aliases only live in the shell that defined them, so new shells pick up
# tcN for every codeN session already running.
for session in ${(f)"$(tmux list-sessions -F '#S' 2>/dev/null)"}; do
  [[ $session == code<-> ]] && alias tc${session#code}="_tattach $session"
done
unset session

alias ts="tmux attach -t server"
alias ts2="tmux attach -t server2"
alias tw="tmux attach -t wiki"

if [[ -n "$WORK_DIR" ]]; then
    alias work='cd "$WORK_DIR"'
fi
