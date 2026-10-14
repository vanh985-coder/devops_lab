# Bộ 5 bài tập thực hành nâng cao: Ubuntu Linux, mạng, VPN và Docker

> Năm bài thực hành theo kịch bản doanh nghiệp, triển khai trực tiếp trên một Ubuntu Server thật (VPS) và truy cập qua SSH và VPN: khảo sát hệ thống, firewall, phân quyền, điều tra sự cố SSH và đóng gói ứng dụng bằng Docker. Mỗi bài có báo cáo, lệnh đã dùng, log, ảnh minh chứng và checklist tự chấm.

Đề bài đầy đủ: [Bo_05_bai_tap_Linux_Mang_VPN_Docker_nang_cao.pdf](Bo_05_bai_tap_Linux_Mang_VPN_Docker_nang_cao.pdf).

## Tổng quan

| Bài | Chủ đề | Công cụ chính | Điểm nhấn | Mức hoàn thành |
|---|---|---|---|---|
| [1](Bai_01_Khao_sat_he_thong/) | Khảo sát, lập bản đồ mạng và chuẩn hóa server | `ip`, `ss`, `resolvectl`, `systemctl`, `last`/`lastb` | Phát hiện SSH chạy theo socket activation; server không phân biệt được VPN với Internet ở tầng route | Khảo sát đủ 9 yêu cầu; phần chuẩn hóa và so sánh trước/sau chưa ghi hồ sơ |
| [2](Bai_02_Whitelist_Blacklist_VPN/) | Whitelist, blacklist truy cập theo VPN | UFW | Thêm whitelist trước khi xóa rule cũ để không đứt kết nối; giải thích thứ tự ưu tiên; quy trình khôi phục khi tự khóa SSH | 2 trường hợp kiểm thử đạt; 5 trường hợp chờ thông số hoặc chưa làm |
| [3](Bai_03_Phan_quyen/) | Phân quyền theo vai trò | `chmod`, setgid, ACL, `sudoers` | Setgid kết hợp default ACL; phát hiện hai tài khoản nằm nhầm trong group sudo làm vô hiệu ACL | 17/33 đạt, 5 không đạt, 11 chưa có minh chứng |
| [4](Bai_04_Dieu_tra_SSH/) | Điều tra truy cập SSH bất thường | `auth.log`, `last`, `lastb`, Fail2ban | Phát hiện dò mật khẩu chậm lọt dưới ngưỡng Fail2ban; jail cấu hình sai cổng | 27/36 đạt, 2 không đạt, 7 chưa có minh chứng |
| [5](Bai_05_Landing_Docker/) | Landing page bằng Docker | Dockerfile, `busybox`, UFW | Docker đi qua chain `FORWARD` nên phải dùng `ufw route`; hai phiên bản image và hai container public/preview | 26/45 đạt, 2 không đạt, 17 chưa có minh chứng |

Số liệu "đạt / không đạt / chưa có minh chứng" lấy từ file `06_Checklist.txt` của từng bài. Bài 1 và Bài 2 chưa có checklist.

## Môi trường thực hành

| Thành phần | Chi tiết |
|---|---|
| Server | Ubuntu Server 24.04.1 LTS trên VPS (KVM/OpenStack), 1 vCPU, ~1,9 GiB RAM, 20 GB ổ đĩa |
| Truy cập | SSH từ Windows, qua IP công cộng và qua VPN cá nhân |
| Công cụ | UFW, Fail2ban, Docker, ACL (`setfacl`/`getfacl`), `systemctl`, `journalctl` |

## Kỹ năng thể hiện

- **Quản trị Ubuntu Server:** đọc cấu hình mạng, route, DNS, dịch vụ, cổng lắng nghe, tài nguyên; phân biệt lỗi DNS với mất kết nối.
- **Firewall:** xây whitelist/blacklist có thứ tự bằng UFW, kiểm tra bằng log `[UFW ALLOW]`/`[UFW BLOCK]`, phân biệt DROP với REJECT qua thông báo lỗi phía client.
- **Phân quyền:** thiết kế group vai trò, setgid, default ACL, sudoers tối thiểu, phân tích rủi ro group `docker`.
- **Điều tra sự cố:** bảo toàn hiện trạng, thống kê log bằng `grep`/`awk`, đối chiếu nhiều nguồn, phân loại nguồn truy cập, dựng timeline, đề xuất phòng ngừa.
- **Docker:** viết Dockerfile, gắn tag phiên bản, publish cổng, restart policy, hiểu cách Docker tương tác với firewall.
- **Làm việc có hồ sơ:** mọi kết luận đi kèm lệnh, log hoặc ảnh; tự chấm checklist và ghi rõ chỗ chưa đạt.

## Điểm cần lưu ý

Các bài được nộp khi còn một số hạng mục dang dở. Mỗi README có mục "Còn dang dở" và mục sự cố ghi rõ trạng thái (đã khắc phục, chưa khắc phục). Vài lỗi lặp lại xuyên suốt: làm việc bằng tài khoản root thay vì tài khoản vận hành (Bài 3, 4, 5), và có rule SSH mở cho mọi nguồn ở thời điểm chụp bảng rule của Bài 5.

## Cách đọc hồ sơ mỗi bài

| File / thư mục | Nội dung |
|---|---|
| `README.md` | Tóm tắt bài: làm gì, kết quả, sự cố, bài học |
| `01_Bao_cao` | Báo cáo kỹ thuật đầy đủ |
| `02_Lenh_da_su_dung.txt` | Lệnh đã dùng, có chú thích mục đích |
| `03_Cau_hinh/` | Bản sao file cấu hình |
| `04_Log/` | Log hoặc bản chép text của ảnh minh chứng |
| `05_Minh_chung/` | Ảnh minh chứng, mã `MC-xx` (Bài 1 dùng `EV-xx`) |
| `06_Checklist.txt` | Tiêu chí tự chấm: `[PASS]`, `[FAIL]`, `[CHƯA MC]` |

Thông tin nhạy cảm (mật khẩu, private key, file VPN) không đưa vào hồ sơ.
