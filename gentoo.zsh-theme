function prompt_char {
   if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

# Hide computer-name when not on ssh
function {
    if [[ -n "$SSH_CLIENT" ]]; then
        PROMPT_HOST="@$HOST)"
    else
        PROMPT_HOST=''
    fi
}

local ret_status="%(?:%{$fg_bold[green]%}Ξ:%{$fg_bold[red]%}%S↑%s%?)"

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n)$PROMPT_HOST %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
