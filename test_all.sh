#!/bin/bash -u

wait_idle()
{
  sleep 1
  while [ $(curl -s http://localhost:3000/api/v1/getState | jq -r '.status') = play ]; do
    sleep 1
  done
}

cd "$(dirname "$0")"

./ikuta_am.sh 1 0825
sleep 10
./ikuta_am.sh 1 0830
sleep 10
./ikuta_am.sh 1 0838
wait_idle
./ikuta_am.sh 1 1000
wait_idle
