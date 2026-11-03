# CHỦ ĐỀ: CLOUDFLARE THỰC CHIẾN + CI/CD CƠ BẢN CHO HỆ THỐNG NGINX / DOCKER

*Học Viện Sáng Tạo, Khởi Nghiệp Từ Công Nghệ*

## Yêu cầu chung

- Mỗi bạn thực hành trực tiếp trên server cá nhân đã được cấp.
- Toàn bộ bài làm phải có:
  - ảnh chụp lệnh
  - ảnh chụp kết quả
  - ảnh chụp cấu hình nếu có
  - sơ đồ hệ thống nếu đề yêu cầu
- Không làm qua loa kiểu chỉ chụp kết quả cuối.
- Mỗi bài cần thể hiện rõ:
  - em đã làm gì
  - em kiểm tra như thế nào
  - hệ thống đang chạy ra sao
- **Hạn nộp:** trước buổi học tiếp theo.

---

## BÀI 1: Dựng một hệ thống web có domain/subdomain logic

**Tình huống doanh nghiệp / Bối cảnh:** Doanh nghiệp có 1 domain chính và muốn tổ chức hệ thống như sau:

- domain chính cho web giới thiệu
- 1 subdomain cho API
- 1 subdomain cho admin

Hiện tại em chưa cần cấu hình domain thật nếu chưa có, nhưng phải dựng được kiến trúc mô phỏng đầy đủ trên server.

### Yêu cầu

Trên server, dựng mô hình ít nhất gồm:

- 1 nginx reverse proxy
- 2 service phía sau, ví dụ: `web`, `api`

Mô phỏng logic:

- `example.com` → web
- `api.example.com` → api

Ngoài ra:

- Viết file cấu hình nginx phù hợp.
- Mô tả rõ nếu có domain thật thì record/subdomain sẽ đi thế nào.

### Phải nộp

- ảnh file nginx config
- ảnh `docker compose ps`
- ảnh test `curl` theo từng host
- giải thích ngắn: subdomain dùng để làm gì trong hệ thống này

---

## BÀI 2: Giải thích vai trò Cloudflare trong hệ thống đang chạy

**Bối cảnh:** Lãnh đạo kỹ thuật hỏi em:

> "Cloudflare đứng ở đâu trong hệ thống của mình, nó làm gì, và vì sao không nên để lộ origin IP?"

### Yêu cầu

Vẽ sơ đồ hệ thống. Sơ đồ phải có:

- user/browser
- Cloudflare
- domain/subdomain
- Ubuntu server
- nginx
- app/container

### Phải nộp

- sơ đồ hệ thống
- 1 file tóm tắt ngắn: `bai2-cloudflare-summary.txt`

---

## BÀI 3: Kiểm tra server có đang lộ dịch vụ không cần thiết không

**Bối cảnh:** Em được yêu cầu rà soát nhanh server để xem có dịch vụ nào đang public không hợp lý, ví dụ:

- DB
- app nội bộ
- port test/dev

### Yêu cầu

- Kiểm tra toàn bộ port đang mở trên host.
- Xác định port nào là:
  - public hợp lý
  - public chưa hợp lý
  - nội bộ nên ẩn
- Kiểm tra container nào đang chạy.
- Kiểm tra nginx đang public gì.
- Nếu có MySQL/DB đang mở host port thì phải ghi chú rõ.

### Phải nộp

- ảnh lệnh
- ảnh kết quả
- kết luận ngắn:
  - port nào hợp lý
  - port nào có rủi ro
  - vì sao

---

## BÀI 4: Thiết kế mô hình nhiều subdomain chạy song song

**Bối cảnh:** Doanh nghiệp muốn chạy song song trên cùng một domain chính:

- web chính
- API
- admin
- staging

### Yêu cầu

- Mô tả kiến trúc.
- Vẽ sơ đồ.
- Nêu rõ:
  - subdomain nào dùng cho mục đích gì
  - service nào tương ứng
  - service nào public
  - service nào chỉ nội bộ
- Giải thích nếu dùng Nginx + Docker Compose thì route ra sao.

### Bắt buộc

Vẽ sơ đồ hệ thống. Sơ đồ phải có:

- `example.com`
- `api.example.com`
- `admin.example.com`
- `staging.example.com`
- nginx
- các service phía sau
- port public và nội bộ

### Phải nộp

- sơ đồ
- mô tả ngắn 10–15 dòng theo kiểu kỹ thuật

---

## BÀI 5: Chuẩn hóa quy trình deploy thủ công hiện tại

**Bối cảnh:** Hiện tại team của em đang deploy kiểu:

1. sửa code
2. build image
3. SSH vào server
4. chạy lại stack

