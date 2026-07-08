# Dota 2 cursors - Windows

Windows cursor schemes built from Dota 2's in-game cursors. See the
[pack gallery](../README.md#packs) for what each one looks like.

Dota already ships its cursors as Windows `.ani` files, so these are the real
game cursors, repackaged as installable schemes.

## Install

1. Get a pack folder from `schemes/` (clone the repo, or download the pack's
   `.zip` from a release and extract it).
2. Open the folder, right-click `install.inf`, and choose **Install**. This
   copies the cursors and registers the scheme.
3. Open **Settings -> Bluetooth & devices -> Mouse -> Additional mouse settings
   -> Pointers**, pick the scheme (for example "Dota 2 - Acid Hydra") from the
   Scheme dropdown, and click OK.

The install already sets the scheme for your account, so the cursors also apply
after the next sign-in even if you skip step 3.

## What's in a pack

Each scheme has seven cursor files mapped onto Windows' cursor slots:

| File | Windows roles |
|------|---------------|
| `arrow` | Normal, App Starting, Busy, Text, Alternate |
| `link` | Link Select (Hand) |
| `precision` | Precision Select (Crosshair) |
| `move` | Move and all four resize handles |
| `drag` | Handwriting (NWPen) |
| `unavailable` | Unavailable (No) |
| `help` | Help Select |

Files are `.ani` for most packs; the Emerald Sea and Guardian of the Holy Flame
packs ship as `.cur` because Dota stores those two as static bitmaps.

The cursors are 32px (the size Dota ships), so on a high-DPI display you may want
a larger cursor size in Windows settings. They won't scale as smoothly as the
Linux themes, which carry extra sizes.
