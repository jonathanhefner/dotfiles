# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return


# Prompt "\n[TIME(aqua)] PWD(blue)\n$ "
# via http://ezprompt.net/
export PS1="\n[\[\e[36m\]\t\[\e[m\]] \[\e[34m\]\w\[\e[m\]\n\\$ "


# Path
export PATH=~/bin:$PATH


# XDG Base Directory paths for a (hopefully) cleaner home directory
# see https://wiki.archlinux.org/index.php/XDG_Base_Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share


# Editor
if command -v subl >/dev/null 2>&1 ; then
  export EDITOR='subl -w'
else
  export EDITOR='nano'
fi


### History

# Disable history expansion because it can yield unexpected results,
# in particular in interpolated command args.
# Use reverse-search-history (Ctrl+r) instead.
set +H

# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# '&' is a special pattern which suppresses duplicate entries
# '[ \t]*' is a pattern which suppresses any commands that begin with a space
# '?' and '??' are patterns which suppress (trivial) one- and two-character commands
export HISTIGNORE=$'&:[ \t]*:exit:clear:fg:bg'

# Save multi-line commands as one command
shopt -s cmdhist

# Append to the history file, don't overwrite it
shopt -s histappend

# Enable incremental history search with up / down arrows
# via http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'


### Auto-completion & globbing

# Display matches for ambiguous patterns on first tab key press
bind "set show-all-if-ambiguous on"

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

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


### Functions

set_terminal_title() {
  echo -ne "\e]2;$@\a\e]1;$@\a";
}

in_each_dir() {
  find . -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d '' subdir; do
    (cd "$subdir" && eval "$*");
  done
}


### Secrets

if [ -f ~/.bashrc_secrets ]; then
  . ~/.bashrc_secrets
fi
