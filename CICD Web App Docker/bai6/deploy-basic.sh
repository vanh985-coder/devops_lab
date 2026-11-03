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
