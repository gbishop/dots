#!/bin/bash
/home/gb/bin/log .bashrc starts
/home/gb/bin/log TERM is $TERM
export HOST=`hostname -s`
/home/gb/bin/log HOST is $HOST

# deduplicate a path
# from: https://www.linuxjournal.com/content/removing-duplicate-path-entries#comment-4225932493
dedup() {
  n=
  IFS=':'
  for e in $1
  do
    [[ :$n == *:$e:* ]] || n+=$e:
  done
  echo "${n:0: -1}"
}

PATH=$(dedup /home/gb/bin:/home/gb/.local/bin:$PATH)

export MANPATH=$(dedup $MANPATH:/home/gb/share/man)

# If not running interactively, quit
[ -z "$PS1" ] && return

/home/gb/bin/log .bashrc continues

# enable vi mode
set -o vi

# use real path on symbolic links
set -P

# disable ctrl-s because it confuses me
stty stop undef start undef

# keep history forever and combined
export HISTCONTROL=ignoredups
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTIGNORE='ls:bg:fg:history'
export HISTFILE=~/.persistent_history
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND="history -a;"

export EDITOR="vim"

fgcolor() {
  printf "\[\e[1;$1m\]"
}
nocolor() {
  printf "\[\e[m\]"
}

# Load Debian's native Git prompt helper
if [ -f /usr/lib/git-core/git-prompt.sh ]; then
    . /usr/lib/git-core/git-prompt.sh
elif [ -f /usr/lib/git-core/git-sh-prompt ]; then
    . /usr/lib/git-core/git-sh-prompt
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

build_ps1() {
    # Properly escaped ANSI color codes
    local RED='\[\e[1;31m\]'
    local BLUE='\[\e[1;34m\]'
    local GREEN='\[\e[1;32m\]'
    local RESET='\[\e[0m\]'

    # 1. Hostname check (only show if SSH'd in OR not on carbon)
    local host_str=""
    if [[ -n "$SSH_CLIENT" ]]; then
        host_str="${RED}\h:${RESET}"
    fi

    # 2. Read-only folder check
    local lock_str=""
    if [[ ! -w . ]]; then
        lock_str="${RED} LOCKED${RESET}"
    fi

    # 3. Git status
    local git_str=""
    if declare -f __git_ps1 &>/dev/null; then
        git_str="$(__git_ps1 ' %s')"
    fi

    # Assemble: [host:] directory [git status] [LOCKED] $
    PS1="${host_str}${BLUE}\W${RESET}${GREEN}${git_str}${RESET}${lock_str}\$ "
}

PROMPT_COMMAND=build_ps1


# Alias definitions.
alias ls='ls -F --hide=__pycache__ '
alias more=less

# realize a link
realizelink() {
  [ -L "$1" ] && cp --remove-destination "$(readlink "$1")" "$1"
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi


# configure fzf
if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
fi

# load up cd hack
[ -f ~/dots/z.sh/z.sh ] && source ~/dots/z.sh/z.sh

# node version manager
export NVM_DIR="/home/gb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VIRTUAL_ENV_DISABLE_PROMPT=1
[ -f ~/python/bin/activate ] && source ~/python/bin/activate

#
[ -f ~/.cargo.env ] && . ~/.cargo/env

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.local/kitty.app/bin"
PATH=$(dedup $PATH)

/home/gb/bin/log .bashrc ends
