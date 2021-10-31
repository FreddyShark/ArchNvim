
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
# to use, copy, winify, merge, publish, distribute, sublicense, and/or sell
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

from typing import List  # noqa: F401

import subprocess
import os
import datetime as dt
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
#from libqtile.utils import guess_terminal

win = "mod4"
alt = "mod1"
ctrl = "control"


@hook.subscribe.startup
def launch_conky():
    home = os.path.expanduser("~/.config/desktop.sh")
    subprocess.call([home])

terminal = "kitty"

# Init some programs
#lazy.cmd_spawn("${HOME}/.config/desktop.sh &")

keys = [
    # Switch between windows
    Key([win], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([win], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([win], "j", lazy.layout.down(), desc="Move focus down"),
    Key([win], "k", lazy.layout.up(), desc="Move focus up"),
    Key([win], "Tab", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([win, "shift"], "h", lazy.layout.swap_column_left(),
        desc="Move column to the left"),
    Key([win, "shift"], "l", lazy.layout.swap_column_right(),
        desc="Move column to the right"),
    Key([win, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([win, "shift"], "k", lazy.layout.shuffle_up(), 
        desc="Move window up"),
    Key([win, alt], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([win, alt], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([win], "comma", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([win], "period", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([win], "minus", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([win], "equal", lazy.layout.grow_up(), desc="Grow window up"),
    Key([win], "backslash", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([win], "space", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([win], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([win], "grave", lazy.next_layout(), desc="Toggle between layouts"),
    Key([win], "bracketleft", lazy.window.kill(), desc="Kill focused window"),

    Key([win], "Escape", lazy.restart(), desc="Restart Qtile"),
    Key([win, ctrl], "Escape", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([win], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),


    # Program shortcuts.
    Key([win], "slash", lazy.spawn("rofi -show combi")),
    Key([win], "F1", lazy.spawn("rofi -show run")),
    Key([win], "F2", lazy.spawn("rofi -show drun")),
    Key([win], "F3", lazy.spawn("rofi -show ssh")),
    Key([win], "F4", lazy.spawn("rofi -show file-browser")),
    #Key([win], "F5", lazy.spawn("polybar-msg cmd toggle")),
    Key([win], "F5", lazy.spawn("kitty zsh -c calcurse")),
    # Sound
    Key([win], "Prior", lazy.spawn("pulsemixer --change-volume +4")),
    Key([win], "Next", lazy.spawn("pulsemixer --change-volume -4")),
    Key([win], "Pause", lazy.spawn("pulsemixer --toggle-mute")),
    Key([win], "Home", lazy.spawn("mpv previous")),
    Key([win], "End", lazy.spawn("playerctl -p mpv next")),
    Key([win], "Insert", lazy.spawn("playerctl -p mpv position 4+")),
    Key([win], "Delete", lazy.spawn("playerctl -p mpv position 4-")),
    Key([win], "Scroll_Lock", lazy.spawn("playerctl -a play-pause")),
    # Print screen
    Key([], "Print", lazy.spawn(["sh", os.path.expanduser("~/Scripts/shell/screenshot.sh"), "D"])),
    Key([win], "Print", lazy.spawn(["sh", os.path.expanduser("~/Scripts/shell/screenshot.sh"), "W"])),
    Key([ctrl], "Print", lazy.spawn(["sh", os.path.expanduser("~/Scripts/shell/screenshot.sh"), "S"])),

    # Mouse/Pointer wine
    # KeyChord([win], "m", [
    #     Key([win], "k", lazy.cmd_spawn("xdotool mousemove_relative 0 -16")),
    #     Key([win], "l", lazy.cmd_spawn("xdotool mousemove_relative 16 0")),
    #     Key([win], "j", lazy.cmd_spawn("xdotool mousemove_relative 0 16")),
    #     Key([win], "h", lazy.cmd_spawn("xdotool mousemove_relative -- -16 -0")),
        # ])
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # win1 + letter of group = switch to group
        Key([win], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # win1 + shift + letter of group = switch to & move focused window to group
        # Key([win, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
        #     desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # win1 + shift + letter of group = move focused window to group
        Key([win, "shift"], i.name, lazy.window.togroup(i.name),
            desc="move focused window to group {}".format(i.name)),
    ]),

layouts = [
    layout.Columns(name="res4", num_columns=5,
        border_focus_stack=['#038DBF', '#024364'], border_focus="#20066F",
        border_width=5),
    layout.Columns(name="res3", num_columns=4,
        border_focus_stack=['#038DBF', '#024364'], border_focus="#20066F",
        border_width=5),
    layout.Columns(name="res2", num_columns=3,
        border_focus_stack=['#038DBF', '#024364'], border_focus="#20066F",
        border_width=5),
    layout.Columns(name="res1", num_columns=2,
        border_focus_stack=['#038DBF', '#024364'], border_focus="#20066F",
        border_width=5),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Matrix(num_columns=5, border_focus_stack=['#20066F', '#024364'], border_width=3),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='monofur',
    fontsize=20,
    padding=7,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        left=bar.Gap(238),
        top=bar.Bar(
            [
                widget.CurrentLayout(padding=12),
                widget.GroupBox(),
                widget.PulseVolume(fmt="  {}", padding=35),
                widget.Pomodoro(fmt="&#xf252; {}:"),
                widget.WindowName(max_chars=35),
                widget.Clock(format='%a, %d/%m/%Y' , fmt="  {}", padding=8),
                widget.Clock(format='%I:%M %p', fmt="  {}", padding=55),
                widget.OpenWeather(
                    cityid="", padding=20,
                    format='{location_city}: &#xf2c9; {main_temp}°{units_temperature}, H:{humidity}%, {weather_details}'
                ),
                widget.Systray(),
                widget.QuickExit(default_text="[ &#xf011;  ]"),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([win], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([win], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([win], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
