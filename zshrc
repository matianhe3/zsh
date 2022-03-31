# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.8.1
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.cache/p10k.zsh ]] || source ~/.cache/p10k.zsh

# FASD
fasd_cache="$HOME/.cache/fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook >| "$fasd_cache"
fi
source "$fasd_cache"
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
alias ll="ls -al"
alias la="ls -a"
alias tailf="tail -f"

# History
#
export HISTSIZE=2000
export HISTFILE="$HOME/.cache/zsh_history"
export SAVEHIST=$HISTSIZE
