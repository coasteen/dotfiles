#!/usr/bin/zsh
HISTFILE=$HOME/.cache/zsh/history
SAVEHIST=100000000
HISTSIZE=$SAVEHIST
setopt appendhistory
#tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
#oh my zsh
ZSH_THEME="gentoo"
plugins=(git)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
#source
source "$HOME/.config/shell/aliases"
source "$HOME/.config/shell/exports"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(/usr/share/zsh/site-functions $fpath)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#colors
autoload -U colors && colors
setopt prompt_subst
#prompt
[ "$(id -u)" = 0 ] && PS1ICON="#" || PS1ICON='%'
PROMPT='%{$(echo -e "\e[38;2;254;128;25m")%}[%{$(echo -e "\e[38;2;235;219;178m")%}%n%{$(echo -e "\e[38;2;200;200;200m")%}@%{$(echo -e "\e[38;2;131;165;152m")%}coast %{$(echo -e "\e[38;2;235;219;178m")%}%~%{$(echo -e "\e[38;2;254;128;25m")%}]%$PS1ICON%{$(echo -e "\e[0m")%} '
#vi mode
bindkey -v
bindkey "^?" backward-delete-char
export KEYTIMEOUT=1
#vi keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#flashing block for insert mode, steady for normal
function zle-keymap-select () {
	case $KEYMAP in
		vicmd) echo -ne '\e[1 q';;      # block
		viins|main) echo -ne '\e[5 q';; # beam
	esac
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins #initiate "vi insert" as keymap
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' #use steady beam on startup
preexec() { echo -ne '\e[2 q' }
#ctrl+e edits current line in vim
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
