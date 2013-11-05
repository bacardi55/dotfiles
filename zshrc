# -----------------------|
# ZSHRC                  |
# @author Raphael Khaiat |
# @modified 11/12/12     |
# -----------------------|

# History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
PATH=/home/bacardi55/script/:$PATH;
# History lines are added as soon as they are entered
setopt inc_append_history

# Prompt
#PS1="[%n@%M %~]%# "
#RPS1="%{"$'\033[01;34m'"%}(%T)%{"$'\033[00m'"%}"

# environment
export EDITOR=vim
export VISUAL=vim
export BROWSER="firefox"
export PAGER="most -s"
export XTERM="urxvtc"
export HOST

alias ls="ls --color=always"
alias ll="ls++"
alias l="ls++"
alias la="ls++ -A"
alias lla="ll -AhF"
alias ld="ls -l | grep '^d'"    # show folders only
alias lf="ls -l | grep -v '^d'" # show files only
alias grep='grep --color=auto'
#alias cp='cp --interactive'
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
alias df='dfc'
alias du='du -hc'

alias pacman="pacman-color"

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

## Ssh ##
# Michaelpage
alias ssh_mp_stg="ssh mpagesig@staging-3415.prod.hosting.acquia.com"
alias ssh_mp_preprod="ssh mpagesig@web-5871.prod.hosting.acquia.com"
alias ssh_mp_prod="ssh mpagesig@web-3664.prod.hosting.acquia.com"

## proxy socks
alias proxy_socks='ssh -D 5569 bacardi55@kim.bacardi55.org -p22 -N'

# Conf'
setopt autocd auto_pushd pushd_ignore_dups correct hist_verify hist_ignore_dups
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

autoload -U colors terminfo
colors


fpath=($fpath /usr/local/share/doc/task/scripts/zsh)
autoload -Uz compinit
compinit

# try to fix Java uglyness
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Stuff for VCS infos
local reset white green red blue yellow
reset="%{${reset_color}%}"
white="%{$fg[white]%}"
green="%{$fg_bold[green]%}"
red="%{$fg[red]%}"
blue="%{$fg[blue]%}"
yellow="%{$fg[yellow]%}"

# Display the title, and append the command if given in $1
function title {
  t="%n@%m %~"

  case $TERM in
    screen)
      print -nP "\ek$t\e\\"
      print -nP "\e]0;$t\a"
      ;;
    xterm*|rxvt*|(E|e)term)
      print -nP "\e]0;$t\a"
      ;;
  esac
}

# precmd()
function precmd {
  title

  local deco="%{${fg_no_bold[white]}%}"

  if [[ -O "$PWD" ]]; then
    local path_color="${fg_no_bold[blue]}"
  elif [[ -w "$PWD" ]]; then
    local path_color="${fg_bold[green]}"
  else
    local path_color="${fg_bold[red]}"
  fi

  if [[ $UID -eq 0 ]]; then
    local user_color="${fg_bold[red]}"
  else
    local user_color="${fg_bold[default]}"
  fi

  local return_code="%(?..${deco}!%{${fg_bold[red]}%}%?${deco}! )"
  local user_at_host="%{${user_color}%}%n${deco}@%{${host_color}%}%m"
  local cwd="%{${path_color}%}%32<...<%~"
  local sign="%(!.%{${fg_bold[red]}%}.${deco})%#"

  PS1="${return_code}${deco}[${user_at_host} ${cwd}${deco}] ${sign}%{${reset_color}%} "
}

cLess() {ccze -A < $1 | less -R;}
cTail() {tail -f $1 | ccze -A;}

grepSvn() {grep -rin --exclude-dir="*svn*" $1 ./}

vimf() {
  vim $(find . -name $1)
}

source /home/bacardi55/workspace/perso/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

