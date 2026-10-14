# Bài tập Buổi 7 – Câu lệnh Linux cho Developer

## Bài tập 1 – Tạo môi trường project giả lập cho developer

### Yêu cầu

Trong thư mục home, tạo cấu trúc sau:

```text
dev-practice/
├── backend/
│   ├── app.log
│   ├── config.txt
│   └── README.md
├── frontend/
│   ├── package.json
│   └── note.txt
└── scripts/
    └── deploy.sh
```

### Học viên phải làm

- Tạo thư mục bằng terminal
- Tạo file bằng terminal
- Dùng `ls -la` để kiểm tra
- Chụp màn hình kết quả

---

## Bài tập 2 – Quản lý file như một developer

### Yêu cầu

Trong thư mục `backend`:

- Đổi tên `README.md` thành `guide.md`
- Copy `config.txt` thành `config.backup.txt`
- Xóa `config.backup.txt`
- Tạo thêm file `error.log`

---

## Bài tập 3 – Tạo nội dung log và đọc log

### Yêu cầu

Dùng `nano` tạo nội dung cho file `backend/app.log` như sau:

```text
INFO Application started
INFO Server running on port 8080
ERROR Database connection failed
INFO Retry connection
ERROR Timeout while connecting to database
```

### Sau đó học viên phải làm

- Dùng `cat` xem file
- Dùng `head` xem 2 dòng đầu
- Dùng `tail` xem 2 dòng cuối
- Dùng `grep` tìm tất cả dòng chứa `ERROR`

---

## Bài tập 4 – Tìm kiếm file cấu hình trong project

### Yêu cầu

Trong thư mục `dev-practice`, dùng lệnh để:

- Tìm tất cả file `.txt`
- Tìm tất cả file `.log`
- Tìm file tên `package.json`
- Tìm từ khóa `port` trong toàn bộ project

---

## Bài tập 5 – Cài công cụ dev cơ bản

### Yêu cầu

Cài 3 công cụ sau:

- `git`
- `curl`
- `vim` hoặc `nano` nếu chưa có

Sau đó kiểm tra version:

```bash
git --version
curl --version
vim --version
```

### Học viên nộp

- Ảnh chụp terminal sau khi cài
- Ảnh chụp version

---

## Bài tập 6 – Kiểm tra thông tin máy Ubuntu

### Yêu cầu

Cho biết:

- Tên user hiện tại là gì
- Hostname là gì
- Máy có bao nhiêu RAM
- IP nội bộ là gì

---

## Bài tập 7 – Mô phỏng kiểm tra mạng và service

### Học viên thực hiện

```bash
ping google.com
curl https://example.com
ss -tuln
```

### Học viên trả lời

- Máy có internet không
- Lệnh `curl` trả về gì
- Có những port nào đang lắng nghe trên máy
