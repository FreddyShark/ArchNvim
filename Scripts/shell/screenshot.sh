
if [ $1 == 'D' ]; then
	maim "$HOME/Images/screenshots/$(date +%Y%m%d_%H_%M%S.%N)_desk.jpg"
elif [ $1 == 'S' ]; then
	maim -sk "$HOME/Images/screenshots/$(date +%Y%m%d_%H%M%S.%N)_sel.jpg"
elif [ $1 == 'W' ]; then
	maim -i "$(xdotool getactivewindow)" "$HOME/Images/screenshots/$(date +%Y%m%d_%H%M%S.%N)_win.jpg"
fi
