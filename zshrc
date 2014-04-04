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

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt histignoredups
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Try to correct command line spelling
setopt correct correctall

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# load thoughtbot/dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
