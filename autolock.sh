xautolock_process_id=$(pidof xautolock)
if  [[ ! -z $xautolock_process_id ]]; then
    xautolock -exit
    sleep 2
fi
cmd="i3lock -d -c 303030"
delay=5
nohup xautolock -nowlocker "$cmd" -locker "$cmd" -time 5 -notifier 'notify-send -u critical "locking soon"' -notify $delay -corners 0-0+ -cornerdelay $delay -resetsaver >/dev/null 2>&1 &
