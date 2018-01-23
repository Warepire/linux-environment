# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob notify
unsetopt autocd beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/warepire/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PATH=$PATH:~/bin

fpath=(~/.zsh $fpath)

function last_exit_status_string () {
	local __LAST_COMMAND_RESULT=$?
	local __LAST_COMMAND_SUCCESS="%{$fg_bold[green]%}%{✔%G%}%{$reset_color%}"
	local __LAST_COMMAND_FAILURE="%{$fg[red]%}%{✖%G%}-$__LAST_COMMAND_RESULT%{$reset_color%}"
	if [[ $__LAST_COMMAND_RESULT -eq 0 ]]; then
		echo $__LAST_COMMAND_SUCCESS
	else
		echo $__LAST_COMMAND_FAILURE
	fi
}

function zle-line-init {
	CURRENT_KEY_MAP="${${${KEYMAP}/vicmd/CMD}/(main|viins)/INS}"
	RPROMPT='$(last_exit_status_string) ${CURRENT_KEY_MAP}'
	zle reset-prompt
}
zle -N zle-line-init
export KEYTIMEOUT=1

source ~/.zsh-git-prompt/zshrc.sh
PROMPT='%{$fg[yellow]%}%~%{$reset_color%} $(git_super_status)'$'\n''%{$fg[white]%}%n %#%{$reset_color%} '
