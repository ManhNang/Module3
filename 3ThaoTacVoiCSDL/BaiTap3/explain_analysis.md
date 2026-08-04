Trước khi tối ưu:
type = ALL: MySQL thực hiện quét toàn bộ bảng (Full Table Scan) do mệnh đề WHERE chứa các hàm YEAR() và MONTH(). Cột created_at bị bọc bởi hàm nên truy vấn rơi vào tình trạng Non-SARGable, vô hiệu hóa hoàn toàn khả năng dùng Index.
rows ≈ 5,000,000: Hệ thống phải duyệt qua toàn bộ 5 triệu bản ghi để lọc dữ liệu, gây tiêu tốn CPU lên tới 100% và làm nghẽn tài nguyên.

Sau khi tối ưu:
type = range (hoặc ref): Nhờ chuyển điều kiện thời gian sang dạng lọc khoảng SARGable (created_at >= ... AND created_at < ...) kết hợp với Composite Index (transaction_type, created_at), MySQL thực hiện tìm kiếm trực tiếp trên cây B-Tree.
rows ≈ vài nghìn: Số lượng bản ghi cần duyệt giảm hơn 99.9%, chỉ tập trung vào đúng các giao dịch DEPOSIT trong tháng 6/2026.

Kết luận: Việc refactor truy vấn và tạo Index đã giải quyết triệt để điểm nghẽn hiệu suất, giảm thời gian thực thi từ 45 giây xuống còn vài mili giây.
