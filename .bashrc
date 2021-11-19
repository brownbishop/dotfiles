bat_stat() {
    local status=`cat /sys/class/power_supply/BAT0/status`
    local capacity=`cat /sys/class/power_supply/BAT0/capacity`
    local icon=""

    if [[ status == "Charging" ]] ; then
        icon=""
    else
        if [ $capacity -ge 75 ] ; then
            icon=""
        fi
        if [ $capacity -ge 30 ] ; then
            icon=""
        fi
    fi

    [ $capacity -le 35 ] && echo "$icon $capacity"
}

__ps1() {
    local bold="\[$(tput bold)\]" \
        r='\[\e[31m\]' g='\[\e[32m\]' b='\[\e[34m\]' \
        y='\[\e[33m\]' p='\[\e[35m\]' c='\[\e[36m\]' \
        x='\[\e[0m\]'
    PS1="$r[$y\u$g@$c\h $p\W $b\[$(bat_stat)\]$r]$y\$ $x"
}

PROMPT_COMMAND=__ps1

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

#eval "$(starship init bash)"

