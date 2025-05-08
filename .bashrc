#
# ~/.bashrc
#

## ## ## SWALLOWS (
    alias emacs="swallow emacs"
    alias zathura="swallow zathura"
    alias mpv="swallow mpv"
    alias eom="swallow eom"
    alias caja="swallow caja"
    alias sxiv="swallow sxiv"
    alias ffplay="swallow ffplay"
## ## ## SWALLOWS )

## ## ## EXPORT (
    export EDITOR="emacsclient -ca /usr/bin/emacs"
    export BROWSER="brave"
    export TERMINAL="st"
    export PATH="$HOME/.local/bin:$PATH"
## ## ## EXPORT )

## ## ## TABLE A ( "General shortcuts / spelling mistake shortcuts"
    alias c="clear"
    alias cd..="cd .."
    alias claer="clear"
    alias claer="clear"
    alias clare="clear"
    alias cleae="clear"
    alias clera="clear"
## ## ## TABLE A )

## ## ## TABLE B ( "Program/application shortcuts"
    alias minecraft="prime-run java -jar /home/coast/documents/TLauncher.jar"
    alias ls="betterls"
## ## ## TABLE B )

## ## ## TABLE C ( "Config shortcuts"
    alias cdwm="cd ~/.suckless/dwm && doas vim config.h; cd -"
    alias cpicom="swallow emacs ~/.config/picom/picom.conf"
    alias mdwm="cd ~/.suckless/dwm && doas make install && cd -"
    alias cneo="swallow emacs ~/.config/neofetch/config.conf"
## ## ## TABLE C )

## ## ## PROMPT (
PS1='\[\e[38;5;31m\][\[\e[38;5;39m\]\u\[\e[38;5;32m\]@\[\e[38;5;39m\]\H\[\e[0m\] \[\e[38;5;34m\]\w\[\e[38;5;31m\]]\[\e[0m\] '
## ## ## PROMPT )
