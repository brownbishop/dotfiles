import os
import socket
import subprocess

from libqtile.config import Key, Screen, Group, Drag, Click, Match
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, hook

from typing import List

# set mod key to mod(also known as the Windows key)
mod = "mod4"
myTerm = "xterm"
dmenu_command = "dmenu_run"

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
    Key([mod], "w", lazy.spawn("chromium")),

    # Toggle screensaver
    Key([mod], "s", lazy.spawn("i3lock -i ./wall.png")),

    # Toggle fullscreen for selected window
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Toggle floating for selected window
    Key([mod], "t", lazy.window.toggle_floating()),

    # Close focused window
    Key([mod], "q", lazy.window.kill()),

    Key([mod], "k",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'
        ),
    Key([mod], "j",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'
        ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_down(),
        desc='Move windows down in current stack'
        ),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_up(),
        desc='Move windows up in current stack'
        ),
    Key([mod], "h",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod], "l",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
        ),
    Key([mod, "shift"], "m",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
        ),
    ### Stack controls
    Key([mod, "shift"], "space",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc='Switch which side main pane occupies (XmonadTall)'
        ),
    Key([mod], "space",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'
        ),
    Key([mod, "control"], "Return",
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'
        ),

    #Key([mod], ",", lazy.to_screen(0)),
    #Key([mod], ".", lazy.to_screen(1)),
    # Volume controls
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "pamixer -d 5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "pamixer -i 5")),

    # Music
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl prev")),


    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),

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
                "margin": 3,
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

# colors = [["#282828", "#282828"], # panel background
#           ["#434758", "#434758"], # background for current screen tab
#           ["#ebdbb2", "#ebdbb2"], # font color for group names
#           ["#cc241d", "#cc241d"], # border line color for current tab
#           ["#98971a", "#98971a"], # border line color for other tab and odd widgets
#           ["#458588", "#458588"], # color for the even widgets
#           ["#d79921", "#d79921"]] # window name

# colors Gruvbox
colors = [[ "#282828", "#282828" ], # black
          [ "#a89983", "#a89983" ], # white
          [ "#cc231c", "#cc231c" ], # red
          [ "#989719", "#989719" ], # green
          [ "#d79920", "#d79920" ], # yellow
          [ "#448488", "#448488" ], # blue
          [ "#b16185", "#b16185" ], # magenta
          [ "#689d69", "#689d69" ]] # cyan

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="Mononoki Nerd Font",
    fontsize=14,
    padding=2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

def create_widgets():
    return [
           # widget.Sep(
           #     linewidth=0,
           #     padding=3,
           #     foreground=colors[0],
           #     background=colors[0],
           # ),
           widget.Image(
               filename="~/.config/qtile/icons/python.png",
               mouse_callbacks={
                   'Button1': lambda: lazy.spawncmd()
               },
               background=colors[0]
           ),
           widget.GroupBox(
                  font = "Mononoki Nerd Font Bold",
                  fontsize = 11,
                  margin_y = 3,
                  margin_x = 0,
                  padding_y = 5,
                  padding_x = 3,
                  borderwidth = 3,
                  active = colors[2],
                  inactive = colors[2],
                  rounded = False,
                  highlight_color = colors[5],
                  highlight_method = "line",
                  this_current_screen_border = colors[6],
                  this_screen_border = colors [4],
                  other_current_screen_border = colors[6],
                  other_screen_border = colors[4],
                  foreground = colors[2],
                  background = colors[0]
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
           widget.WidgetBox(
               background=colors[0],
               foreground=colors[4],
               widgets= [
                   # widget.OpenWeather(
                   #     coordinates={"longitude": "45.1833", "latitude": "23.8"},
                   #     background=colors[0],
                   #     foreground=colors[4],
                   # ),
                   widget.KeyboardLayout(
                       background=colors[0],
                       foreground=colors[5],
                       configured_keyboards=['us','ro'],
                   ),
                   widget.Backlight(
                       backlight_name="intel_backlight",
                       format=' {percent:2.0%}',
                       foreground=colors[6],
                       background=colors[0],
                   ),
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
                       padding=5
                   ),
               ],
           ),
           widget.Memory(
               foreground=colors[4],
               background=colors[0],
               format='{MemUsed: .0f}M/{MemTotal: .0f}M',
               mouse_callbacks={
                   'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
               padding=5
           ),
           widget.Net(
               interface="wlan0",
               format=' {down} {up}',
               foreground=colors[6],
               background=colors[0],
               padding=5
           ),
           widget.Volume(
               foreground=colors[5],
               background=colors[0],
               fmt=' {}',
               padding=5
           ),
           widget.CurrentLayoutIcon(
               # custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
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
               font="Mononoki Nerd Font"
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
               charge_char='',
               discharge_char='',
               full_char='',
               empty_char='',
               update_interval=5,
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
            create_widgets(),
            24,
        ),
    ),
#    Screen(
#        top=bar.Bar(
#            create_widgets(),
#            24,
#        ),
#    ),
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
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(title='Confirmation'),  # tastyworks exit box
    Match(title='Qalculate!'),  # qalculate-gtk
    Match(wm_class='kdenlive'),  # kdenlive
    Match(wm_class='pinentry-gtk-2'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# hooks

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
