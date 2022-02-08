#!/bin/bash -u

# invoke every minutes from cron

mpc_play()
{
    mpc clear
    mpc load PL_$@
    mpc play 1
}

weekday()
{
    case $hourmin in
	0825) mpc_play Radio ;;
	0830) mpc_play 3S ;;
	0838) mpc_play PreBell ;;
	1000) mpc_play Bell ;;
	1010) mpc_play Bell ;;
	1200) mpc_play Bell ;;
	1240) mpc_play PreBell ;;
	1245) mpc_play Bell ;;
	1500) mpc_play Bell ;;
	1510) mpc_play Bell ;;
	1658) mpc_play PreBell ;;
	1700) mpc_play Bell ;;
	1715) mpc_play Bell ;;
	1815) mpc_play Bell ;;
	1915) mpc_play Bell ;;
    esac
}

weekend()
{
    case $hourmin in
	0825) mpc_play Radio ;;
	0830) mpc_play Bell ;;
	1000) mpc_play Bell ;;
	1010) mpc_play Bell ;;
	1200) mpc_play Bell ;;
	1240) mpc_play PreBell ;;
	1245) mpc_play Bell ;;
	1500) mpc_play Bell ;;
	1510) mpc_play Bell ;;
	1658) mpc_play PreBell ;;
	1700) mpc_play Bell ;;
    esac
}

dayoff()
{
    case $hourmin in
	0830) mpc_play Bell ;;
	1200) mpc_play Bell ;;
	1245) mpc_play Bell ;;
	1700) mpc_play Bell ;;
    esac
}

if [ $# -lt 1 ]; then
    hourmin=$(date +%H%M)
    week=$(date +%w)
else
    case "$1" in
	[0123456])
	    hourmin=$2
	    week=$1
	    ;;
	h | help)
	    echo "Usage: ikuta_am.sh {Bell,PreBell,3S,Radio,1 0825}"
	    ;;
	*)
	    mpc_play $1
	    exit 0
	    ;;
    esac
fi

case $week in
    [12345])
	weekday ;;
    6)
	weekend ;;
    *)
	dayoff ;;
esac
