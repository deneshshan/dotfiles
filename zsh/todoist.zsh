# todoist CLI — aliases active when the binary is installed.

if command -v todoist &>/dev/null; then
  alias t="todoist --color"
  alias tfw='todoist --color l -p -f "#wawa"'
  alias tfi='todoist --color l -p -f "#Inbox"'
  alias taw='todoist --color a -N "wawa"'
else
  echo "\033[38;5;12mtodoist is not installed\033[0m"
fi
