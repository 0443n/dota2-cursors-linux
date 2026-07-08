#!/usr/bin/env bash
# Install a Dota 2 cursor pack into ~/.local/share/icons and optionally apply it.
#
#   ./install.sh --list                       # show available packs
#   ./install.sh dota2-mirana                 # install
#   ./install.sh dota2-mirana --apply         # install + set as active cursor
#   ./install.sh --system dota2-mirana        # install for all users (needs sudo)
#
# The pack argument may be a bare name (resolved against ./themes) or a path.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
THEMES_DIR="$SCRIPT_DIR/themes"

list_packs() {
  echo "Available packs:"
  for d in "$THEMES_DIR"/*/; do
    [ -d "$d/cursors" ] && echo "  $(basename "$d")"
  done
}

APPLY=0 SYSTEM=0 ARG=""
for a in "$@"; do
  case "$a" in
    --list)   list_packs; exit 0 ;;
    --apply)  APPLY=1 ;;
    --system) SYSTEM=1 ;;
    *)        ARG="$a" ;;
  esac
done

if [ -z "$ARG" ]; then
  echo "usage: ./install.sh <pack-name|path> [--apply] [--system]" >&2
  list_packs >&2
  exit 1
fi

# Resolve pack: a real dir path, or a bare name under themes/.
if [ -d "$ARG/cursors" ]; then
  THEME="$ARG"
elif [ -d "$THEMES_DIR/$ARG/cursors" ]; then
  THEME="$THEMES_DIR/$ARG"
else
  echo "error: no cursor pack '$ARG'" >&2
  list_packs >&2
  exit 1
fi

NAME="$(basename "$THEME")"
if [ "$SYSTEM" -eq 1 ]; then
  DEST="/usr/share/icons/$NAME"
  echo ">> installing to $DEST (sudo)"
  sudo rm -rf "$DEST"; sudo cp -r "$THEME" "$DEST"
else
  DEST="$HOME/.local/share/icons/$NAME"
  echo ">> installing to $DEST"
  mkdir -p "$HOME/.local/share/icons"; rm -rf "$DEST"; cp -r "$THEME" "$DEST"
fi

if [ "$APPLY" -eq 0 ]; then
  echo ">> installed. Pick '$NAME' in your DE's cursor settings, or re-run with --apply."
  exit 0
fi

echo ">> applying '$NAME' ..."
applied=0
if command -v gsettings >/dev/null 2>&1; then
  gsettings set org.gnome.desktop.interface cursor-theme "$NAME" 2>/dev/null && applied=1 || true
  gsettings set org.mate.peripherals-mouse cursor-theme "$NAME" 2>/dev/null || true
fi
command -v plasma-apply-cursortheme >/dev/null 2>&1 && \
  plasma-apply-cursortheme "$NAME" 2>/dev/null && applied=1 || true
command -v xfconf-query >/dev/null 2>&1 && \
  xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "$NAME" 2>/dev/null && applied=1 || true

if [ "$applied" -eq 1 ]; then
  echo ">> applied. On Wayland, log out/in for every app to pick it up."
else
  echo ">> could not auto-apply; select '$NAME' manually in cursor settings."
  echo "   (add ~/.local/share/icons to XCURSOR_PATH if apps don't see it)"
fi
