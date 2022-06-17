# Proxy
#
function proxy() {
  export http_proxy=http://127.0.0.1:7890;
  export https_proxy=http://127.0.0.1:7890;
  export all_proxy=http://127.0.0.1:7890;
}

function unproxy() {
  unset http_proxy;
  unset https_proxy;
  unset all_proxy;
}

# LSP Lua
#
export PATH=$PATH:"${HOME}/.local/lua-language-server/bin"

# PIP, adb PATH
#
if [ "$(uname)" = "Darwin" ]; then
  A_PATH="${HOME}/Library/Python/3.9/bin:${HOME}/Library/Android/sdk/platform-tools"
elif [[ $(uname -a) =~ "arch" ]]; then
  A_PATH="${HOME}/.local/bin"
fi
export PATH=$PATH:$A_PATH

# GO PATH
#
export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOBIN

# Doom PATH
#
# export PATH=$PATH:$HOME/.config/emacs/bin

# Alias
#
alias ls="ls --color=auto"
alias ll="ls -al --color=auto"
alias la="ls -a --color=auto"
alias tailf="tail -f"
# kitty shortcat
alias icat="kitty +kitten icat"
alias diff="kitty +kitten diff"

# History
#
if [ ! -r "${HOME}/.zsh_history" ]
then
  touch "${HOME}/.zsh_history"
fi
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
alias history="history 1"


# HighLight
#
if [ ! -r "${HOME}/.cache/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${HOME}/.cache/zsh-syntax-highlighting
fi
source "${HOME}/.cache/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Suggest
#
if [ ! -r "${HOME}/.cache/zsh-autosuggestions" ]; then
  echo "null s"
  git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${HOME}/.cache/zsh-autosuggestions
fi
source "${HOME}/.cache/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Complete
#
if [ ! -r "${HOME}/.cache/zsh-completions" ]; then
  git clone https://github.com/zsh-users/zsh-completions \
  ${HOME}/.cache/zsh-completions
fi
source "${HOME}/.cache/zsh-completions/zsh-completions.plugin.zsh"

# Theme
#
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ ! -r "${HOME}/.cache/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${HOME}/.cache/powerlevel10k
fi
source "${HOME}/.cache/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.cache/p10k.zsh ]] || source ~/.cache/p10k.zsh

# FASD
#
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

# FZF
#
if [ ! -s "${HOME}/.fzf/bin/fzf"  ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
  ~/.fzf/install
fi

if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi

[[ $- == *i* ]] && source "${HOME}/.fzf/shell/completion.zsh" 2> /dev/null

source "${HOME}/.fzf/shell/key-bindings.zsh"
