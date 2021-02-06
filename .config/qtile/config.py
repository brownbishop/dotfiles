# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import re
import psutil
import socket
import subprocess

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, hook

from typing import List  # noqa: F401

# set mod key to mod(also known as the Windows key)
mod = "mod4"
myTerm = "alacritty"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, "shift"], "k", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn(myTerm)),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "q", lazy.window.kill()),

    # Layout navigation (Vim like bindings)
    #Key([mod], "h", lazy.layout.left()),
    #Key([mod], "l", lazy.layout.right()),
    #Key([mod, "shift"], "h", lazy.layout.swap_left()),
    #Key([mod, "shift"], "l", lazy.layout.swap_right()),
    #Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    #Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    #Key([mod], "i", lazy.layout.grow()),
    #Key([mod], "m", lazy.layout.shrink()),
    #Key([mod], "n", lazy.layout.normalize()),
    #Key([mod], "o", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    Key([mod, "control"], "h", lazy.layout.increase_ratio()),
    Key([mod, "control"], "l", lazy.layout.decrease_ratio()),

    # Restart WM
    Key([mod, "shift"], "r", lazy.restart()),

    # Quit WM
    Key([mod, "shift"], "q", lazy.shutdown()),

    Key([mod], "r", lazy.spawncmd()),

    # dmenu
    Key([mod], "d", lazy.spawn("rofi-dmenu")),

    #Toggle bar
    Key([mod], "b", lazy.hide_show_bar("top")),

    # Toggle fullscreen for selected window
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Toggle floating for selected window
    Key([mod], "t", lazy.window.toggle_floating()),

    # Web browser shortcut
    Key([mod], "w", lazy.spawn("chromium")),

    # Lockscreen
    Key([mod], "s", lazy.spawn("i3lock-fancy-rapid 5 4")),

    # Sound
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "pamixer -d 5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "pamixer -i 5")),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),

    # Music
    Key([], "XF86AudioPlay", lazy.spawn("audacious -t")),
    Key([], "XF86AudioNext", lazy.spawn("audacious -f")),
    Key([], "XF86AudioPrev", lazy.spawn("audacious -r")),

    # Screenshot
    Key([], "Print", lazy.spawn("gnome-screenshot"))
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(
            i.name, switch_group=True)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])
layout_theme = {"border_width": 2,
                "margin": 6,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }

layouts = [
    # layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Stack(stacks=2, **layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.Stack(num_stacks=2),
    layout.Columns(**layout_theme),
    layout.Floating(**layout_theme)
]

