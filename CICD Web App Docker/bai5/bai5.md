# BÀI 5: Chuẩn hóa quy trình deploy thủ công

> **Họ tên:** Trần Đức Việt Anh  
> **File nộp:** [deploy-checklist-buoi16.txt](deploy-checklist-buoi16.txt)

Quy trình deploy thủ công cho app Docker đang chạy trên server, gồm 6 bước.

## 1. Kiểm tra source code

| Lệnh | Mục đích |
|---|---|
| `git status` | Xem đang ở nhánh nào và có sửa dở gì trên server không |
| `git fetch origin` | Lấy thông tin từ remote |
| `git log HEAD..origin/main --oneline` | Xem có commit mới nào trên remote chưa kéo về |
| `git diff HEAD origin/main --stat` | Xem file nào sẽ thay đổi |
| `git pull origin main` | Nếu có commit mới và working tree sạch thì kéo về |
| `git log -1 --oneline` | Ghi lại commit đang chạy, để rollback khi lỗi |

## 2. Build image + chạy lại stack

```bash
docker compose up -d --build
```

## 3. Kiểm tra container

Xem các container đã chạy hết chưa, có map đúng với port dịch vụ trong mạng không:

```bash
docker compose ps
```

## 4. Kiểm tra log của từng service nếu lỗi

```bash
docker compose logs app        # lỗi ở container app
docker compose logs database   # lỗi ở database
```

## 5. Kiểm tra response

Kiểm tra có gửi được request đến dịch vụ không. Ví dụ dịch vụ `app` được map với port 18000 của host:

```bash
curl -I http://localhost:18000
```

## 6. Kiểm tra nginx

Kiểm tra cấu hình nginx đúng cú pháp chưa và dịch vụ nginx đã chạy chưa:

```bash
systemctl restart nginx    # restart để chạy file cấu hình mới nhất
nginx -t
systemctl status nginx
```
