# Đề bài – Phần II: Tự luận / tình huống thực chiến (50 điểm)

> Nguồn: [Đề đánh giá năng lực Buổi 1–9](DevSecOps_WebServer_Cloudflare_Dockerfile.pdf), trang 11–13. Bài làm nằm trong [README.md](README.md).

## Quy ước cá nhân

- `N` = hai chữ số cuối Mã học viên/MSSV (ví dụ mã kết thúc `07` thì `N = 7`; kết thúc `00` thì `N = 0`).
- `P = 8000 + N` là host port cá nhân.
- Bài làm phải thể hiện tư duy kiểm tra có thứ tự. Không chấp nhận câu trả lời chỉ nêu "restart", "mở port", "tắt firewall" mà không chứng minh nguyên nhân.

| Câu | Chủ đề | Điểm |
|---|---|---|
| [Câu 51](#câu-51--system-design--troubleshooting-cloudflare--nginx--docker-api) | Cloudflare → Nginx → Docker API bị 502 | 20 |
| [Câu 52](#câu-52--đọc-source-và-thiết-kế-dockerfile-spring-boot) | Dockerfile multi-stage cho Spring Boot | 15 |
| [Câu 53](#câu-53--audit-server--redesign-production-exposure) | Audit server và thiết kế lại mức độ phơi bày | 15 |

---

## Câu 51 – System Design & Troubleshooting: Cloudflare → Nginx → Docker API

**(20 điểm)**

Một doanh nghiệp có `api.example.com` đang bật Cloudflare Proxy. Origin là Ubuntu Server chạy Nginx và container API. Người dùng nhận `502 Bad Gateway`. Kỹ sư thu được dữ liệu sau:

```text
$ dig +short api.example.com
104.x.x.x
172.x.x.x

$ docker ps
CONTAINER ID   NAME   PORTS
a1b2c3d4       api    127.0.0.1:8081->8080/tcp

$ curl -s http://127.0.0.1:8081/health
{"status":"UP"}
```

```nginx
# /etc/nginx/conf.d/api.conf
server {
    listen 80;
    server_name api.example.com;
    location / {
        proxy_pass http://127.0.0.1:8080;
    }
}
```

**Yêu cầu**

1. Vẽ sơ đồ request flow từ User → Cloudflare → Origin → Nginx → container API. Trên sơ đồ phải ghi rõ public/internal port và chỉ ra vị trí nghi ngờ lỗi.
2. Phân tích ít nhất 03 giả thuyết kỹ thuật có thể tạo 502 trong kiến trúc này và xếp thứ tự kiểm tra. Không được chỉ nêu mỗi lỗi port.
3. Viết tối thiểu 08 lệnh kiểm tra theo chuỗi từ ngoài vào trong. Với ít nhất 04 lệnh, ghi "nếu kết quả đúng giả thuyết thì thấy gì / nếu không đúng thì kiểm tra tiếp gì".
4. Đề xuất cấu hình Nginx sửa lỗi trực tiếp dựa trên dữ liệu đã cho.
5. Đề xuất 04 bước hardening để giảm khả năng bypass Cloudflare hoặc lộ các port ứng dụng nội bộ.
6. Dùng `N` trong bài: đặt tên container sau khi chuẩn hóa là `api-N` và nêu một lệnh test container cá nhân với host port `P`.

---

## Câu 52 – Đọc source và thiết kế Dockerfile Spring Boot

**(15 điểm)**

Team giao cho em source Spring Boot sau và yêu cầu container hóa theo hướng production cơ bản. Project **không** có Maven Wrapper.

```text
project/
├── pom.xml
├── src/
│   └── main/
│       ├── java/com/company/api/Application.java
│       └── resources/application.properties
└── README.md
```

```xml
<!-- pom.xml (trích) -->
<properties>
    <java.version>21</java.version>
</properties>
<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
        </plugin>
    </plugins>
</build>
```

```properties
# application.properties
server.port=${PORT:8080}
management.endpoints.web.exposure.include=health,info
```

**Yêu cầu**

1. Viết Dockerfile multi-stage hoàn chỉnh: stage build dùng Maven + JDK 21; stage runtime chỉ dùng JRE 21.
2. Runtime container phải chạy bằng non-root user; không bake password/token vào image; expose đúng application port.
3. Tối ưu layer cache ở mức hợp lý với `pom.xml` và `src/`.
4. Viết `.dockerignore` tối thiểu 06 dòng phù hợp.
5. Viết lệnh build image có tag `student-api:N-v1`, chạy container tên `api-N` với host port `P` → container `8080`, xem log và `curl /actuator/health`.
6. Giải thích ngắn: vì sao multi-stage tốt hơn đưa Maven + source vào runtime image; `RUN` khác `ENTRYPOINT`/`CMD` ở đâu.

---

## Câu 53 – Audit Server & Redesign Production Exposure

**(15 điểm)**

Một server Ubuntu đang chạy web, api, MySQL và monitoring. Cloudflare đang Proxy cho `example.com` và `api.example.com`. Kiểm tra hiện trạng:

```text
$ ss -lntp
LISTEN 0 4096 0.0.0.0:22   0.0.0.0:*
LISTEN 0 4096 0.0.0.0:80   0.0.0.0:*
LISTEN 0 4096 0.0.0.0:443  0.0.0.0:*
LISTEN 0 4096 0.0.0.0:3306 0.0.0.0:*
LISTEN 0 4096 0.0.0.0:3000 0.0.0.0:*
LISTEN 0 4096 0.0.0.0:8080 0.0.0.0:*
LISTEN 0 4096 0.0.0.0:9090 0.0.0.0:*

$ docker ps --format "table {{.Names}}\t{{.Ports}}"
NAMES        PORTS
web          0.0.0.0:3000->3000/tcp
api          0.0.0.0:8080->8080/tcp
mysql        0.0.0.0:3306->3306/tcp
prometheus   0.0.0.0:9090->9090/tcp
```

- Cloudflare SSL/TLS mode: **Flexible**
- Origin Nginx: `listen 80;`, chưa cấu hình certificate TLS ở origin.

**Yêu cầu**

1. Chỉ ra tối thiểu 08 vấn đề/rủi ro hoặc điểm chưa tối ưu trong hiện trạng, chia nhóm Network Exposure, TLS/Cloudflare, Docker và Operations.
2. Vẽ lại kiến trúc mục tiêu: User → Cloudflare → Firewall/ACL → Nginx → web/api → DB; Monitoring phải được thể hiện là internal/admin-only.
3. Đề xuất port nào nên public, port nào chỉ internal; nêu cách tổ chức Docker network/volume phù hợp.
4. Đề xuất Cloudflare SSL/TLS mode và điều kiện cần ở origin để triển khai an toàn hơn.
5. Viết checklist verify sau khi chỉnh hệ thống tối thiểu 10 bước, trong đó có DNS, TLS, port, container, log, `curl` Host/domain và kiểm tra truy cập DB/monitoring từ Internet không còn trực tiếp.
6. Dùng `N` trong sơ đồ bằng cách đặt tên network nội bộ `app-net-N` và nêu một rule SSH chỉ cho IP quản trị giả định `203.0.113.N/32` (nếu `N = 0` dùng `203.0.113.10/32`).
