# Dota 2 cursors for Linux

Dota 2's in-game cursor packs, converted to Linux Xcursor themes you can
download and install. You don't need to own or subscribe to anything in Dota to
use them.

Every pack covers the whole set of desktop cursors, not just the arrow: the
link hand, text caret, crosshair, drag, resize, and not-allowed. Once you apply
one, it shows up across the whole desktop rather than in just a few apps.

<p align="center">
  <img src="previews/_gallery.png" width="420" alt="all packs">
</p>

## Install

```bash
git clone https://github.com/0443n/dota2-cursors-linux
cd dota2-cursors-linux

./install.sh --list                      # see all packs
./install.sh dota2-acid-hydra --apply    # install and set active
```

`--apply` also switches your active cursor, detecting GNOME, KDE, XFCE, and
MATE. `--system` installs to `/usr/share/icons` for everyone on the machine and
needs sudo. If you'd rather skip the script, copy any folder from `themes/` into
`~/.local/share/icons/` and pick it in your desktop's cursor settings.

On Wayland you usually have to log out and back in before every app switches over.

## Packs

Names are the real store names, taken from Dota's item files. The hero each
pack was made for is in parentheses.

| Preview | Pack | `install.sh` name |
|---------|------|-------------------|
| ![](previews/dota2-acid-hydra.png) | Acid Hydra (Venomancer) | `dota2-acid-hydra` |
| ![](previews/dota2-wrath-of-ka.png) | Wrath of Ka (Necrophos) | `dota2-wrath-of-ka` |
| ![](previews/dota2-dac-2015-mirana.png) | DAC 2015 Mirana | `dota2-dac-2015-mirana` |
| ![](previews/dota2-dac-2015-crystal-maiden.png) | DAC 2015 Crystal Maiden | `dota2-dac-2015-crystal-maiden` |
| ![](previews/dota2-dac-2015-chaos-knight.png) | DAC 2015 Chaos Knight | `dota2-dac-2015-chaos-knight` |
| ![](previews/dota2-steam-chopper.png) | Steam Chopper (Timbersaw) | `dota2-steam-chopper` |
| ![](previews/dota2-unbroken-stallion.png) | Unbroken Stallion (Centaur) | `dota2-unbroken-stallion` |
| ![](previews/dota2-warcog.png) | Warcog (Clockwerk) | `dota2-warcog` |
| ![](previews/dota2-tine-of-the-behemoth.png) | Tine of the Behemoth (Earthshaker) | `dota2-tine-of-the-behemoth` |
| ![](previews/dota2-emerald-sea.png) | Emerald Sea | `dota2-emerald-sea` |
| ![](previews/dota2-guardian-of-the-holy-flame.png) | Guardian of the Holy Flame (Sven) | `dota2-guardian-of-the-holy-flame` |
| ![](previews/dota2-the-summit-3.png) | The Summit 3 | `dota2-the-summit-3` |
| ![](previews/dota2-default.png) | Default | `dota2-default` |

Each row shows, left to right: arrow, link, crosshair, move, drag, not-allowed, help.

## Notes

The cursors scale. Each one ships several sizes (24 up to 192 px), so the
cursor-size slider in your desktop settings works. The art starts from Dota's
32px originals, so the largest sizes are upscaled and look a little soft up
close.

They're static. Dota's cursor files are single frames; the glow and motion you
see in-game are added by the engine while you play, not stored in the art. These
are the same images, standing still.

Dota has no text caret, busy spinner, or resize handles, so those three reuse
the arrow and move cursors instead of borrowing from another theme.

Inside each `cursors/` folder the real files use the current freedesktop names
(`default`, `pointer`, `crosshair`, and so on). Everything else is a symlink:
old X11 names like `left_ptr`, plus the hex-named files (`03b6e0fc...`) that some
web browsers ask for by hash instead of by name.

## About the artwork

This is a fan project. It isn't affiliated with Valve, and Valve hasn't endorsed
it. The cursors are Valve's artwork, pulled out of Dota 2 for personal desktop
use, and this repo doesn't claim to own any of it. If you're from Valve and want
it gone, open an issue and it comes down.
