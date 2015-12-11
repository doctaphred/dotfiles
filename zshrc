ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

source "${HOME}/.zgen/zgen/zgen.zsh"

# Check for .zgen/init.zsh
if ! zgen saved; then
    echo "Loading zgen plugins"

    zgen oh-my-zsh
    zgen oh-my-zsh plugins/autojump
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/fasd
    zgen oh-my-zsh plugins/thefuck

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src

    # Custom prompt
    # zgen oh-my-zsh themes/robbyrussell
    zgen load bhilburn/powerlevel9k powerlevel9k

    echo "Creating a zgen save"
    zgen save
fi

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

# fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Suppress nonzero exit code if ~/.zshrc.local not found
true
