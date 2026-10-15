# Docker Compose thực chiến trên server


## Yêu cầu chung

- Mỗi bạn thực hành trực tiếp trên server cá nhân đã được cấp.
- Mỗi bạn phải tự tải một bộ source code web app về máy local hoặc trực tiếp trên server.
- Sau đó:
  - đưa source code lên server
  - kiểm tra cấu trúc source
  - viết Dockerfile nếu source chưa có
  - viết file `docker-compose.yml`
  - chạy hệ thống bằng Docker Compose
- Toàn bộ bài phải chụp màn hình rõ ràng.
- Hạn nộp: trước thứ 6 tuần này.
- Không làm qua loa, không chỉ chụp mỗi kết quả cuối.

## Mục tiêu của bài tập

Sau bài này, các em phải làm được:

- lấy một source code thật
- đưa source code lên server Ubuntu
- hiểu source code gồm những gì
- viết file cấu hình để Docker hóa ứng dụng
- dùng Docker Compose để dựng hệ thống
- kiểm tra log, port, container, volume
- nhìn ứng dụng theo tư duy: source code, Dockerfile, image, service, container, env, volume, network

## Yêu cầu chọn source code

Mỗi bạn chọn 1 source code trên trang hotrodoan.vn, ưu tiên:

- NodeJS
- Java
- hoặc web app demo tự các em viết ra

Có thể chọn theo 1 trong 2 cách:

- **Cách 1:** tự dùng một source code do chính mình đã làm trước đó.
- **Cách 2:** tải một source code demo từ GitHub hoặc nguồn hotrodoan.vn.

Yêu cầu bắt buộc, source code phải có tối thiểu:

- file app chính
- package quản lý dependency
- có thể chạy được thành 1 service web

---

## Bài 1 – Lấy source code và đưa lên server

**Yêu cầu**

- tải source code về
- đưa source code lên server
- đặt trong một thư mục riêng, ví dụ: `~/[tên của em]-compose-app`

**Phải chụp màn hình**

- thư mục source trên server
- lệnh upload / `git clone` / copy source
- kết quả `ls -la`
- kết quả cây thư mục cơ bản

*Mục tiêu: chứng minh các em thực sự có source code trên server để làm việc.*

## Bài 2 – Phân tích source code trước khi Docker hóa

Kiểm tra và mô tả ngắn source code của em gồm:

- file entry point là gì
- ứng dụng chạy bằng công nghệ gì
- nếu là NodeJS thì có `package.json` không
- app đang chạy ở port nào
- app có cần biến môi trường hay không

**Phải chụp màn hình**

- `ls -la`
- mở file chính bằng `cat`, `nano` hoặc `less`
- nếu có `package.json` thì chụp nội dung phần script / dependency chính

**Kết quả cần nộp**

Viết file `source-analysis.txt`, trong đó nêu ngắn gọn:

- tên source
- công nghệ
- file chạy chính
- port ứng dụng
- app cần gì để chạy

## Bài 3 – Viết Dockerfile cho source code đó

**Yêu cầu**

Dựa trên source code đã tải về, tự viết `Dockerfile`. Dockerfile phải phù hợp với source code em đang dùng.

**Phải chụp màn hình**

- nội dung Dockerfile
- lệnh build image
- kết quả build thành công

**Yêu cầu kỹ thuật**

Dockerfile phải có tối thiểu các chỉ thị phù hợp như:

- `FROM`
- `WORKDIR`
- `COPY`
- nếu cần thì `RUN`
- `EXPOSE`
- `CMD`

*Mục tiêu: chứng minh các em hiểu cách biến source code thành image Docker.*

## Bài 4 – Build image từ Dockerfile

**Yêu cầu**

- build image từ source code của em
- đặt tên image rõ ràng, ví dụ: `my-app`

**Phải chụp màn hình**

- lệnh `docker build`
- kết quả build
- `docker images`

**Kết quả cần nộp**

Viết ngắn 3–5 dòng:

- image tên gì
- build từ đâu
- ứng dụng bên trong image là gì

## Bài 5 – Viết file Docker Compose cho ứng dụng

**Yêu cầu**

Tự viết file `docker-compose.yml`. File này phải chứa ít nhất:

- 1 service cho app
- nếu source có liên quan DB thì có thể thêm DB
- nếu chưa có DB thật, vẫn phải viết service app cho đúng chuẩn

**Nếu làm tốt hơn, khuyến khích:**

- thêm `environment`
- thêm volume hoặc bind mount nếu hợp lý
- thêm `depends_on` nếu có DB

**Phải chụp màn hình**

- nội dung file `docker-compose.yml`
- kiểm tra file bằng mắt
- nếu có lỗi YAML thì phải sửa

## Bài 6 – Chạy ứng dụng bằng Docker Compose

**Yêu cầu**

Chạy hệ thống bằng `docker compose up -d`. Sau đó kiểm tra:

- service nào đang chạy
- container nào đang tạo ra
- app có phản hồi không

**Phải chụp màn hình**

- `docker compose up -d`
- `docker compose ps`
- `docker ps`
- `curl` vào port app
- nếu có thể, chụp giao diện web qua trình duyệt

## Bài 7 – Kiểm tra log và trạng thái hệ thống

**Yêu cầu**

Sau khi chạy xong, thực hiện kiểm tra:

- log của app
- log của db nếu có
- port đang mở trên host
- container có đang Up không
- volume có tồn tại không nếu em dùng volume

**Lệnh cần nghĩ tới**

- `docker compose logs`
- `docker compose logs app`
- `docker ps`
- `ss -tuln`
- `docker volume ls`

**Phải chụp màn hình**

- log app
- log db nếu có
- port host
- volume nếu có

## Bài 8 – Vẽ sơ đồ hệ thống ứng dụng của em

**Yêu cầu**

Tự vẽ một sơ đồ hệ thống cho bài em đã làm, trong đó tối thiểu phải có:

- user / browser
- host Ubuntu server
- Docker Compose
- app service
- image
- container
- host port
- container port

**Nếu có database, phải vẽ thêm:**

- db service
- volume dữ liệu
- quan hệ app ↔ db

**Nếu có env hoặc bind mount:** khuyến khích thể hiện vào sơ đồ.

**Phải nộp**

- ảnh chụp sơ đồ
- sơ đồ phải có mũi tên, port, tên service rõ ràng

## Bài 9 – Viết báo cáo kỹ thuật ngắn

**Yêu cầu**

Tạo file `summary-[tên của em].txt`. Nội dung tối thiểu:

```text
Họ tên:
Hostname server:
Tên source code:
Công nghệ của source:
Tên image đã build:
Tên service trong docker-compose:
Port host:
Port container:
```

Và trả lời 5 câu hỏi:

1. Em đã dùng Dockerfile như thế nào?
2. Em đã dùng Docker Compose như thế nào?
3. Nếu hệ thống chưa chạy được ngay từ đầu, lỗi nằm ở đâu?
4. 5 lỗi kỹ thuật em có thể gặp khi Docker hóa source code này là gì?
5. Nếu mở rộng tiếp, em sẽ thêm database / nginx / env / volume ra sao?
