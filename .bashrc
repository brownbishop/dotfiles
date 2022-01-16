shopt -s cdspell

set -o vi

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

[ -f "/usr/share/bash-completion/bash_completion" ] && source "/usr/share/bash-completion/bash_completion"

PATH=$PATH:/home/catalin/.local/bin
export EDITOR=nvim
export VISUAL=nvim
# Color man pages
export LESS='-R --use-color -Dd+r$Du+b'

# Android dev tools for React Native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(starship init bash)"

bind 'set show-mode-in-prompt on'

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
