# DevOps Lab – Trần Đức Việt Anh

> Hồ sơ thực hành Linux, mạng, bảo mật và Docker trên máy ảo và server thật, hướng tới vị trí Junior DevOps / quản trị hệ thống. Mỗi bài có đề bài, lệnh đã dùng, log, ảnh minh chứng và phần tự đánh giá, kể cả những điểm chưa đạt.

## Nên đọc trước

| Lab | Nội dung | Môi trường |
|---|---|---|
| [Bộ 5 bài tập Linux nâng cao](<Bộ 5 bài tập linux/>) | Khảo sát server, firewall UFW, phân quyền, điều tra sự cố SSH với Fail2ban, đóng gói landing page bằng Docker | Ubuntu Server 24.04 trên VPS, truy cập qua SSH và VPN |
| [Các câu lệnh Linux cơ bản](<Thực hành các câu lệnh linux cơ bản/>) | Thao tác file, Git, đọc và lọc log, tìm kiếm, kiểm tra hệ thống và mạng | Ubuntu trong VMware Workstation |

Nếu chỉ có vài phút, đọc README của [Bài 4 – Điều tra SSH](<Bộ 5 bài tập linux/Bai_04_Dieu_tra_SSH/>) và [Bài 5 – Docker](<Bộ 5 bài tập linux/Bai_05_Landing_Docker/>): hai bài này thể hiện rõ nhất cách mình phân tích log, đặt giả thuyết và kiểm chứng.

## Kỹ năng thể hiện

| Nhóm | Nội dung |
|---|---|
| Quản trị Linux | Ubuntu Server, `systemd`, tài khoản và group, `chmod`/ACL/`sudoers`, đọc tài nguyên và log hệ thống |
| Mạng và firewall | `ip`, `ss`, DNS, route, UFW whitelist/blacklist, phân biệt DROP và REJECT |
| Bảo mật vận hành | Phân tích log SSH, phát hiện dò mật khẩu, Fail2ban, nguyên tắc đặc quyền tối thiểu |
| Docker | Dockerfile, tag phiên bản, publish cổng, restart policy, tương tác giữa Docker và firewall |
| Công cụ | Git, Bash, `grep`/`awk`/`find`, SSH |
| Tài liệu | Báo cáo kỹ thuật, bảng ma trận, checklist tự chấm, ghi nhận sự cố và bài học |

## Cách mình làm việc

- Mọi kết luận đi kèm lệnh, log hoặc ảnh chụp kết quả thực tế, không chỉ nêu lý thuyết.
- Tự chấm checklist theo ba trạng thái `PASS`, `FAIL`, `CHƯA MC` (chưa có minh chứng), và ghi rõ hạng mục chưa hoàn thành thay vì bỏ qua.
- Mỗi sự cố ghi theo trình tự: phát hiện, tác động, khoanh vùng, khắc phục, kiểm chứng, trạng thái.

## Liên hệ

- Email: _(điền)_
- LinkedIn: _(điền)_
- GitHub: _(điền)_
