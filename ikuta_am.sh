#!/bin/bash -u

# invoke every minutes from cron

if [ $# -lt 1 ]; then
    hourmin=$(date +%H%M)
    week=$(date +%w)
else
    hourmin=$2
    week=$1
fi

play()
{
    mpc clear
    mpc load PL_$@
    mpc play 1
}

weekday()
{
    case $hourmin in
	0825) play Radio ;;
	0830) play 3S ;;
	0838) play PreBell ;;
	1000) play Bell ;;
	1010) play Bell ;;
	1200) play Bell ;;
	1240) play PreBell ;;
	1245) play Bell ;;
	1500) play Bell ;;
	1510) play Bell ;;
	1658) play PreBell ;;
	1700) play Bell ;;
	1715) play Bell ;;
	1815) play Bell ;;
	1915) play Bell ;;
    esac
}

weekend()
{
    case $hourmin in
	0825) play Radio ;;
	0830) play Bell ;;
	1000) play Bell ;;
	1010) play Bell ;;
	1200) play Bell ;;
	1240) play PreBell ;;
	1245) play Bell ;;
	1500) play Bell ;;
	1510) play Bell ;;
	1658) play PreBell ;;
	1700) play Bell ;;
    esac
}

dayoff()
{
    case $hourmin in
	0830) play Bell ;;
	1200) play Bell ;;
	1245) play Bell ;;
	1700) play Bell ;;
    esac
}

case $week in
    [12345])
	weekday ;;
    6)
	weekend ;;
    *)
	dayoff ;;
esac
