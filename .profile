#!/bin/sh
export EDITOR=/usr/bin/nvim
# export QT_STYLE_OVERRIDE=kvantum
export _JAVA_AWT_WM_NONREPARENTING=1

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
    export MOZ_ENABLE_WAYLAND=""
    unset MOZ_ENABLE_WAYLAND
fi
# . "$HOME/.cargo/env"
