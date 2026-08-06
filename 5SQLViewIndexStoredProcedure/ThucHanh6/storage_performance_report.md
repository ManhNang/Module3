1. Phân tích sự đánh đổi (Read vs Write Trade-off)
   Index trong MySQL đóng vai trò như bảng mục lục giúp tối ưu hóa tốc độ đọc (Read), nhưng lại tạo ra gánh nặng lớn cho các thao tác ghi (Write - INSERT, UPDATE, DELETE). Mỗi khi có bài viết mới, hệ thống không chỉ ghi dữ liệu chính mà còn phải tính toán và cập nhật lại tất cả cây chỉ mục B-Tree liên quan. Việc lạm dụng Index (đặc biệt là cột TEXT và các cột có độ phân giải thấp như BOOLEAN) khiến chi phí ghi I/O tăng vọt, gây ra hiện tượng nghẽn tài nguyên đĩa cứng và Timeout khi đăng bài.

2. Số liệu so sánh trước và sau khi dọn dẹp Index

- Trước khi tối ưu (5 Index) :
  - Dung lượng Index (Index_length) : ~300 MB
  - Thời gian ghi bài mới (INSERT) : 5.0 - 10.0 giây (Lỗi Timeout)
  - Số lần cập nhật cây B-Tree / 1 lệnh INSERT : 5 lần
  - Tốc độ truy vấn bảng tin (SELECT) : Nhanh (~0.05s)
- Sau khi tối ưu (2 Index) : + Dung lượng Index (Index_length) : ~50 MB + Thời gian ghi bài mới (INSERT) : < 0.1 giây + Số lần cập nhật cây B-Tree / 1 lệnh INSERT : 2 lần + Tốc độ truy vấn bảng tin (SELECT) : Nhanh (~0.05s)
  -> Mức độ cải thiện : + Dung lượng Index (Index_length) : Giảm ~83% + Thời gian ghi bài mới (INSERT) : Nhanh gấp ~50-100 lần + Số lần cập nhật cây B-Tree / 1 lệnh INSERT : Tiết kiệm 60% thao tác I/O + Tốc độ truy vấn bảng tin (SELECT) : Giữ nguyên hiệu năng

3. Kết luận
   Bằng cách cắt bỏ 3 Index vô dụng (idx_content, idx_post_type, idx_is_visible), hệ thống đã giải phóng dung lượng ổ cứng bị lãng phí và khắc phục hoàn toàn sự cố Timeout khi ghi dữ liệu mà vẫn đảm bảo tốc độ đọc tối ưu.
