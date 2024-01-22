#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.

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

# Add python3.8
PATH=$(dedup $PATH)

export PYTHONPATH=/home/gb/python/extensions:$PYTHONPATH
PYTHONPATH=$(dedup $PYTHONPATH)

export MANPATH=$(dedup $MANPATH:/home/gb/share/man)

# Add ruby
PATH=$(dedup $PATH:/home/gb/.gem/ruby/2.7.0/bin)

# Add lua-language-server why do I need this?
# PATH=$(dedup $PATH:/home/gb/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/)

# If not running interactively, quit
[ -z "$PS1" ] && return

# Remember TERM
export REALTERM=${REALTERM:-$TERM}

fgcolor() {
  printf "\[\e[1;$1m\]"
}
nocolor() {
  printf "\[\e[m\]"
}

hcolor=$(fgcolor 31) # red
dcolor=$(fgcolor 34) # blue
gcolor=$(fgcolor 32) # green

# start tmux if conditions are right
/home/gb/bin/log term is "$TERM"
export HOST=`hostname -s`
/home/gb/bin/log host is "$HOST"

session="$(sed s/penguin/CB/ <<< $HOST)"

case $TERM in
    rxvt-unicode-256color | xterm-kitty)
      /home/gb/bin/log TMUX is $TMUX
      xcape -e Control_L=Escape
	[ -z "$TMUX" -a ! -f "notmux" ] && exec tmux -2 new-session -A -s $session
	;;
esac

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

# set the EDITOR variable so I'm in control
export EDITOR=vim

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"


PS1='$ '
SHOW_HOST=''
if [ -n "$SSH_CLIENT" -o $HOST != gb -a $HOST != penguin ]; then
  SHOW_HOST="$hcolor\h:$(nocolor)"
fi

if [ -f /usr/bin/git ]; then
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    if [ -f /usr/lib/git-core/git-sh-prompt ]; then
        . /usr/lib/git-core/git-sh-prompt;
    elif [ -f /etc/bash_completion.d/git ]; then
        . /etc/bash_completion.d/git
    else
        [ -t 1 ] && echo "Did not find git prompt"
    fi
    case "$TERM" in
    xterm*|screen*|tmux*)
      export PS1="$SHOW_HOST$dcolor\W$(nocolor)$gcolor"'`__git_ps1 " %s"`'"$(nocolor)\$ "
        ;;
    *)
        export PS1="$SHOW_HOST"'\W`__git_ps1`$ '
        ;;
    esac
fi
# set the pane title for my ssh hack
# if [ -n "$TMUX" -o "$TERM" = "tmux-256color" ]; then
#     export PS1=$PS1'\[\e]2;\h:\w\e\\\ek\h:\W\e\\\]'
# fi

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

if [ -f ~/.docker-completion.sh ]; then
    . ~/.docker-completion.sh
fi
if [ -f ~/share/bash/git-completion.bash ]; then
    . ~/share/bash/git-completion.bash
fi


# configure fzf
source /usr/share/doc/fzf/examples/key-bindings.bash

# try redefining their function to include all previous
# __fzf_history__() (
#   cat ~/.persistent_history | $(__fzfcmd) +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r
# )
#
# load up cd hack
[ -f ~/dotfiles/z/z.sh ] && source ~/dotfiles/z/z.sh

# node version manager
export NVM_DIR="/home/gb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# initialize python virtual env
export VIRTUAL_ENV_DISABLE_PROMPT=1
[ -f ~/.virtual.sh ] && source ~/.virtual.sh
if [ -f ~/virtualenvs/work/bin/python ]; then
  setv work
fi

[ -f ~/.cargo.env ] && . ~/.cargo/env

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH=$(dedup $PATH)

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


/home/gb/bin/log .bashrc ends
