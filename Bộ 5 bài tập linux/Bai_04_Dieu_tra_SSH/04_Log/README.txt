04_Log: ban chep text cua cac anh minh chung (05_Minh_chung/) de doc va grep duoc.
  01  Hien trang khi bat dau dieu tra (MC-01)
  02  Thong ke Failed password theo IP, doi chieu Accepted (MC-02, MC-08)
  03  Truy van username bi nhiem - khong hop le (MC-03)
  04  last - dang nhap thanh cong (MC-04)
  05  lastb - dang nhap that bai (MC-05, MC-06)
  06  Tien trinh, cong, service (MC-07)
  07  fail2ban.log ban/unban (MC-10)

Chua co trong ho so (xem muc 7.4 bao cao):
  - Ban sao auth.log* va SHA256SUMS truoc khi thay doi he thong
  - Noi dung crontab / /etc/cron.*
  - Rule firewall blacklist va ban cua Fail2ban (nft list ruleset / ufw status)
  - Trang thai sau reboot (systemctl is-enabled fail2ban, fail2ban-client status sshd)
