export TERM=xterm-256color
[[ -n "$TMUX" ]] && export TERM=screen-256color

ZSH="$HOME/dotfiles/oh-my-zsh"
ZSH_THEME="sporty_256"
COMPLETION_WAITING_DOTS="true"
setopt HIST_IGNORE_SPACE
plugins=(command-coloring sublime python)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
unsetopt correct

alias t='~/Dropbox/todo/todo.sh' # Todo.txt
alias rf='rm -Rf'
alias lh='ls -lAd .*'
alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
alias ei='vim ~/.i3/config'
alias gst='git status -sb'
alias std='st -a .'
alias ta='tmux attach-session -t '
alias tn='tmux new-session -s '
alias v='/usr/local/bin/vim'
export DISABLE_AUTO_TITLE="true"
export CLICOLOR=true
export LS_COLORS="di=38;5;222:fi=38;5;59:ln=38;5;116:ex=38;5;107:ow=48;5;33;38;5;230:tw=48;5;235;38;5;33"
export LSCOLORS='exfxcxdxbxegedabagacad'

# Ctrl-Esc-S to insert sudo at the start of line.
insert_sudo () { zle beginning-of-line; zle -U "sudo "; }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# Ctrl-Esc-D to insert current date at cursor.
insert-datestamp() { LBUFFER+=${(%):-'%D{%Y-%m-%d}'}; }
zle -N insert-datestamp
bindkey '^[d' insert-datestamp

# Ctrl-Esc-Space to insert double space prefix at the start of line.
insert_space() { zle beginning-of-line; zle -U "  "; }
zle -N insert-space insert_space
bindkey "^[ " insert-space

export PATH=$PATH:$HOME/bin:$HOME/.rvm/bin
export XBMC_HOME=/usr/share/XBMC

## Google Specific
if [[ "$HOST" =~ "corp.google.com" && -e "$HOME/.zshrc.google" ]]; then
  source "$HOME/.zshrc.google"
fi
