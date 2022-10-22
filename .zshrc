HISTFILE="$HOME/.histfile"
HISTSIZE=1000
SAVEHIST=1000

setopt extendedglob nomatch

# Emacs bindings (default)
# Vi bindings
bindkey -v

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

export EDITOR=nvim
export VISUAL=nvim
# Color man pages
export LESS='-R --use-color -Dd+r$Du+b'
export CGO_ENABLED=0
export PATH="$PATH:$HOME/.local/bin"
# Android dev tools for React Native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/go/bin/"

export _JAVA_AWT_WM_NONREPARENTIN=1

# fancy prompt
eval "$(starship init zsh)"
# let the system's package manager deal with these things
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# KITTY shell integration
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi
