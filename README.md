# IKUTA Annouce Machine

## Description

アナウンス・マシーンの老朽化に伴い、volumio + Micro Server で置き換える

## Recipe

* [Volumio - The Audiophile Music Player](https://volumio.com/en/)
* [Asus Tinker Board - Wikipedia](https://en.wikipedia.org/wiki/Asus_Tinker_Board)

## Operation

* Start
  * `sudo systemctl enable ikuta_am.timer`
  * `sudo systemctl start ikuta_am.timer`
* Log
  * `sudo journalctl -f -u ikuta_am.service`
* Emergency broadcast
  * `ikuta_em <number>`
  * 火災発生箇所のコード1-18が必要
  * 0で止めるまで繰り返し放送
  * 緊急放送以外は止められない
  * チャイムなどが割り込むことはない

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
/lib/systemd/system/iptables.service:
6c6
< ExecStart=/sbin/iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000
---
> ExecStart=/sbin/iptables-restore /etc/iptables/rules.v4

sudo -i
/sbin/iptables -F INPUT
/sbin/iptables -A INPUT -s 127.0.0.1 -j ACCEPT
/sbin/iptables -A INPUT -s (許可するPCのアドレス) -j ACCEPT
/sbin/iptables -A INPUT -p tcp --destination-port 3000 -j DROP
mkdir /etc/iptables
/sbin/iptables-save > /etc/iptables/rules.v4
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

