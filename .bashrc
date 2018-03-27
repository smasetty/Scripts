[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#aliases
alias code='cd /Users/sharatmasetty/Documents/CodeChefPractice'
alias js='cd /Users/sharatmasetty/Documents/web_development/js/bootcamp'
alias ls='ls -G'
alias ll='ls -laFG'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias tmux="TERM=screen-256color-bce tmux"
alias vim="vim -X"
alias df='df -h'
alias du='du -c -h'
alias grep='grep -R -n --color=auto'
alias more='less'

export HISTCONTROL=ignoredups
export HISTSIZE=1000            # bash history will save N commands
export HISTFILESIZE=${HISTSIZE} # bash will remember N commands
export HISTCONTROL=ignoreboth   # ingore duplicates and spaces
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'
export PATH=~/vim:$PATH

shopt -s cdspell
shopt -s cmdhist
shopt -s checkwinsize            # Update windows size on command
shopt -s histappend              # Append History instead of overwriting file
shopt -s cmdhist                 # Bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s expand_aliases
shopt -s extglob                 # Extended pattern
shopt -s no_empty_cmd_completion # No empty completion

stty -ixon

mkdircd() { mkdir -p "$@" && eval cd "\"\$$#\""; }
