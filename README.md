# IKUTA Annouce Machine

## Description

アナウンス・マシーンの老朽化に伴い、MPD + Micro Server で置き換える

## Recipe

* [Volumio - The Audiophile Music Player](https://volumio.com/en/)
* [Asus Tinker Board - Wikipedia](https://en.wikipedia.org/wiki/Asus_Tinker_Board)

## Operation

* Start
  * `sudo systemctl enable ikuta_am.timer`
  * `sudo systemctl start ikuta_am.timer`
* Log
  * `sudo journalctl -f -u ikuta_am.service`

## Security

* password
```
sudo -i
passwd
(change root password)
passwd volumio
(change volumio password)
useradd foo -s /bin/bash -m
usermod -aG sudo foo
passwd foo
(create foo's password)
```
* Web interface
```
sudo /sbin/iptables -A INPUT -s (許可するPCのアドレス) -j ACCEPT
sudo /sbin/iptables -A INPUT -p tcp --destination-port 3000 -j DROP
```
* samba
```
/etc/samba/smb.conf:
s/guest ok = yes/guest ok = no/g
smbpasswd -a volumio
```
* Setting
    * UPNP Renderer to OFF
	* Shairport-Sync to OFF
	* DLNA Browser to OFF

## 参考資料

* [systemdで定期的にスクリプト実行](https://monomonotech.jp/kurage/raspberrypi/systemd_timer.html)

## Eof

