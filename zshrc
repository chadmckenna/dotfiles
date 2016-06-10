[[ -f /etc/profile ]] && source /etc/profile

last_exit_code="$?"
esc=$'\e[' end_esc=m
noprint='%{' end_noprint='%}'
wrap="$noprint$esc" end_wrap="$end_esc$end_noprint"
space=" "
sep=""
rsep=""
alt_sep=""
alt_rsep=""
reset="${wrap}0${end_wrap}"
reset_bg="${wrap}49${end_wrap}"
a_fg="${wrap}38;5;17${end_wrap}"
a_bg="${wrap}48;5;190${end_wrap}"
a_sep_fg="${wrap}38;5;190${end_wrap}"
b_fg="${wrap}38;5;255${end_wrap}"
b_bg="${wrap}48;5;238${end_wrap}"
b_sep_fg="${wrap}38;5;238${end_wrap}"
c_fg="${wrap}38;5;85${end_wrap}"
c_bg="${wrap}48;5;234${end_wrap}"
c_sep_fg="${wrap}38;5;234${end_wrap}"

# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "${a_bg}${space}${a_fg}${ref#refs/heads/}${space}${reset}${a_sep_fg}${b_bg}${sep}"
  fi
}
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
function database_from_current_branch() {
  echo $(current_branch) | sed -r 's#\/#_#g'
}

setopt promptsubst
export PS1=$'$(git_prompt_info)${b_bg}${space}${b_fg}${SSH_CONNECTION+"%n$space$alt_sep$space%m"}${space}${reset}${b_sep_fg}${c_bg}${sep}${space}${c_fg}%~${space}${reset}${c_sep_fg}${sep}${reset}${space}'

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

export NVM_DIR="/home/cmckenna/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
