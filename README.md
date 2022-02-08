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

## 参考資料

* [systemdで定期的にスクリプト実行](https://monomonotech.jp/kurage/raspberrypi/systemd_timer.html)

## Eof

