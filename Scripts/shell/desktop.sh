
# sudo not required for some system commands
for x in polybar conky ; do
	killall -q $x

	# wait until the processes have been shut down
	while pgrep -u $UID -x $x >/dev/null; do sleep; done

	# launch , using default config location
	[ $x = polybar ] && polybar example &
	[ $x = conky ] && conky &
done

