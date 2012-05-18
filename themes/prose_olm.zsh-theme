if [ "x$OH_MY_ZSH_HG" = "x" ]; then
    OH_MY_ZSH_HG="hg"
fi

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    $OH_MY_ZSH_HG prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}><%{$fg[red]%}-<closed>%{$reset_color%}> \
at <%{$fg[cyan]%}<update>>%{$fg_bold[yellow]%}<rev>%{$reset_color%}:%{$fg[white]%}<node|short>\
< %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown>%{$reset_color%}
" 2>/dev/null
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '%#'
}

function battery_charge {
    echo `/usr/bin/python /usr/local/bin/batcharge.py` 2>/dev/null
}

PROMPT='
%{$fg[red]%}➜  \
%{$fg_bold[magenta]%}%n%{$reset_color%}\
%{$fg[white]%}@\
%{$fg_bold[white]%}$(box_name) \
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}\
$(hg_prompt_info)\
$(git_prompt_info)
$(virtualenv_info)\
%{$fg_bold[yellow]%}$(prompt_char) %{$reset_color%}\
'

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
RPROMPT='\
%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%})\
${return_status}\
$(battery_charge)%{$reset_color%} \
%{$fg_bold[black]%}%T%{$reset_color%}\
'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