colors = [["#282828", "#282828"], # panel background
          ["#434758", "#434758"], # background for current screen tab
          ["#ebdbb2", "#ebdbb2"], # font color for group names
          ["#cc241d", "#cc241d"], # border line color for current tab
          ["#98971a", "#98971a"], # border line color for other tab and odd widgets
          ["#458588", "#458588"], # color for the even widgets
          ["#d79921", "#d79921"]] # window name

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="Mononoki Nerd Font",
    fontsize=14,
    padding=2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0,
                    padding=3,
                    foreground=colors[0],
                    background=colors[0],
                ),
                widget.Image(
                    filename="~/.config/qtile/icons/python.png",
                    mouse_callbacks={
                        'Button1': lambda qtile: qtile.cmd_spawn('dmenu_run')},
                    background=colors[0]
                ),
                widget.GroupBox(
                    font="JetBrains Mono Nerd Font",
                    fontsize=11,
                    margin_y=3,
                    margin_x=0,
                    padding_y=5,
                    padding_x=3,
                    borderwidth=3,
                    active=colors[2],
                    inactive=colors[2],
                    rounded=False,
                    highlight_color=colors[1],
                    highlight_method="line",
                    this_current_screen_border=colors[3],
                    this_screen_border=colors[4],
                    other_current_screen_border=colors[0],
                    other_screen_border=colors[0],
                    foreground=colors[3],
                    background=colors[0]
                ),
                widget.Prompt(
                    prompt=prompt,
                    font="JetBrains Mono Nerd Font",
                    padding=10,
                    foreground=colors[3],
                    background=colors[1]
                ),
                widget.Sep(
                    linewidth=0,
                    padding=40,
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.WindowName(
                    foreground=colors[6],
                    background=colors[0],
                    padding=0
                ),
                widget.KeyboardLayout(
                    background=colors[0],
                    foreground=colors[3],
                    configured_keyboards=['us','ro'],
                ),
                widget.Backlight(
                    backlight_name="intel_backlight",
                    format=' {percent:2.0%}',
                    foreground=colors[6],
                    background=colors[0],
                ),
                widget.TextBox(
                    text=" 🌡",
                    padding=2,
                    foreground=colors[5],
                    background=colors[0],
                    fontsize=11
                ),
                widget.ThermalSensor(
                    foreground=colors[5],
                    background=colors[0],
                    threshold=90,
                    padding=5
                ),
                widget.CPU(
                    background=colors[0],
                    foreground=colors[3],
                    format=' {freq_current}GHz {load_percent}%',
                    padding=5
                ),
                widget.Memory(
                    foreground=colors[6],
                    background=colors[0],
                    format=' {MemUsed}M/{MemTotal}M',
                    mouse_callbacks={
                        'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
                    padding=5
                ),
                widget.Net(
                    interface="wlp2s0",
                    format=' {down} {up}',
                    foreground=colors[4],
                    background=colors[0],
                    padding=5
                ),
                widget.Volume(
                    foreground=colors[5],
                    background=colors[0],
                    fmt='🔈{}',
                    padding=5
                ),
                widget.CurrentLayoutIcon(
                    # custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                    foreground=colors[2],
                    background=colors[0],
                    padding=0,
                    scale=0.7
                ),
                widget.CurrentLayout(
                    foreground=colors[2],
                    background=colors[0],
                    padding=5
                ),
                widget.Clock(
                    foreground=colors[4],
                    background=colors[0],
                    format=" %d:%m:%Y  %H:%M",
                    font="Mononoki Nerd Font"
                ),
                widget.Sep(
                    linewidth=0,
                    padding=10,
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.Battery(
                    foreground=colors[6],
                    background=colors[0],
                    format='{char} {percent:2.0%}',
                    charge_char='',
                    discharge_char='',
                    full_char='',
                    empty_char='',
                ),
                widget.Systray(
                        foreground=colors[2],
                        background=colors[0],
                        icon_size=20,
                        padding=5
                ),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the u;lktility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# hooks


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


# # Window swallowing
# # I don't use it right now
#
# # works only for programs listed here
# # if you want to add or remove programs
# # modify the "terminals" list
# def is_terminal(window_cmd):
#     # list of programs that will be hidden when a
#     # child process (that opens a window) is spawned
#     # it's called terminals because I only use it
#     # for terminal emulators
#     terminals = ["alacritty", "st", "gnome-terminal"]
#     return window_cmd in terminals
#
# @hook.subscribe.client_new
# def _swallow(window):
#     # pid of current window
#     pid = window.window.get_net_wm_pid()
#
#     # parents of the process running in the current window
#     parents = psutil.Process(pid).parents()
#     if parents == []:
#         return
#
#     # dictionary {pid: window} to access all windows by pid
#     cpids = {c.window.get_net_wm_pid(): wid for wid,
#              c in window.qtile.windows_map.items()}
#
#     # find the first parent that has a window opened then minimize it
#     # parents are sorted in reverse pid order, feel free to check out
#     for i in parents:
#         if i.pid in cpids and is_terminal(i.name()):
#             # find parent and minimize it
#             parent = window.qtile.windows_map.get(cpids[i.pid])
#             if not parent.minimized: # make sure it wasn't swallowed by another process
#                 parent.minimized = True
#                 # set parent attribute to current window
#                 window.parent = parent
#                 return
#
# @hook.subscribe.client_killed
# def _unswallow(window):
#     if hasattr(window, 'parent'):
#         window.parent.minimized = False
#

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
