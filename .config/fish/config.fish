if status is-interactive
alias emacs="swallow emacs"
alias ri="ranger"
alias rim="ranger"

alias man="batman"
alias cat="bat"
alias ls="eza --icons"

alias minecraft="prime-run java -jar /home/coast/Documents/TLauncher.jar"

export EDITOR=emacs

alias cdwm="cd ~/.suckless/dwm && doas vim config.h; cd -"
alias cpicom="emacs ~/.config/picom/picom.conf"
alias mdwm="cd ~/.suckless/dwm && doas make install && cd -"
alias cneo="emacs ~/.config/neofetch/con*"

function vim() {
    echo "Error: use emacs. you have to."
}
end
function sudo() {
    echo "Error: fuck you don't use this command"
}
end
function fish_prompt
    set_color fe8019
    printf '['
    set_color yellow
    printf '%s' (whoami)
    set_color white
    printf '@'
    set_color cyan
    printf 'coasteen '
    set_color white
    #printf ''
    set_color brblue
    printf '%s' (prompt_pwd)
    set_color fe8019
    printf ']$ '
    set_color normal
end
set -g fish_greeting
end
set -U fish_color_autosuggestion '808080'
bash