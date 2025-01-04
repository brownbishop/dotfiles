import os
import socket
import subprocess

from libqtile import bar, hook, layout, widget, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.widget import base

# from libqtile.backend.wayland.inputs import InputConfig
from typing import List

# wl_input_rules = {
#     "1267:12377:ELAN1300:00 04F3:3059 Touchpad": InputConfig(
#         tap=True, dwt=True, scroll_method="edge"),
#     "*": InputConfig(tap=True, dwt=True, scroll_method="edge"),
# }
# # set mod key to mod(also known as the Windows key)
mod = "mod4"
myTerm = "xterm"

if qtile.core.name == "wayland":
    term = "foot"
dmenu_command = "rofi -show drun"

keys = [
    # Launch terminal emulator
    Key([mod], "Return", lazy.spawn(myTerm)),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),

    # Restart WM
    Key([mod, "shift"], "r", lazy.restart()),

    # Quit WM
    Key([mod, "shift"], "q", lazy.shutdown()),

    # qtile built in launcher
    Key([mod], "r", lazy.spawncmd()),

    # launcher
    Key([mod], "p", lazy.spawn(dmenu_command)),

    # Toggle status bar
    Key([mod], "b", lazy.hide_show_bar("top")),

    # Web browser shortcut
    Key([mod], "w", lazy.spawn("brave")),

    Key([mod], "z", lazy.spawn("/home/catalin/.local/bin/boomer")),
    # Toggle screensaver
    Key([mod], "s", lazy.spawn(
        "i3lock -i ./wall.png")),

    # Toggle fullscreen for selected window
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Toggle floating for selected window
    Key([mod], "t", lazy.window.toggle_floating()),

    # Close focused window
    Key([mod], "q", lazy.window.kill()),

    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.swap_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.swap_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Key([mod], ",", lazy.to_screen(0)),
    # Key([mod], ".", lazy.to_screen(1)),
    # Volume controls
    Key([], "XF86AudioMute", lazy.spawn("amixer sset Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "amixer -q sset Master 5%-")),
    # "pamixer -d 3")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "amixer -q sset Master 5%+")),
    # "pamixer -i 3")),

    # Music
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl prev")),


    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),

    # Screenshot
    Key([], "Print", lazy.spawn("gnome-screenshot")),

    # Switch focus of monitors
    Key([mod], "period", lazy.next_screen(), desc='Move focus to next monitor'),
    Key([mod], "comma", lazy.prev_screen(), desc='Move focus to prev monitor'),

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
layout_theme = {"border_width": 1,
                "margin": 0,
                "border_focus": "#689d6a",
                "border_normal": "#3c3836"
                }

layouts = [
    layout.Columns(**layout_theme),
    layout.Max(border_width=0),
    layout.Floating(**layout_theme),
]

# colors Gruvbox
colors = [["#282828", "#282828"],  # black
          ["#a89983", "#a89983"],  # white
          ["#cc231c", "#cc231c"],  # red
          ["#989719", "#989719"],  # green
          ["#d79920", "#d79920"],  # yellow
          ["#448488", "#448488"],  # blue
          ["#b16185", "#b16185"],  # magenta
          ["#689d69", "#689d69"]]  # cyan

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="Mononoki Nerd Font",
    fontsize=14,
    # padding=2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

#
# class PowerProfilesStatus(base.InLoopPollText):
#     def __init__(self, **config):
#         base.InLoopPollText.__init__(self, **config)
#
#     def poll(self) -> str:
#         powerprofilesctl_output = subprocess.run(
#             ["powerprofilesctl", "get"], capture_output=True)
#         status: str = powerprofilesctl_output.stdout.decode.strip()
#         with open("~/qtilelog", "w") as f:
#             f.write(status)
#         return status


widgets = [
    widget.Image(
        filename="~/.config/qtile/icons/python.png",
        mouse_callbacks={
            'Button1': lambda: lazy.spawncmd()
        },
        background=colors[0]
    ),
    widget.GroupBox(
        font="Mononoki Nerd Font Bold",
        fontsize=11,
        margin_y=3,
        margin_x=0,
        padding_y=5,
        padding_x=3,
        borderwidth=3,
        active=colors[2],
        inactive=colors[2],
        rounded=False,
        highlight_color=colors[5],
        highlight_method="line",
        this_current_screen_border=colors[6],
        this_screen_border=colors[4],
        other_current_screen_border=colors[6],
        other_screen_border=colors[4],
        foreground=colors[2],
        background=colors[0]
    ),
    widget.Prompt(
        prompt=prompt,
        font="Mononoki Nerd Font",
        padding=10,
        foreground=colors[5],
        background=colors[0]
    ),
    widget.Sep(
        linewidth=0,
        padding=40,
        foreground=colors[2],
        background=colors[0]
    ),
    widget.WindowName(
        foreground=colors[3],
        background=colors[0],
        padding=0
        ),
    # widget.Net(
        #     foreground=colors[6],
        #     background=colors[0],
        #     padding=5
        # ),
    widget.TextBox(
            text="",
            padding=2,
            foreground=colors[7],
            background=colors[0],
            fontsize=13
            ),
    widget.ThermalSensor(
            foreground=colors[7],
            background=colors[0],
            threshold=90,
            padding=5
            ),
    widget.CPU(
            background=colors[0],
            foreground=colors[3],
            format=' {freq_current}GHz {load_percent}%',
            padding=5,
            update_interval=15,
            ),
    widget.Memory(
            foreground=colors[4],
            background=colors[0],
            format='{MemUsed: .0f}M/{MemTotal: .0f}M',
            mouse_callbacks={
                'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
            padding=5
            ),
    widget.Wallpaper(
        directory='~/repos/wallpapers/',
        wallpaper_command=None,
        foreground=colors[1],
        background=colors[0]
        ),
    widget.KeyboardLayout(
            background=colors[0],
            foreground=colors[5],
            configured_keyboards=['us', 'ro std'],
            ),
    widget.Backlight(
            backlight_name="amdgpu_bl1",
            format=' {percent:2.0%}',
            foreground=colors[6],
            background=colors[0],
            ),
    widget.Volume(
        foreground=colors[5],
        background=colors[0],
        fmt=' {}',
        # emoji=True,
        padding=5,
    ),
    widget.CurrentLayoutIcon(
        foreground=colors[7],
        background=colors[0],
        padding=0,
        scale=0.7
    ),
    widget.CurrentLayout(
        foreground=colors[1],
        background=colors[0],
        padding=5
    ),
    widget.Clock(
        foreground=colors[3],
        background=colors[0],
        format=" %Y-%m-%d  %H:%M",
    ),
    widget.Sep(
        linewidth=0,
        padding=2,
        foreground=colors[4],
        background=colors[0]
    ),
    widget.Battery(
        foreground=colors[2],
        background=colors[0],
        format='{char} {percent:2.0%}',
        charge_char='🔌',
        discharge_char='⚡🔋',
        full_char='🔋',
        empty_char='🪫',
        update_interval=30,
        font="Mononoki Nerd Font",
    ),
    widget.Systray(
        foreground=colors[2],
        background=colors[0],
        icon_size=20,
        padding=5
    ),
]
screens = [
    Screen(
        top=bar.Bar(
            widgets,
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            widgets,
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
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# hooks

@hook.subscribe.startup_once
def autostart():
    if qtile.core.name == "wayland":
        return
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