Lãnh đạo yêu cầu em chuẩn hóa quy trình này thành checklist rõ ràng.

### Yêu cầu

Viết ra một quy trình deploy thủ công có chuẩn, áp dụng cho app Docker đang chạy trên server.

Quy trình phải có ít nhất các bước:

- kiểm tra source/code mới
- build image
- chạy lại stack
- kiểm tra container
- kiểm tra log
- kiểm tra response
- kiểm tra nginx / domain nếu có

### Phải nộp

Tạo file: `deploy-checklist-buoi16.txt`

Nội dung phải rõ từng bước, không viết chung chung.

---

## BÀI 6: Viết shell script deploy cơ bản

**Bối cảnh:** Team không muốn mỗi lần deploy lại gõ tay từng lệnh. Em được giao viết một script cơ bản để chuẩn hóa deploy.

### Yêu cầu

Tạo file script: `deploy-basic.sh`

Script phải làm tối thiểu các việc sau:

- hiển thị user và hostname
- di chuyển vào thư mục dự án
- build lại hệ thống
- chạy lại hệ thống bằng Docker Compose
- hiển thị trạng thái container
- in log 30–50 dòng gần nhất của app hoặc nginx

### Phải nộp

- nội dung file script
- lệnh `chmod +x`
- ảnh chạy script
- ảnh kết quả

---

## BÀI 7: Verify sau deploy

**Bối cảnh:** Một lỗi thường gặp của team là deploy xong nhưng không kiểm tra kỹ, đến khi người dùng báo mới phát hiện hệ thống lỗi.

### Yêu cầu

Xây dựng một checklist verify sau deploy cho hệ thống của em trên server. Checklist phải bao gồm ít nhất:

- kiểm tra container
- kiểm tra log
- kiểm tra port
- kiểm tra app response bằng `curl`
- kiểm tra nginx route
- nếu có domain/subdomain thì nêu thêm bước kiểm tra ngoài browser

### Phải nộp

- Tạo file: `post-deploy-verify.txt`
- Chụp ảnh chạy các lệnh verify thực tế trên server.

---

## BÀI 8: Vẽ sơ đồ pipeline cơ bản cho hệ thống của em

**Bối cảnh:** Team yêu cầu em trình bày cho một bạn mới vào hiểu pipeline triển khai cơ bản của hệ thống hiện tại.

### Yêu cầu

Sơ đồ phải thể hiện rõ:

- code đi từ đâu
- image được build ở đâu
- container chạy ở đâu
- nginx đứng ở đâu
- nếu có Cloudflare thì edge nằm ở đâu
- người dùng đi vào hệ thống theo luồng nào

### Bắt buộc

Sơ đồ phải có ít nhất:

- source code
- Dockerfile
- image
- container
- nginx
- domain/subdomain
- Cloudflare hoặc lớp edge
- user/browser

---

## BÀI 9: Bài tổng hợp lớn — đánh giá kiến trúc triển khai hiện tại của hệ thống em

> **Đây là bài quan trọng nhất, làm kỹ nhất.**

**Bối cảnh:** Em đóng vai kỹ sư phụ trách hệ thống. Hãy đánh giá toàn bộ hệ thống hiện tại em đang chạy trên server theo góc nhìn:

- Cloudflare / domain / subdomain
- nginx reverse proxy
- Docker Compose
- deploy
- verify
- rủi ro vận hành

### Yêu cầu

Viết một file tổng hợp: `tong-hop.txt`

Nội dung tối thiểu phải có:

**Phần 1 – Hệ thống hiện tại của em gồm gì**

- server
- service
- port
- nginx
- domain/subdomain nếu có
- Cloudflare nếu có hoặc mô phỏng

**Phần 2 – Luồng truy cập hệ thống**

- user đi vào đâu
- request đi qua đâu
- nginx route vào đâu
- app gọi gì phía sau

**Phần 3 – Quy trình deploy hiện tại**

- em đang deploy kiểu gì
- đã có script chưa
- đã có bước verify chưa

**Phần 4 – Ít nhất 5 rủi ro kỹ thuật**

Ví dụ:

- lộ origin
- public DB
- deploy tay dễ quên bước
- thiếu rollback
- thiếu log/monitoring
- subdomain route sai
- nginx config sai

**Phần 5 – 3 việc em sẽ ưu tiên cải thiện**

Ví dụ:

- chuẩn hóa script deploy
- ẩn port không cần thiết
- tách subdomain rõ hơn
- tăng bước verify sau deploy
- chuẩn hóa nginx config

### Bắt buộc

Vẽ thêm 1 sơ đồ hệ thống tổng hợp.
