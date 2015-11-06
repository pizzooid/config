#!/bin/sh
#
# Use xset s $time to control the timeout when this will run.
#

if [ $# -lt 1 ];
then
	printf "usage: %s cmd\n" "$(basename $0)" 2>&1
	exit 1
fi
cmd="$1"

while true
do
	if [ $(xssstate -s) != "disabled" ];
	then
		tosleep=$(($(xssstate -t) / 1000))
		if [ $tosleep -le 0 ];
		then
			$cmd
		elif [ $tosleep -le 15 ];
		then
			while [[ $tosleep -gt 1 && $tosleep -le 15 ]]
			do
				echo "lock in $tosleep"
				sleep 0.1
				tosleep=$(($(xssstate -t) / 1000))
			done | dzen2 -y 300
		else
			sleep 5
		fi
	else
		sleep 10
	fi
done
