# SuperCollider / TidalCycles — only active on machines with SuperCollider
# installed (personal laptop). Sourced from .zshrc.

if [[ -x "/Applications/SuperCollider.app" ]]; then
  alias sc='open -a SuperCollider $HOME/Music/SuperCollider/startup.scd'
fi

[[ -x "$HOME/.ghcup/bin/ghci" ]] && export PATH="$HOME/.ghcup/bin:$PATH"

if command -v ghci &>/dev/null && [ -n "$(ls $HOME/.cabal/share/*/tidal-*/BootTidal.hs 2>/dev/null)" ]; then
  alias tidal="ghci -ghci-script $(ls $HOME/.cabal/share/*/tidal-*/BootTidal.hs 2>/dev/null | tail -1)"
  alias dirtopen='cd $HOME/Library/Application\ Support/SuperCollider/downloaded-quarks/Dirt-Samples'
fi
