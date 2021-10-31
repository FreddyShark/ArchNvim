# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
ZSH_CUSTOM=/usr/share/zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="zsh-theme-powerlevel10k/powerlevel10k"
ZSH_THEME="fino-sunrise"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-vi-mode themes fast-syntax-highlighting zsh-autosuggestions colored-man-pages)


# User configuration

export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
export EDITOR=/usr/bin/nvim
export BROWSER=firefox
export TERM=kitty
export PIPENV_VENV_IN_PROJECT=1
export MAIL=thunderbird
export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config.toml"
export GTK3_RC_FILES="$XDG_CONFIG_HOME/gtkrc-3.0"
export QT_QPA_PLATFORMTHEME="qt5ct"
export PY_VENVS="$HOME/Projects/pyvenvs"
export WALLPAPERS="$HOME/Images/wallpapers"
export CURRENT_WALLPAPER="$WALLPAPERS/space.jpg"

HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=2000
setopt extendedglob
bindkey -v

# Try this for stopping screen from sleeping
setterm -powerdown 0
xset s off

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# sudo not required for some system commands
for x in mount umount sv pacman updatedb su ; do
	alias $x="sudo $x"
done

# sysctl calls
for x in poweroff suspend reboot ; do
	alias $x="systemctl $x"
done
alias logout="loginctl terminate-user"

function touch_executable() { touch $1 && chmod +x $1 }
# Verbosity and settings 
alias \
	cp="cp -Riv" \
	mv="mv -iv" \
	rm="rm -vI" \
	chmod="chmod -cR" \
	mkdir="mkdir -pv" \
	touchx="touch_executable $1" \
	yta="youtube-dl -x" \
	ytv="youtube-dl" \
	setbg="nitrogen --set-zoom-fill" \
	img="kitty +kitten icat" \
	w3m="termite -e \"w3m duckduckgo.com\""

# change resolution on the fly if you have a PBP monitor.
# fill in values according to availble resolutions and refresh rates of your screen.
res_1=''
res_2=''
res_3=''
res_4=''
rate_1=''
rate_2=''
rate_3=''
rate_4=''

function res_change() {
	if [ $1 -eq 1 ]; then
		xrandr --auto --output DP-0 --mode res_1 --rate rate_1 && setbg $CURRENT_WALLPAPER
	elif [ $1 -eq 2 ]; then
		xrandr --auto --output DP-0 --mode res_2 --rate rate_2 && setbg $CURRENT_WALLPAPER
	elif [ $1 -eq 3 ]; then
		xrandr --auto --output DP-0 --mode res_3 --rate rate_3 && setbg $CURRENT_WALLPAPER
	elif [ $1 -eq 4 ]; then
		xrandr --auto --output DP-0 --mode res_4 --rate rate_4 && setbg $CURRENT_WALLPAPER
	fi
}

alias \
	res1='res_change 1' \
	res2='res_change 2' \
	res3='res_change 3' \
	res4='res_change 4'

alias remodxmap="xmodmap $XDG_CONFIG_HOME/X11/Xmodmap"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
