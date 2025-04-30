if status is-interactive
alias v="vim"
alias vi="vim"
alias ri="ranger"
alias rim="ranger"

#alias cat="bat"
#alias ls="eza --icons"

alias minecraft="prime-run java -jar /home/coast/documents/TLauncher.jar"

export EDITOR=vim

alias cdwm="cd ~/.suckless/dwm && doas vim config.h; cd -"
alias cpicom="vim ~/.config/picom/picom.conf"
alias mdwm="cd ~/.suckless/dwm && doas make install && cd -"
alias cneo="vim ~/.config/neofetch/con*"

function sudo() {
    echo "Error: fuck you don't use this command"
}

function fish_prompt
    set_color fe8019
    printf '[ '
    set_color yellow
    printf '%s' (whoami)
    set_color white
    printf '@'
    set_color cyan
    printf 'coasteen'
    set_color white
    printf ' in '
    set_color brblue
    printf '%s' (prompt_pwd)
    set_color fe8019
    printf ' ] '
    set_color normal
end
set -g fish_greeting
end