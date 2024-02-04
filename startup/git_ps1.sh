#!/bin/bash

# Add git information to prompt
# https://git-scm.com/book/uz/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash
# Style inspired by https://github.com/mischavandenburg/dotfiles/blob/main/.bashrc
if [[ -f "$HOME/dotfiles/git-prompt.sh" ]]; then
	source "$HOME/dotfiles/git-prompt.sh"
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
# Explicitly unset color (default anyhow). Use 1 to set it.
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"
# export GIT_PS1_SHOWUPSTREAM="auto git"
# colorized prompt
PS1='\[\e[33m\]\u\[\e[0m\]:\[\e[35m\]\W\[\e[0m\]$(__git_ps1 " (%s)")\$ '
