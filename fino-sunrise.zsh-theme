# fino-time.zsh-theme
  
######## Taken from sunrise theme
# Color shortcuts
R=$fg_no_bold[red]
GR=$fg_no_bold[green]
M=$fg_no_bold[magenta]
Y=$fg_no_bold[yellow]
B=$fg_no_bold[blue]
G=$FG[239]
RESET="%{$reset_color%}"
#local return_code="%(?..%{$R%}%? ↵%{$RESET%})"

# Get the status of the working tree (copied and modified from git.zsh)
custom_git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  # Non-staged
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^.M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  # Staged
  if $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^M' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_ADDED$STATUS"
  fi

  if $(echo -n "$STATUS" | grep '.*' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_STATUS_PREFIX$STATUS"
  fi

  echo $STATUS
}

# get the name of the branch we are on (copied and modified from git.zsh)
function custom_git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$GROUP_PREFIX%{$Y%}${ref#refs/heads/}$(parse_git_dirty)$(git_prompt_ahead)$(custom_git_prompt_status) %{$Y%}λ$(git_prompt_short_sha)$GROUP_SUFFIX"
}

GROUP_PREFIX="%{$G%}(%{$RESET%}"
GROUP_SUFFIX="%{$G%})%{$RESET%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$R%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$B%}➔"

ZSH_THEME_GIT_STATUS_PREFIX=" "

# Staged
ZSH_THEME_GIT_PROMPT_STAGED_ADDED="%{$GR%}A"
ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED="%{$GR%}M"
ZSH_THEME_GIT_PROMPT_STAGED_RENAMED="%{$GR%}R"
ZSH_THEME_GIT_PROMPT_STAGED_DELETED="%{$GR%}D"

# Not-staged
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$R%}?"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$R%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$R%}D"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$R%}UU"

#########################
#
#
# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell

# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
  #  git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo ')' && return
    echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

RPS1="${return_code}%{$RESET%}"

PROMPT="%(?..%{$R%}%? ↵%{$RESET%})
%{$G%}╭─%{$FG[040]%}%n%{$reset_color%}%{$G%}@%{$reset_color%}%{$FG[033]%}$(box_name)%{$reset_color%}%{$GROUP_PREFIX%}%{$terminfo[bold]$FG[226]%}%~%{$reset_color%}%{$GROUP_SUFFIX%}%{$reset_color%}\$(custom_git_prompt)\$(ruby_prompt_info)%{$G%} %*
╰─\$(virtualenv_info)\$(prompt_char) %{$RESET%}"

