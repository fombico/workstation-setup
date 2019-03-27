function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo "→"; fi
}

function git_pair() {
	ACTIVE=$(git config git-together.active)
	command [ $ACTIVE ] && echo "$ACTIVE " 2>/dev/null
}

function git_info() {
	INDEX=$(command git status --porcelain -b 2> /dev/null)

	   STAGED="`echo $INDEX | grep '^[AM]. ' | wc -l | sed -e 's/^[ \t]*//g'`"
	 MODIFIED="`echo $INDEX | grep '^.[MD] ' | wc -l | sed -e 's/^[ \t]*//g'`"
	UNTRACKED="`echo $INDEX | grep '^?? '    | wc -l | sed -e 's/^[ \t]*//g'`"
	SHOW_FLAG=" %{$fg_bold[red]%}✗%{$fg_bold[green]%}"

	if [[ ("$MODIFIED" = "0")]] && [[ ("$STAGED" = "0") ]];  then SHOW_FLAG=" ✔" fi
	if [ "$STAGED" = "0" ];    then STAGED=""    else    STAGED=" S:"$STAGED     fi
	if [ "$MODIFIED" = "0" ];  then MODIFIED=""  else  MODIFIED=" Δ:"$MODIFIED   fi
	if [ "$UNTRACKED" = "0" ]; then UNTRACKED="" else UNTRACKED=" ?:"$UNTRACKED  fi

	if command git status > /dev/null 2>&1; then
		echo $(git_pair)"["$(git_current_branch)$(git_commits_ahead)$(git_commits_behind)${STAGED}${MODIFIED}${UNTRACKED}${SHOW_FLAG}"]"
	fi
}

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[magenta]%}%n@)%m %{$fg_bold[green]%}%(!.%1~.%~)
$(git_info) %_$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=" ↑"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX=" ↓"