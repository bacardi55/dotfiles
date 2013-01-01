# -----------------------|
# ZSHRC                  |
# @author Raphael Khaiat |
# @modified 11/12/12     |
# -----------------------|

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PATH=/home/bacardi55/script/:$PATH;

# Prompt
PS1="[%n@%M %~]%# "
RPS1="%{"$'\033[01;34m'"%}(%T)%{"$'\033[00m'"%}"

# environment
export EDITOR=vim
export VISUAL=vim
export BROWSER="firefox"
export PAGER="most -s"
export XTERM="urxvtc"

alias ll="ls++"
alias ls="ls++"
alias l="ls++"
alias la="ls++ -a"
alias ld="ls -l | grep '^d'"    # show folders only
alias lf="ls -l | grep -v '^d'" # show files only
alias grep='grep --color=auto'
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'
alias c='clear'
alias cd..='cd ..'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias top="htop"
alias more="most -s"
#alias less="most"
alias df='df -h'
alias du='du -hc'

# sudo alias
alias halt='sudo halt'
alias reboot='sudo reboot'

# dev alias
alias del_svn_dir='find . -name ".svn" -type d -exec rm -rf {} \;'

# alias mutt
alias mutt="rename_urxvt.sh mutt && mutt"
alias mutt_cap="rename_urxvt.sh mutt_cap && mutt -F ~/.muttrc_cap"

# i3WebManager aliases
alias i3CliStartHome="cd .i3/i3WebManager-0.3 && php console i3CliManager:start home"
alias i3CliStartWork="cd .i3/i3WebManager-0.3 && php console i3CliManager:start work"

# Conf'
setopt appendhistory autocd auto_pushd pushd_ignore_dups correct hist_verify hist_ignore_dups
unsetopt beep clobber

bindkey -e
zstyle :compinstall filename '/home/bacardi55/.zshrc'

# Définition des touches
bindkey -v                    # vi(1) keybinds.
bindkey ^X edit-command-line  # Run $EDITOR to write a command.
bindkey ^A beginning-of-line  # Go to the beginning of line.
bindkey ^E end-of-line        # Go to the end of line.
bindkey '^[[2~' overwrite-mode  # Overwrite mode on insert key.
bindkey '^[[3~' delete-char     # The backspace delete the last character.
bindkey '^[[5~' history-search-backward # Page up to go back in history.
bindkey '^[[6~' history-search-forward  # Page down to go forward in history.

# Useful settings for the home and end keys, they have not the same code on
# all terminals.
case $TERM in
screen)                               # For screen/tmux terms.
        bindkey '^[[1~' beginning-of-line
        bindkey '^[[4~' end-of-line
        ;;
rxvt*|vt[21][20]0)                    # For rxvt, rxvt-unicode and vt* ttys.
        bindkey '^[[7~' beginning-of-line
        bindkey '^[[8~' end-of-line
        ;;
xterm|cons25)                                # For xterm.
        bindkey '^[[H' beginning-of-line
        bindkey '^[[F' end-of-line
        ;;
*)                                    # For others.
        bindkey '^[[1~' beginning-of-line
        bindkey '^[[4~' end-of-line
        ;;
esac

# Schémas de complétion

# - Schéma A :
# 1ère tabulation : complète jusqu'au bout de la partie commune
# 2ème tabulation : propose une liste de choix
# 3ème tabulation : complète avec le 1er item de la liste
# 4ème tabulation : complète avec le 2ème item de la liste, etc...
# -> c'est le schéma de complétion par défaut de zsh.

# Schéma B :
# 1ère tabulation : propose une liste de choix et complète avec le 1er item
#                   de la liste
# 2ème tabulation : complète avec le 2ème item de la liste, etc...
# Si vous voulez ce schéma, décommentez la ligne suivante :
#setopt menu_complete

# Schéma C :
# 1ère tabulation : complète jusqu'au bout de la partie commune et
#                   propose une liste de choix
# 2ème tabulation : complète avec le 1er item de la liste
# 3ème tabulation : complète avec le 2ème item de la liste, etc...
# Ce schéma est le meilleur à mon goût !
# Si vous voulez ce schéma, décommentez la ligne suivante :
unsetopt list_ambiguous


# 5. Complétion des options des commandes
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' use-compctl false

autoload -Uz compinit
compinit

zmodload zsh/complist
compdef yaourt=pacman
alias pacman="pacman-color"

fpath=($fpath /usr/local/share/doc/task/scripts/zsh)
autoload -Uz compinit
compinit

cczeLess() {ccze -A < $1 | less -R;}
cczeTail() {tail -f $1 | ccze -A;}

grepSvn() {grep -rin --exclude-dir="*svn*" $1 ./}
