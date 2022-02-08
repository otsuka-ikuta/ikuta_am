#!/bin/bash -u

./ikuta_am.sh 1 0825
sleep 10
./ikuta_am.sh 1 0830
sleep 10
./ikuta_am.sh 1 0838
mpc idle
./ikuta_am.sh 1 1000
mpc idle
