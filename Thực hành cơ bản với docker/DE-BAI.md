# Bài tập về nhà buổi 11

**Chủ đề:** Docker thực chiến với web app trên server Ubuntu

[Đề bài.pdf](<Đề bài.pdf>)*

## Yêu cầu chung

- Thực hành trực tiếp trên server cá nhân đã được cấp.
- Mỗi bài chụp màn hình rõ ràng toàn bộ quá trình và kết quả.
- Với các bài yêu cầu vẽ sơ đồ: vẽ tay hoặc vẽ máy đều được, nhưng phải rõ ràng, có chú thích.
- Hạn nộp: trước thứ 5 tuần này.
- Không làm qua loa, không chỉ chụp kết quả cuối, cần có đủ lệnh và kết quả thực thi.

---

## Bài 1. Dựng web tĩnh bằng Docker trên server

**Bối cảnh:** Cần dựng nhanh một web giới thiệu đơn giản trên server bằng Docker, không cài nginx trực tiếp lên Ubuntu.

**Yêu cầu**

- Tạo một thư mục web trên server.
- Tạo file `index.html` có nội dung giới thiệu ngắn về bản thân hoặc lớp học.
- Chạy nginx container để public file đó ra ngoài.
- Map port từ host sang container.
- Kiểm tra container đang chạy.
- Dùng `curl` để kiểm tra phản hồi từ web.

**Nộp bài**

- Ảnh chụp thư mục chứa file web.
- Ảnh chụp lệnh chạy container.
- Ảnh chụp `docker ps`.
- Ảnh chụp `curl`.
- Ảnh chụp web khi truy cập bằng trình duyệt (nếu có).

---

## Bài 2. Sửa nội dung web mà không rebuild lại container

**Bối cảnh:** Khách yêu cầu sửa nội dung trang web ngay lập tức. Không muốn xóa container và làm lại từ đầu.

**Yêu cầu**

- Dùng bind mount để gắn thư mục web từ host vào nginx container.
- Chỉnh sửa nội dung `index.html` sau khi container đã chạy.
- Kiểm tra lại để chứng minh nội dung web thay đổi theo file trên host.
- Chụp màn hình trước và sau khi chỉnh sửa.

**Nộp bài**

- Ảnh chụp cấu trúc thư mục web trên host.
- Ảnh chụp lệnh `docker run` có mount.
- Ảnh chụp nội dung web trước khi sửa.
- Ảnh chụp file sau khi sửa.
- Ảnh chụp nội dung web sau khi sửa.

---

## Bài 3. Chạy MySQL bằng Docker như một database service

**Bối cảnh:** Cần một database MySQL để chuẩn bị cho backend, nhưng không muốn cài MySQL trực tiếp trên Ubuntu.

**Yêu cầu**

- Kéo image MySQL.
- Chạy container MySQL bằng Docker.
- Truyền biến môi trường để tạo root password.
- Map port 3306.
- Kiểm tra container đang chạy.
- Kiểm tra log MySQL.
- Kiểm tra port 3306 trên server.

**Nộp bài**

- Ảnh chụp lệnh chạy MySQL.
- Ảnh chụp `docker ps`.
- Ảnh chụp `docker logs`.
- Ảnh chụp kiểm tra port 3306.
- Ảnh chụp service/database container đang hoạt động.

---

## Bài 4. Bảo vệ dữ liệu database khi container bị xóa

**Bối cảnh:** Database không được phép "mất sạch dữ liệu" chỉ vì xóa container. Cần chuẩn bị đúng tư duy lưu trữ dữ liệu.

**Yêu cầu**

- Tạo Docker volume dành riêng cho MySQL.
- Chạy lại MySQL container có gắn volume.
- Kiểm tra volume đã tạo.
- Chứng minh container đang dùng volume đó.
- Chụp màn hình để thể hiện rõ volume và container có liên kết với nhau.

**Nộp bài**

- Ảnh chụp lệnh tạo volume.
- Ảnh chụp `docker volume ls`.
- Ảnh chụp lệnh chạy MySQL với volume.
- Ảnh chụp `inspect` hoặc thông tin chứng minh volume đang được dùng.
- Viết ngắn 3–5 dòng trong terminal hoặc file note: vì sao database cần volume.

---

## Bài 5. Kiểm tra container như kiểm tra một service thật

**Bối cảnh:** Một container web đã được chạy, nhưng cần kiểm tra nó như một dịch vụ thật trên server.

**Yêu cầu**

Với container nginx hoặc MySQL đang chạy, kiểm tra:

- Container có đang chạy không.
- Log container có gì.
- Bên trong container có gì.
- Port nào đang được map ra host.
- Process/service trên host liên quan tới Docker và port đang mở.
- Dùng `docker exec` vào container và kiểm tra file hoặc thư mục bên trong.

**Nộp bài**

