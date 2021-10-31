#!/bin/sh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -le 3 ]; then 
	startx
fi
