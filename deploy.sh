#!/bin/bash -u

sudo systemctl stop ikuta_am.timer
sudo systemctl disable ikuta_am.timer
sudo cp ikuta_am.sh /opt/ikuta_am/
sudo cp ikuta_am.service /etc/systemd/system/
sudo cp ikuta_am.timer /etc/systemd/system/
sudo systemctl enable ikuta_am.timer
sudo systemctl start ikuta_am.timer
