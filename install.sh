#!/usr/bin/env sh
# Install the myvoice skill.
# Usage: ./install.sh [claude|codex|agents|all]
set -e

SRC="$(cd "$(dirname "$0")" && pwd)/myvoice"
TARGET="${1:-all}"

[ -f "$SRC/SKILL.md" ] || { echo "ERROR: $SRC/SKILL.md not found"; exit 1; }

install_to() {
  dest="$1/myvoice"
  mkdir -p "$1"
  rm -rf "$dest"
  cp -r "$SRC" "$dest"
  echo "installed -> $dest"
}

case "$TARGET" in
  claude) install_to "$HOME/.claude/skills" ;;
  codex)  install_to "$HOME/.codex/skills" ;;
  agents) install_to "$HOME/.agents/skills" ;;
  all)    install_to "$HOME/.claude/skills"; install_to "$HOME/.codex/skills" ;;
  *) echo "Usage: ./install.sh [claude|codex|agents|all]"; exit 1 ;;
esac

echo "Done. Restart your agent, then type /myvoice"
