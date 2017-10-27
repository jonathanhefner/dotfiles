# Resources
#   - http://ezprompt.net/
#   - https://github.com/mrzool/bash-sensible

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return



# Prompt "\n[TIME(aqua)] PWD(blue)\n$ "
export PS1="\n[\[\e[36m\]\t\[\e[m\]] \[\e[34m\]\w\[\e[m\]\n\\$ "



# Path
export PATH=~/bin:$PATH



# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
#set -o noclobber



### History

# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# '&' is a special pattern which suppresses duplicate entries
# '[ \t]*' is a pattern which suppresses any commands that begin with a space
# '?' and '??' are patterns which suppress (trivial) one- and two-character commands
export HISTIGNORE=$'&:[ \t]*:exit:clear:fg:bg:ls:pwd'

# Save multi-line commands as one command
shopt -s cmdhist

# Append to the history file, don't overwrite it
shopt -s histappend

# Enable incremental history search with up / down arrows
# See http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'



### Auto-completion & globbing

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

## Prepend cd to directory names automatically
#shopt -s autocd 2> /dev/null

## Use case-insensitive filename globbing
#shopt -s nocaseglob

## Ignore small typos when changing directory
## For example, cd /vr/lgo/apaache would find /var/log/apache
#shopt -s cdspell 2> /dev/null

## Correct spelling errors during tab-completion
#shopt -s dirspell 2> /dev/null



### Aliases
# To override the alias instruction use a \ before the command,
# e.g. \ls will call the real ls not the alias

alias ls='ls --almost-all --file-type --group-directories-first'
alias ll='ls -o --human-readable --time-style="+%Y-%m-%d %H:%M:%S" --dereference'

alias less='less -r'  # ignore raw control characters

alias grep='grep --color=auto -E'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# human readable disk usage figures
alias df='df -h'
alias du='du -h'

# where, sort of
alias whence='type -a'



### Functions

set_terminal_title() {
  echo -ne "\e]2;$@\a\e]1;$@\a";
}



### Include secrets

if [ -f ~/.bashrc_secrets ]; then
    . ~/.bashrc_secrets
fi