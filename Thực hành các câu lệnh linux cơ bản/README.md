# Thực hành các câu lệnh Linux cơ bản cho Developer

> Bài tập Buổi 7 – Câu lệnh Linux cho Developer. Thực hành trên Ubuntu chạy trong VMware Workstation, gồm 7 bài: thao tác file/thư mục, Git, đọc log, tìm kiếm, kiểm tra công cụ, thông tin hệ thống và mạng.

## Môi trường thực hành

| Thành phần | Chi tiết |
|---|---|
| Hệ điều hành | Ubuntu (máy ảo VM_Ubuntu) |
| Công cụ ảo hóa | VMware Workstation |
| Shell | Bash |
| Công cụ dùng | Git, nano, vim, curl |

## Kỹ năng thể hiện

- **Làm việc với terminal:** tạo, di chuyển, đổi tên, sao chép, xóa file và thư mục (`mkdir`, `cd`, `touch`, `ls`, `mv`, `cp`, `rm`).
- **Git:** quy trình `add` → `commit` → `push` lên GitHub.
- **Đọc và phân tích log:** `cat`, `head`, `tail`, `grep` để lọc dòng lỗi (ERROR) trong `app.log`.
- **Tìm kiếm file và nội dung:** `find`, `grep -r`, `grep -rl`.
- **Kiểm tra môi trường dev:** kiểm tra phiên bản Git, Vim, curl.
- **Quản trị hệ thống cơ bản:** xem hostname, IP, người dùng, RAM, kernel.
- **Chẩn đoán mạng:** `ping`, `curl`, `ss` để kiểm tra kết nối và các cổng đang lắng nghe.

## Nội dung chi tiết

### Bài 1 – Tạo cấu trúc thư mục dự án
Dựng cấu trúc dự án mẫu `dev-practice/` gồm `backend/`, `frontend/`, `scripts/`, tạo các file cấu hình, log và script bên trong.

- **Lệnh:** `mkdir`, `cd`, `touch`, `ls`, `rm`
- **Kết quả:** tạo file `deploy.sh` ở sai chỗ, xóa đi rồi tạo lại đúng trong `scripts/`.

![Bài 1](<images/Bài 1 .jpg>)

### Bài 2 – Quản lý file và đẩy code lên GitHub
Đổi tên, sao chép, xóa file trong `backend/`, sau đó commit và push lên GitHub.

- **Lệnh:** `mv`, `cp`, `rm`, `git add`, `git commit`, `git status`, `git push`
- **Kết quả:** push thành công lên nhánh `main` của repo `Linux_Practice`.

![Bài 2](images/Bài%202.jpg)

### Bài 3 – Đọc và lọc log
Ghi nội dung vào `app.log` bằng nano, rồi đọc và lọc log.

- **Lệnh:** `nano`, `cat`, `head -n`, `tail -n`, `grep`
- **Kết quả:** lọc ra 2 dòng `ERROR` (lỗi kết nối database và timeout) trong 5 dòng log, sau đó commit và push.

![Bài 3](<images/Bài 3 .jpg>)

### Bài 4 – Tìm kiếm file và nội dung
Tìm file theo tên và tìm chuỗi `port` trong cả dự án.

- **Lệnh:** `find . -name`, `grep -r`, `grep -rl`
- **Kết quả:** tìm được toàn bộ file `*.txt`, `*.log`, `package.json`. Chạy `grep "port" ./` báo lỗi vì `./` là thư mục, nên dùng `grep -r` để tìm đệ quy. `grep -rl` chỉ liệt kê tên file chứa chuỗi.

![Bài 4](images/Bài%204.jpg)

### Bài 5 – Kiểm tra phiên bản công cụ
Kiểm tra các công cụ cần cho môi trường phát triển.

- **Lệnh:** `git --version`, `vim --version`, `curl --version`
- **Kết quả:** Git 2.53.0, Vim 9.1, curl 8.18.0. Gõ nhầm `curl version` bị báo `Could not resolve host`, vì curl hiểu `version` là tên website. Đúng cú pháp là `curl --version`.

![Bài 5 – phần 1](<images/Bài 5 .jpg>)
![Bài 5 – phần 2](images/Bài%205.jpg)

### Bài 6 – Thông tin hệ thống
Xem thông tin máy và người dùng.

- **Lệnh:** `hostname`, `ip address show`, `whoami`, `free -h`, `uname -a`
- **Kết quả:** Đọc được địa chỉ IP trong mạng nội bộ (card mạng `ens33`), dung lượng RAM và phiên bản kernel. Gõ `ipconfig` và `username` đều báo lỗi vì đó là lệnh của Windows hoặc không tồn tại trên Linux. Tương đương trên Linux là `ip address show` và `whoami`.

![Bài 6](images/Bài%206.jpg)

### Bài 7 – Kiểm tra mạng
Kiểm tra kết nối Internet và các dịch vụ đang chạy.

- **Lệnh:** `ping -c 5`, `curl`, `ss -tuln`
- **Kết quả:** ping `google.com` 5 gói, 0% mất gói. `curl https://example.com` trả về HTML của trang. `ss -tuln` liệt kê các cổng TCP/UDP đang lắng nghe.

![Bài 7](images/Bài%207.jpg)

## Bài học rút ra

<!-- TODO: viết bằng lời của bạn, 3–5 gạch đầu dòng. Gợi ý:
- Lỗi nào bạn gặp và đã xử lý thế nào (ví dụ grep trên thư mục, nhầm lệnh Windows/Linux)
- Điều gì bạn hiểu rõ hơn sau bài tập
- Bạn định học tiếp gì (Bash script, quyền file chmod/chown, Docker, CI/CD...) -->

## Liên hệ

- GitHub: <!-- TODO: link GitHub của bạn -->
- Email: <!-- TODO: email của bạn -->
- LinkedIn: <!-- TODO: nếu có -->
