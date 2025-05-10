#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
## ## ## COASTEEN'S ~/.zshrc
#

## ## ## OH MY ZSH (
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="gentoo"
    plugins=(
	git
	zsh-autosuggestions
        )
    source $ZSH/oh-my-zsh.sh
## ## ## OH MY ZSH )
    
## ## ## SWALLOWS (
    alias emacs="swallow emacs"
    alias zathura="swallow zathura"
    alias mpv="swallow mpv"
    alias eom="swallow eom"
    alias caja="swallow caja"
    alias sxiv="swallow sxiv"
    alias ffplay="swallow ffplay"
    alias pluma="swallow pluma"
## ## ## SWALLOWS )

## ## ## EXPORT AND SOURCE (
    export EDITOR="emacsclient -ca /usr/bin/emacs"
    export BROWSER="brave"
    export TERMINAL="st"
    export PATH="$HOME/.local/bin:$PATH"
## ## ## EXPORT )

## ## ## TABLE A ( "General shortcuts / spelling mistake shortcuts"
    alias c="clear"
    alias "cd.."="cd .."
    alias claer="clear"
    alias claer="clear"
    alias clare="clear"
    alias cleae="clear"
    alias clera="clear"
## ## ## TABLE A )

## ## ## TABLE B ( "Program/application shortcuts"
    alias minecraft="prime-run java -jar /home/coast/documents/TLauncher.jar"
    alias ls="betterls"
    alias setwall="xwallpaper --center"
    alias emacs="swallow emacs"
    alias vim="swallow emacs"
    alias vi="swallow emacs"
    alias e="swallow emacs"
    alias v="swallow emacs"
    alias nvim="swallow emacs"
    alias helix="swallow emacs"
    alias ascdis="neofetch --ascii_distro"
## ## ## TABLE B )

## ## ## TABLE C ( "Config shortcuts"
    alias cdwm="cd ~/.suckless/dwm && sudo swallow emacs config.h; cd -"
    alias cpicom="swallow emacs ~/.config/picom/picom.conf"
    alias mdwm="cd ~/.suckless/dwm && doas make install && cd -"
    alias cneo="swallow emacs ~/.config/neofetch/config.conf"
## ## ## TABLE C )
