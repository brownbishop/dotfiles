#shopt -s cdspell

set -o vi

shopt -s histappend
shopt -s checkwinsize

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

[ -f "/usr/share/bash-completion/bash_completion" ] && source "/usr/share/bash-completion/bash_completion"

complete -c man which

PATH=$PATH:/home/catalin/.local/bin:/opt/Xilinx/Vivado/2020.2/bin
export EDITOR=nvim
export VISUAL=nvim
# Color man pages
export LESS='-R --use-color -Dd+r$Du+b'

# Android dev tools for React Native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:~/tmp/server/bin"
export PATH="$PATH:~/go/bin/"

export _JAVA_AWT_WM_NONREPARENTIN=1
eval "$(starship init bash)"

# Vi mode indicator
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string "\1\e[1;33m\2I\1\e[0m\2"'
bind 'set vi-cmd-mode-string "\1\e[1;31m\2N\1\e[0m\2"'

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

bind 'set menu-complete-display-prefix on'
bind 'TAB: menu-complete'
# Color files by types
# Note that this may cause completion text blink in some terminals (e.g. xterm).
bind 'set colored-stats On'
# Append char to indicate type
bind 'set visible-stats On'
# Color the common prefix
bind 'set colored-completion-prefix On'
# Color the common prefix in menu-complete
bind 'set menu-complete-display-prefix On'

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
