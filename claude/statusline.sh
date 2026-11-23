#!/bin/bash
# Claude Code status line: worktree folder, branch (* when dirty), gh-stack position, session label.

input=$(cat)
dir=$(jq -r '.workspace.current_dir // .cwd' <<<"$input")
session_id=$(jq -r '.session_id // empty' <<<"$input")
label_file="$HOME/.claude/statusline-labels/$session_id"
if [ -n "$session_id" ] && [ -s "$label_file" ]; then
  label=$(head -1 "$label_file")
else
  label=$(jq -r '.session_name // empty' <<<"$input")
fi

status_file="$HOME/.claude/session-status/$session_id.txt"
if [ -n "$session_id" ] && [ -s "$status_file" ]; then
  status=$(head -1 "$status_file")
fi

if ! top=$(git -C "$dir" rev-parse --show-toplevel 2>/dev/null); then
  printf '%s' "$(basename "$dir")"
  [ -n "$label" ] && printf ' > \033[35m%s\033[0m' "$label"
  [ -n "$status" ] && printf ' · %s' "$status"
  exit 0
fi

git() { command git -C "$dir" --no-optional-locks "$@"; }

branch=$(git symbolic-ref --short -q HEAD || git rev-parse --short HEAD)
[ -n "$(git status --porcelain | head -1)" ] && dirty="*"

stackfile="$(cd "$dir" && command git rev-parse --path-format=absolute --git-common-dir)/gh-stack"
if [ -f "$stackfile" ]; then
  stack=$(jq -r --arg b "$branch" '
    .stacks[] | [.branches[].branch] as $bs | ($bs | index($b)) as $i
    | select($i != null) | "stack \($i + 1)/\($bs | length)"
  ' "$stackfile" 2>/dev/null | head -1)
fi

printf '\033[36m%s\033[0m > \033[32m%s%s\033[0m' "$(basename "$top")" "$branch" "$dirty"
[ -n "$stack" ] && printf ' > \033[33m%s\033[0m' "$stack"
[ -n "$label" ] && printf ' > \033[35m%s\033[0m' "$label"
[ -n "$status" ] && printf ' · %s' "$status"
exit 0
