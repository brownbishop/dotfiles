shopt -s cdspell
set -o vi

shopt -s histappend
shopt -s checkwinsize

[[ -f ~/.profile ]] && source ~/.profile

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

[ -f "/usr/share/bash-completion/bash_completion" ] && source "/usr/share/bash-completion/bash_completion"

complete -c man which

export EDITOR=nvim
export VISUAL=nvim
# Color man pages
export LESS='-R --use-color -Dd+r$Du+b'

export PATH="$HOME/.local/bin:$PATH"
# Android dev tools for React Native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/go/bin/"
export PATH="$PATH:$HOME/.cargo/bin/"
export PATH="$PATH:$HOME/flutter/bin/"
export PATH=$PATH:$HOME/.local/go/bin
export PATH=$PATH:$HOME/.zig
export GO_PATH="$HOME/go"
export CGO_ENABLED=1


export _JAVA_AWT_WM_NONREPARENTIN=1

# borrowed from https://github.com/rwxrob/dot/blob/main/.bashrc
# --------------------------- smart prompt ---------------------------
#                 (keeping in bashrc for portability)

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
  local P='$' dir="${PWD##*/}" B countme short long double\
    r='\[\e[31m\]' g='\[\e[37m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.
  countme="$USER$PROMPT_AT$(cat /etc/hostname):$dir($B)\$ "

  [[ $B == master || $B == main ]] && b="$r"
  [[ -n "$B" ]] && B="$g($b$B$g)"

  short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
  long="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n$g$g╚ $p$P$x "
  double="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir\n$g$g║ $B\n$g╚ $p$P$x "

  if (( ${#countme} > PROMPT_MAX )); then
    PS1="$double"
  elif (( ${#countme} > PROMPT_LONG )); then
    PS1="$long"
  else
    PS1="$short"
  fi
}

__prompt_compute() {
    # use ligtht colors
    local red='\[\e[91m\]' \
        green='\[\e[92m\]' \
        yellow='\[\e[93m\]' \
        blue='\[\e[94m\]' \
        purple='\[\e[95m\]' \
        cyan='\[\e[96m\]' \
        grey='\[\e[97m\]' \
        reset='\[\e[0m\]'
    branch=$(git branch --show-current 2>/dev/null)
    [[ -n "$branch" ]] && branch="$grey($red$branch$grey)"
    PS1="$red[$yellow\u$green@$blue\h$grey:$purple\W $branch$red]$reset\$ "
}

PROMPT_COMMAND="__prompt_compute"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION


# pnpm
export PNPM_HOME="/home/catalin//.local/share/pnpm/"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

export VCPKG_ROOT="$HOME/.vcpkg/vcpkg"
export PATH="$VCPKG_ROOT:$PATH"
