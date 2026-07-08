# Dota 2 cursors - Linux

Xcursor themes built from Dota 2's in-game cursors. See the
[pack gallery](../README.md#packs) for what each one looks like.

## Install

From a clone:

```bash
git clone https://github.com/0443n/dota2-cursors
cd dota2-cursors/linux

./install.sh --list                      # see all packs
./install.sh dota2-acid-hydra --apply    # install and set active
```

Or from a release archive, without cloning:

```bash
tar xf dota2-acid-hydra.tar.gz -C ~/.local/share/icons/
# then pick "Acid Hydra Cursor Pack" in your desktop's cursor settings
```

`--apply` switches your active cursor and detects GNOME, KDE, XFCE, and MATE.
`--system` installs to `/usr/share/icons` for every user and needs sudo. On
Wayland you usually have to log out and back in before every app switches over.

## Notes

Each cursor ships seven sizes (24 to 192 px), so the cursor-size slider in your
settings works. The art comes from Dota's 32px originals, so the largest sizes
are upscaled.

Inside each `themes/<pack>/cursors/` folder the real files use the current
freedesktop names (`default`, `pointer`, `crosshair`, and so on). The rest are
symlinks: old X11 names like `left_ptr`, plus hex-named files that some browsers
request by hash.