- Ảnh chụp `docker ps`.
- Ảnh chụp `docker logs`.
- Ảnh chụp `docker exec`.
- Ảnh chụp `ss -tuln`.
- Ảnh chụp kiểm tra process liên quan tới Docker trên host.

---

## Bài 6. Bài vẽ sơ đồ số 1: sơ đồ hệ thống web tĩnh chạy bằng Docker

**Bối cảnh:** Cần mô tả cho người khác hiểu cách web đang chạy trên server.

**Yêu cầu**

Vẽ sơ đồ hệ thống cho mô hình web tĩnh bằng Docker, trong đó phải có:

- Người dùng/browser.
- Server Ubuntu.
- Docker Engine.
- Container nginx.
- Thư mục web trên host.
- Bind mount.
- Port host.
- Port container.

Sơ đồ phải thể hiện rõ luồng:

- Người dùng truy cập vào đâu.
- Request đi qua port nào.
- nginx lấy file từ đâu.

**Nộp bài**

- Ảnh chụp sơ đồ.
- Sơ đồ phải ghi rõ ít nhất:
  - 8080 hoặc port host đang dùng.
  - 80 trong container.
  - Tên thư mục trên host.
  - Tên container.

---

## Bài 7. Bài vẽ sơ đồ số 2: sơ đồ hệ thống web app có web + database

**Bối cảnh:** Cần mô tả một hệ thống gần với thực tế hơn, trong đó web và database là hai thành phần riêng.

**Yêu cầu**

Vẽ sơ đồ hệ thống gồm:

- User/browser.
- Server Ubuntu.
- Docker.
- Web container.
- MySQL container.
- Docker volume.
- Docker network.
- Port web.
- Port MySQL.

Sơ đồ phải thể hiện rõ:

- Web container phục vụ nội dung ra ngoài qua port nào.
- MySQL container lắng nghe port nào.
- Dữ liệu MySQL được lưu ở đâu.
- Hai container nằm chung network nào.

**Nộp bài**

- Ảnh chụp sơ đồ.
- Trên sơ đồ phải có:
  - Port host.
  - Port container.
  - Tên volume.
  - Tên network.
  - Mũi tên thể hiện kết nối.

---

## Bài 8. Tình huống nâng cao: viết shell script kiểm tra môi trường Docker trên server

**Bối cảnh:** Cần một công cụ nhỏ để khi vào server có thể kiểm tra nhanh tình trạng Docker và container đang chạy.

**Yêu cầu**

Tạo file script `docker-health-check.sh`. Script phải kiểm tra được tối thiểu:

- User hiện tại.
- Hostname.
- Docker version.
- Danh sách image.
- Danh sách container đang chạy.
- Danh sách volume.
- Danh sách network.
- Port đang mở trên host.
- Log của một container bất kỳ đang chạy.

Chạy script và chụp màn hình kết quả.

**Nộp bài**

- Ảnh chụp nội dung file script.
- Ảnh chụp `chmod +x`.
- Ảnh chụp kết quả chạy script.
- Ảnh chụp phần log/container mà script hiển thị.

---

## Bài 9. Tiếp nhận và kiểm tra một server đang có web app chạy bằng Docker

**Bối cảnh:** Là developer mới được bàn giao một server Ubuntu. Trên server có một web app đang chạy bằng Docker. Cần kiểm tra tổng thể hệ thống theo tư duy thực chiến đã học từ đầu khóa tới nay.

**Yêu cầu:** kiểm tra toàn bộ các nhóm sau.

### Nhóm 1 – Ubuntu cơ bản

- user
- hostname
- date
- uptime
- IP
- disk
- RAM

### Nhóm 2 – process / port / service

- Process liên quan tới Docker.
- Port đang mở.
- Service SSH.
- Service failed (nếu có).

### Nhóm 3 – Docker

- Image đang có.
- Container đang chạy.
- Log của container.
- Port map của container.
- Volume đang có.
- Network đang có.

### Nhóm 4 – Web app

- Dùng `curl` để test web.
- Xác định web container đang chạy port nào.
- Xác định dữ liệu web nằm trên host hay chỉ trong container.
- Xác định database có volume hay không.

### Nhóm 5 – Kết luận kỹ thuật

Tự viết file `summary-buoi11.txt`, trong file phải có:

- Hostname server.
- IP server.
- Số container đang chạy.
- Tên container web.
- Tên container database (nếu có).
- Port web đang dùng.
- Port database đang dùng.
- Volume nào đang lưu dữ liệu.
- 3 rủi ro kỹ thuật nhìn thấy.
- 3 việc sẽ làm tiếp nếu được giao vận hành server này.

**Nộp bài**

- Ảnh chụp terminal kiểm tra toàn bộ các nhóm trên.
- Ảnh chụp file `summary-buoi11.txt`.

> Đây là bài tổng hợp, yêu cầu làm kỹ nhất.
