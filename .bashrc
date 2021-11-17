export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 5)\]\W \[$(tput setaf 1)\]]\[$(tput setaf 3)\]\\$ \[$(tput sgr0)\]"

shopt -s cdspell

#set -o vi

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

[ -f "/usr/share/bash-completion/bash_completion" ] && source "/usr/share/bash-completion/bash_completion"

PATH=$PATH:/home/catalin/.local/bin
export EDITOR=nvim
export VISUAL=nvim
export STEAM_COMPAT_DATA_PATH=$HOME/proton
# Color man pages
export LESS='-R --use-color -Dd+r$Du+b'

# Android dev tools for React Native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$PATH:$HOME/flutter/bin"
export IDEA_JDK="/home/catalin/jbr/jbr_jcef-11_0_12-linux-x64-b1504.27"
export JAVA_HOME="/usr/lib/jvm/default"

eval "$(starship init bash)"

