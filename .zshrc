##
### .zshrc
## coasteen's .zshrc
#
############
## PROMPT ##
############
#
## CUSTOM PROMPT
PROMPT="[ $%n@%m %~ ] "
#
## STARSHIP (MUST BE INSTALLED!)
#eval "$(starship init zsh)"
#
## OH-MY-POSH (MUST BE INSTALLED!)
#eval "$(oh-my-posh init zsh)"
#
#############
## ALIASES ##
#############
#
alias v="vim"
alias vi="vim"

#alias cat="bat"
#alias ls="eza --icons"

alias minecraft="prime-run java -jar /home/coast/documents/TLauncher.java"

alias cdwm="cd ~/.suckless/dwm && doas vim config.h; cd -"
alias cpicom="vim ~/.config/picom/picom.conf"
alias mdwm="cd ~/.suckless/dwm && doas make install && cd -"
alias cneo="vim ~/.config/neofetch/con*"

function sudo() {
    echo "Error: This command is forbidden. USE DOAS INSTEAD." >&2
    return 1
}

###############
## AUTOSTART ##
###############
#
#hyfetch