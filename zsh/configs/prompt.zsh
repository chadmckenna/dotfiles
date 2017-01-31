# modify the prompt to contain git branch name if applicable
if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv version | awk '{print $1}')"
  fi

  if (( $+commands[rvm-prompt] ))
  then
    echo "$(rvm-prompt | awk '{print $1}')"
  fi
}

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]]
  then
    echo "%{$fg_bold[magenta]%}($(ruby_version))%{$reset_color%} "
  else
    echo ""
  fi
}

git_prompt_info() {
  current_branch=$($git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo "$current_branch"
  fi
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo " %{$fg_bold[green]%}●%{$reset_color%} $(git_prompt_info)"
    else
      echo " %{$fg_bold[red]%}◦%{$reset_color%} %{$fg[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

ssh_connection() {
  echo "${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}"
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%2d%{$reset_color%}"
}
setopt promptsubst
PS1='$(ssh_connection)$(rb_prompt)$(directory_name)$(git_dirty) › '
