#!/usr/bin/env bash
# health-check.sh - kiểm tra nhanh hệ thống Docker sau deploy
# Dùng: ./health-check.sh [tên_container] [cổng]

CONTAINER="${1:-cicd-demo-web}"
PORT="${2:-8080}"
BASE_URL="http://localhost:${PORT}"

section() { echo; echo "===== $1 ====="; }

section "1. User hiện tại"
whoami

section "2. Hostname"
hostname

section "3. Thời gian hệ thống"
date

section "4. Docker containers đang chạy"
docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'

section "5. 20 dòng log gần nhất của ${CONTAINER}"
docker logs --tail 20 "$CONTAINER" 2>&1

section "6. Các cổng đang mở (TCP, LISTEN)"
ss -tlnp 2>/dev/null | head -20

section "7. Response từ app (${BASE_URL}/)"
curl -s -o /dev/null -w "HTTP %{http_code} - %{time_total}s\n" "$BASE_URL/" || echo "Không kết nối được app"

section "8. Health endpoint (${BASE_URL}/health)"
CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/health")
if [ "$CODE" = "200" ]; then
  echo "OK - health trả về HTTP 200"
else
  echo "FAIL - health trả về HTTP ${CODE}"
  exit 1
fi
