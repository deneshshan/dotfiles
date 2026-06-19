# Wiki: set $WIKI_DIR per machine (e.g. in ~/.zshenv). The `wiki` alias is
# only registered when it's set; otherwise a one-line red warning prints at
# shell start.

if [[ -n "$WIKI_DIR" ]]; then
  alias wiki='(cd "$WIKI_DIR" && nvim .)'
else
  echo "\033[38;5;9mwarning: \$WIKI_DIR not set — 'wiki' alias not registered. Set it in ~/.zshenv (e.g. export WIKI_DIR=\"\$HOME/Documents/wiki\").\033[0m"
  echo
fi
