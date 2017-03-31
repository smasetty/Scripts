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

# Colors for use in PS1 that may or may not change when
# set_prompt_colors is run
PROMPT_COLORS=()

# Change the prompt colors to a theme, themes are 0-29
set_prompt_colors() {
	local h=${1:-0}
	local color=
	local i=0
	local j=0
	for i in {22..231}; do
		((i % 30 == h)) || continue

		color=${COLOR256[$i]}
		# cache the tput colors
		if [[ -z $color ]]; then
			COLOR256[$i]=$(tput setaf "$i")
			color=${COLOR256[$i]}
		fi
		PROMPT_COLORS[$j]=$color
		((j++))
	done
}

#PS1='$(ret=$?;(($ret!=0)) && echo "\[${COLOR256[0]}\]($ret) \[${COLOR256[256]}\]")'\
#'\[${PROMPT_COLORS[0]}\]\[${COLOR256[257]}\]$(((UID==0)) && echo "\[${COLOR256[0]}\]")\u\[${COLOR256[256]}\] '\
#'- \[${PROMPT_COLORS[3]}\]\h\[${PROMPT_COLORS[4]}\] '\
#'\[${PROMPT_COLORS[2]}\]\[${PROMPT_COLORS[2]}\]'"$(uname | tr '[:upper:]' '[:lower:]')"'\[${PROMPT_COLORS[2]}\] '\
#'\[${PROMPT_COLORS[5]}\]\w '\
#'$(branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); [[ -n $branch ]] && echo "\[${PROMPT_COLORS[2]}\](\[${PROMPT_COLORS[3]}\]git:$branch\[${PROMPT_COLORS[2]}\]) ")'\
#'\[${PROMPT_COLORS[0]}\]\$\[${COLOR256[256]}\] '

PS1='$(ret=$?;(($ret!=0)) && echo "\[${COLOR256[0]}\]($ret) \[${COLOR256[256]}\]")'\
'\[${PROMPT_COLORS[0]}\]\[${COLOR256[257]}\]$(((UID==0)) && echo "\[${COLOR256[0]}\]")\u\[${COLOR256[256]}\] '\
'\[${PROMPT_COLORS[5]}\]\w '\
'$(branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); [[ -n $branch ]] && echo "\[${PROMPT_COLORS[2]}\](\[${PROMPT_COLORS[3]}\]git:$branch\[${PROMPT_COLORS[2]}\]) ")'\
'\[${PROMPT_COLORS[0]}\]\$\[${COLOR256[256]}\] '

# set the theme
set_prompt_colors 2
