#!/bin/bash -u

start_repeat()
{
    curl -s -o /dev/null http://localhost:3000/api/v1/commands/?cmd=repeat\&value=true
    curl -s -o /dev/null http://localhost:3000/api/v1/commands/?cmd=playplaylist\&name=VPLEM$1
}

stop_repeat()
{
    if [ `curl -s http://localhost:3000/api/v1/getState | jq -r '.status + .uri | test("^playmnt/INTERNAL/eam/.*")'` = true ]; then
	curl -s -o /dev/null http://localhost:3000/api/v1/commands/?cmd=repeat\&value=false
	curl -s -o /dev/null http://localhost:3000/api/v1/commands/?cmd=stop
    fi
}

usage()
{
    echo "Usage: test_eam.sh {1..18,stop}"
}

if [ $# -lt 1 ]; then
   usage
   exit 0
else
    case "$1" in
    	 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 100)
	   start_repeat $1
	   ;;
	 0 | stop)
	   stop_repeat
	   ;;
	 *)
	   usage
	   ;;
     esac
fi
