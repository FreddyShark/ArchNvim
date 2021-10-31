#!/bin/sh

#ibus-daemon -d -x
export EDITOR=/usr/bin/nvim
export BROWSER=brave
export TERM=termite
export MAIL=thunderbird
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export PY_VENVS="$HOME/Projects/venvs"



# aliases

# screen res resets
alias reset_res1='xrandr --output DP-2 --mode 1760x1440'
alias reset_res2='xrandr --output DP-2 --mode 2560x1440'
alias reset_res3='xrandr --output DP-2 --mode 3360x1440'
alias reset_res4='xrandr --output DP-2 --mode 5120x1440 --rate 119.97'


# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# sudo not required for some system commands
for x in mount umount sv pacman updatedb su ; do
	alias $x="sudo $x"
done

# sysctl calls
for x in poweroff suspend reboot ; do
	alias sys$x="systemctl $x"
done
alias syslogout="loginctl terminate-user"

# Verbosity and settings 
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	mkdir="mkdir -pv" \
	yta="youtube-dl -xo ~/Music" \
	ytv="youtube-dl -o ~/Videos" 


# color commands.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi"

# color for less
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

