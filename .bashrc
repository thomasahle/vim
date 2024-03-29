# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

color_prompt=yes

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
alias ls='gls --group-directories-first --color=auto -F'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


################################################################################
# My own changes below
################################################################################

export EDITOR='vim'
alias pip='pip3'
alias py='python3'
alias ipy='ipython3 --TerminalInteractiveShell.editing_mode=vi'
# alias open='xdg-open' (On linux)
alias factor='gfactor'
alias rm="rm -i"

export PATH="$HOME/.local/bin:$PATH"
set -o vi

# some more ls aliases
alias ll='ls -l --color=always'
alias less='less -R'

# Local PIP
export PATH="/Users/ahle/Library/Python/3.9/bin:$PATH"
export PATH="/usr/local/opt/python@3/bin:$PATH"

export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend # When the shell exits, append to the history file instead of overwriting it
# Share history between shells
# Maybe I don't want this afterall...
HISTCONTROL=ignoredups:erasedups # Avoid duplicates
#PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r" # After each command, append to the history file and reread it

# Show git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# Mac OS Local brew
export PATH="$HOME/homebrew/bin:$PATH"
export PATH="$HOME/homebrew/sbin:$PATH"
export PATH="$HOME/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="$HOME/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/homebrew/opt/gnu-getopt/bin:$PATH"
export PATH="$HOME/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="$HOME/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOME/homebrew/opt/gawk/libexec/gnubin:$PATH"
# Global homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
# My bin stuff
export PATH="$HOME/.bin:$PATH"


# Other environment variables
export OPENAI="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"


# Stop Chrome Swipe Navigation (mac)
defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

#if [ "$TERM_PROGRAM" != "vscode" ]; then
#    #Start tmux
#   # See https://unix.stackexchange.com/a/113768/13344
#   if command -v tmux &> /dev/null \
#            && [ -n "$PS1" ] \
#            && [[ ! "$TERM" =~ screen ]] \
#            && [[ ! "$TERM" =~ tmux ]] \
#            && [[ ! "$TERM" =~ dumb ]] \
#            && [ -z "$TMUX" ]; then
#     exec tmux new-session -A -s main
#   fi
#fi
