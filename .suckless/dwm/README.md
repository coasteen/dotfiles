## DWM
This is one of my favorite window managers, it's great - very customizable.
Credits to Swindles McCoop on Github and YouTube, I've cloned their dwm build and made my own configurations to it.

## Compiling
### Dependencies
X11, Xinerama, xcb, freetype, rofi, slock, Alacritty
### Instructions
Run `./configure` to properly set up `config.mk`.
#### Linux
`make && sudo make install`
#### BSD
`gmake && doas gmake install`

## Keybinds:
- `MODKEY + Enter` - Spawn Alacritty (MUST BE INSTALLED)
- `MODKEY + Shift + Enter`, `F12` - Toggle scratchpad terminal
- `MODKEY + r` - Rofi (MUST BE INSTALLED)
- `MODKEY + s` - Kill window
- `MODKEY + m` - Toggle status bar
- `MODKEY + f` - Toggle fullscreen
- `MODKEY + o/O` - Increase/decrease number of masters
- `MODKEY + j/k` - Move focus down/up
- `MODKEY + J/K` - Move window in stack down/up
- `MODKEY + SHIFTMASK + q` - Kill DWM
- `MODKEY + Space` - Set all windows to Floating mode
- `MODKEY + K/J` - Change focused window in on the direction of K/J on a qwerty keyboard
- `MODKEY + SHIFTMASK + K/J` - Move window in on the direction of K/J on a qwerty keyboard
- `MODKEY + H/L` - Expand/shrink master window in direction of H/L on a qwerty keyboard
- `MODKEY + SHIFTMASK + L` - Lock using slock (MUST BE INSTALLED)