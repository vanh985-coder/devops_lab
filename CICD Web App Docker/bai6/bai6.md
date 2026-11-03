# BÀI 6: Viết shell script deploy cơ bản

> **Họ tên:** Trần Đức Việt Anh  
> **Ứng dụng:** FASTSHOP (app khác, không phải Chợ PTITers)  
> **File script:** [deploy-basic.sh](deploy-basic.sh)

## 1. Nội dung script

```bash
echo "user name and host name:"
whoami
hostname
echo "Di chuyen vao thu muc du an"
cd TranDucVietAnh/san_thuong_mai/FASTSHOP/net
echo "Build va chay lai he thong"
docker compose up --build -d
echo "Trang thai container"
docker compose ps
echo "log cua app"
docker compose logs app --tail 30
```

## 2. Script làm gì

| Yêu cầu của đề | Lệnh trong script |
|---|---|
| Hiển thị user và hostname | `whoami`, `hostname` |
| Di chuyển vào thư mục dự án | `cd TranDucVietAnh/san_thuong_mai/FASTSHOP/net` |
| Build lại hệ thống | `docker compose up --build -d` |
| Chạy lại hệ thống bằng Docker Compose | `docker compose up --build -d` |
| Hiển thị trạng thái container | `docker compose ps` |
| In 30–50 dòng log gần nhất | `docker compose logs app --tail 30` |

## 3. Cấp quyền thực thi

```bash
chmod +x deploy-basic.sh
```

*(Chèn ảnh lệnh chmod)*

## 4. Chạy script

```bash
./deploy-basic.sh
```

*(Chèn ảnh chạy script)*

## 5. Kết quả

*(Chèn ảnh kết quả: trạng thái container và log)*

---

### Danh sách nộp

- [x] Nội dung file script
- [ ] Lệnh `chmod +x` (cần ảnh)
- [ ] Ảnh chạy script
- [ ] Ảnh kết quả
