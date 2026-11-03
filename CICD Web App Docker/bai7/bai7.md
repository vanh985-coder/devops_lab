# BÀI 7: Verify sau deploy

> **Họ tên:** Trần Đức Việt Anh  
> **File nộp:** [post-deploy-verify.txt](post-deploy-verify.txt)

## 1. Checklist verify

| # | Mục kiểm tra | Lệnh |
|---|---|---|
| 1 | Kiểm tra container | `docker compose ps` |
| 2 | Kiểm tra log | `docker compose logs --tail 50` |
| 3 | Kiểm tra port | `ss -tuln` |
| 4 | Kiểm tra app response bằng curl | `curl -I https://vietanhhpts123.top` và `curl -I http://localhost:18096` |
| 5 | Kiểm tra nginx route | `nginx -t` và `systemctl status nginx` |

## 2. Ảnh chạy lệnh verify trên server

### 2.1. Kiểm tra container

```bash
docker compose ps
```

*(Chèn ảnh)*

### 2.2. Kiểm tra log

```bash
docker compose logs --tail 50
```

*(Chèn ảnh)*

### 2.3. Kiểm tra port

```bash
ss -tuln
```

*(Chèn ảnh)*

### 2.4. Kiểm tra app response bằng curl

```bash
curl -I https://vietanhhpts123.top
curl -I http://localhost:18096
```

*(Chèn ảnh)*

### 2.5. Kiểm tra nginx route

```bash
nginx -t
systemctl status nginx
```

*(Chèn ảnh)*

---

### Danh sách nộp

- [x] File `post-deploy-verify.txt`
- [ ] Ảnh chạy lệnh verify trên server (bạn chụp sau)
