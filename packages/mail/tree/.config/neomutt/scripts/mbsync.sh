#!/bin/bash

if [ -z "${TMUX}" ]; then
	mbsync -c "${XDG_CONFIG_HOME}/isync/mbsyncrc" -a
else
	tmux new-window -d -n "mailfetch" mbsync -c "${XDG_CONFIG_HOME}/isync/mbsyncrc" -a
fi
