# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# HighLight
if [ ! -r "${HOME}/.cache/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${HOME}/.cache/zsh-syntax-highlighting
fi
source "${HOME}/.cache/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Suggest
if [ ! -r "${HOME}/.cache/zsh-autosuggestions" ]; then
  echo "null s"
  git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${HOME}/.cache/zsh-autosuggestions
fi
source "${HOME}/.cache/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Complete
if [ ! -r "${HOME}/.cache/zsh-completions" ]; then
  git clone https://github.com/zsh-users/zsh-completions \
  ${HOME}/.cache/zsh-completions
fi
source "${HOME}/.cache/zsh-completions/zsh-completions.plugin.zsh"

# Theme
if [ ! -r "${HOME}/.cache/Powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${HOME}/.cache/powerlevel10k
fi
source "${HOME}/.cache/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.cache/p10k.zsh ]] || source ~/.cache/p10k.zsh

# FASD
if [ ! "$(command -v fasd)" ]; then
  if [ "$(uname)" = "Darwin" ]; then
    brew install fasd
  elif [[ $(uname -a) =~ "arch" ]]; then
    pacman -Syu fasd
  fi
fi
fasd_cache="${HOME}/.cache/fasd-init-bash"
if [ "$(command -v fasd)" -nt "${fasd_cache}" -o ! -s "${fasd_cache}" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "${fasd_cache}"
fi
source "${fasd_cache}"
unset fasd_cache


# Proxy
#
function proxy() {
  export http_proxy=http://127.0.0.1:8889;
  export https_proxy=http://127.0.0.1:8889;
  export all_proxy=http://127.0.0.1:8889;
}

function unproxy() {
  unset http_proxy;
  unset https_proxy;
  unset all_proxy;
}

# GOBIN
#
export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOBIN

# Doom PATH
#
export PATH=$PATH:$HOME/.config/emacs/bin

# Alias
#
alias ls="ls --color=auto"
alias ll="ls -al --color=auto"
alias la="ls -a --color=auto"
alias tailf="tail -f"

# History
#
if [ ! -r "${HOME}/.cache/zsh_history" ]
then
  touch "${HOME}/.cache/zsh_history"
fi
export HISTSIZE=2000
export HISTFILE="$HOME/.cache/zsh_history"
export SAVEHIST=$HISTSIZE

