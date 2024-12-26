#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
	keywrod decoration:shadow:enabled 0;
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    killall hyprsunset
    exit
fi
hyprctl reload
if (($(date +%H)>=19||$(date +%H)<6)); then
	hyprsunset -t 3000
fi
