# DevOps Lab – Trần Đức Việt Anh

> Hồ sơ thực hành Linux, mạng, bảo mật và Docker trên máy ảo và server thật, hướng tới vị trí **Junior DevOps / quản trị hệ thống**. Mỗi bài có đề bài, lệnh đã dùng, log, ảnh minh chứng và phần tự đánh giá, kể cả những điểm mình làm chưa đạt.

## Mình đã làm được gì

- Quản trị một **Ubuntu Server thật (VPS)** qua SSH và VPN: khảo sát hệ thống, cấu hình firewall, phân quyền theo vai trò.
- **Điều tra sự cố SSH** từ log: thống kê IP dò mật khẩu, đối chiếu `auth.log` / `last` / `lastb`, cấu hình Fail2ban, dựng timeline.
- **Đóng gói và chạy ứng dụng bằng Docker**: Dockerfile, publish cổng, volume, restart policy; Docker Compose nhiều service (Spring Boot + SQL Server) có healthcheck và thứ tự khởi động.
- **Audit và thiết kế lại mức độ phơi bày của hệ thống** (Cloudflare → Nginx → Docker): xác định cổng nào public, cổng nào nội bộ, TLS mode, hardening.
- Làm việc **có hồ sơ**: kết luận nào cũng kèm lệnh, log hoặc ảnh thực tế; tự chấm checklist và ghi rõ chỗ chưa đạt.

## Các phần trong repo

Sắp theo thứ tự mình học:

| # | Phần | Nội dung | Môi trường | Minh chứng |
|---|---|---|---|---|
| 1 | [Câu lệnh Linux cơ bản](<Thực hành các câu lệnh linux cơ bản/>) | Thao tác file, Git, đọc và lọc log, tìm kiếm, kiểm tra hệ thống và mạng; một ca lỗi DNS tự tạo rồi tự chẩn đoán | Ubuntu trong VMware | Ảnh terminal cho từng bài |
| 2 | [Bộ 5 bài Linux nâng cao](<Bộ 5 bài tập linux/>) | Khảo sát server, UFW whitelist/blacklist theo VPN, phân quyền ACL/sudoers, điều tra SSH + Fail2ban, landing page bằng Docker | Ubuntu Server 24.04 trên VPS | Báo cáo, lệnh, log, ảnh, checklist tự chấm |
| 3 | [Docker cơ bản](<Thực hành cơ bản với docker/>) | 9 bài: nginx + bind mount, MySQL + volume, kiểm tra container, sơ đồ hệ thống, script health-check, tiếp nhận một server đang chạy web app | Ubuntu VM và VPS | Ảnh chụp từng bài, kết luận kỹ thuật |
| 4 | [Docker Compose](<Thực hành dokcercompose/>) | Spring Boot + SQL Server: Dockerfile multi-stage, 3 service, healthcheck, `depends_on` có điều kiện | Ubuntu server | Sơ đồ, `docker compose ps`, log từng service |
| 5 | [Tổng hợp kiến thức](<Tổng hợp kiến thức áp dụng vào hệ thống/>) | 3 câu tình huống: lỗi 502 qua Cloudflare → Nginx → Docker, Dockerfile production, audit và thiết kế lại mức độ phơi bày | Bài làm theo hướng tư duy, chưa chạy trên server | Sơ đồ, cấu hình, checklist 11 bước |
| 6 | [CI/CD](<CICD/>) | GitHub Actions cho app Spring Boot: CI build + test Maven, CD build image đẩy GHCR rồi deploy qua SSH, health check sau deploy | GitHub Actions + VPS | Workflow, log Actions, `docker compose ps`, `curl` |

### Nếu chỉ có vài phút, đọc 3 phần này

1. **[Bài 4 – Điều tra SSH](<Bộ 5 bài tập linux/Bai_04_Dieu_tra_SSH/>)**: cách mình phân tích log, đặt giả thuyết và kiểm chứng. Phát hiện dò mật khẩu chậm lọt dưới ngưỡng Fail2ban và jail cấu hình sai cổng.
2. **[Bài 5 – Docker và firewall](<Bộ 5 bài tập linux/Bai_05_Landing_Docker/>)**: hiểu vì sao Docker đi qua chain `FORWARD` nên UFW thường không chặn được cổng đã publish, và xử lý bằng `ufw route`.
3. **[Docker Compose](<Thực hành dokcercompose/>)**: app tự tắt vì chưa có database, sửa bằng `healthcheck` + `service_healthy` + container khởi tạo chạy một lần.

## Kỹ năng thể hiện

| Nhóm | Nội dung |
|---|---|
| Quản trị Linux | Ubuntu Server, `systemd`, tài khoản và group, `chmod`/ACL/`sudoers`, đọc tài nguyên và log hệ thống |
| Mạng và firewall | `ip`, `ss`, DNS, route, UFW whitelist/blacklist, phân biệt DROP và REJECT |
| Bảo mật vận hành | Phân tích log SSH, phát hiện dò mật khẩu, Fail2ban, đặc quyền tối thiểu, giảm bề mặt phơi bày |
| Docker | Dockerfile (multi-stage, non-root, cache layer), tag phiên bản, publish cổng, volume, restart policy, tương tác Docker với firewall |
| CI/CD | GitHub Actions (CI/CD tách riêng, `workflow_run`), GHCR, deploy qua SSH, GitHub Secrets, health check sau deploy |
| Docker Compose | Nhiều service, `healthcheck`, `depends_on` theo điều kiện, biến môi trường, volume, network nội bộ |
| Web / hạ tầng | Cloudflare (Proxy, SSL/TLS mode), Nginx reverse proxy, chẩn đoán 502 theo chuỗi từ ngoài vào trong |
| Công cụ | Git, Bash, `grep`/`awk`/`find`, SSH, VMware |
| Tài liệu | Báo cáo kỹ thuật, bảng ma trận, sơ đồ, checklist tự chấm, ghi nhận sự cố và bài học |

## Cách mình làm việc

- Mọi kết luận đi kèm lệnh, log hoặc ảnh chụp kết quả thực tế, không chỉ nêu lý thuyết.
- Tự chấm checklist theo ba trạng thái `PASS`, `FAIL`, `CHƯA MC` (chưa có minh chứng), và ghi rõ hạng mục chưa hoàn thành thay vì bỏ qua.
- Mỗi sự cố ghi theo trình tự: phát hiện, tác động, khoanh vùng, khắc phục, kiểm chứng, trạng thái.


## Cấu trúc thư mục

```text
devops-lab/
├── Thực hành các câu lệnh linux cơ bản/   # 7 bài Linux cho developer + ca lỗi DNS
├── Bộ 5 bài tập linux/                    # 5 bài trên VPS: Bai_01 … Bai_05
│   └── Bai_0X_*/                          #   README, báo cáo, lệnh, cấu hình, log, minh chứng, checklist
├── Thực hành cơ bản với docker/           # 9 bài Docker
├── Thực hành dokcercompose/               # Spring Boot + SQL Server bằng Compose
├── Tổng hợp kiến thức áp dụng vào hệ thống/  # 3 câu tình huống Cloudflare / Nginx / Docker
└── CICD/                                  # GitHub Actions CI/CD + GHCR, bài tập K8s
```

## Liên hệ

- Email: [vietanhhpts123@gmail.com](mailto:vietanhhpts123@gmail.com)
- GitHub: [vanh985-coder](https://github.com/vanh985-coder)
