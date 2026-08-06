1. Hiện trạng và Tội ác của "Fat Index"
   Việc áp dụng Covering Index (idx_fat_covering) bao trùm toàn bộ các cột (sensor_id, recorded_at, temperature, humidity, status) giúp tối ưu tuyệt đối cho Dashboard. Tuy nhiên, kiến trúc này gây hậu quả nghiêm trọng:
   Write Penalty khủng khiếp: Với 10,000 cảm biến gửi dữ liệu theo thời gian thực (hàng chục nghìn record/giây), mỗi câu lệnh INSERT buộc B-Tree của Index phải tái cấu trúc và phân bố lại Data Pages cho cả 5 cột. Điều này gây thắt cổ chai luồng ghi, làm nghẽn Data Pipeline và mất mát dữ liệu.
   Lãng phí Storage: Kích thước Index phình to vượt cả dung lượng bảng gốc, làm chi phí lưu trữ SSD Cloud tăng gấp 4 lần.

2. Giải pháp và Kết quả Đánh đổi
   Chúng tôi quyết định thay thế bằng Lean Index tinh gọn: idx_lean_search(sensor_id, recorded_at).
   Chấp nhận đánh đổi: Thao tác SELECT của Dashboard sẽ chậm đi một khoảng rất nhỏ (vài phần nghìn giây) do phát sinh bước Bookmark Lookup (MySQL dùng Secondary Index lọc dữ liệu rồi truy cập Clustered Index để lấy temperature, humidity, status).
   Lợi ích đạt được:
   Tốc độ INSERT tăng vọt (khoảng 5 lần): Giảm tải việc cập nhật B-Tree, giải quyết triệt để vấn đề mất dữ liệu.
   Tiết kiệm Storage (giảm ~70% dung lượng Index): Giảm kích thước Index_length, giúp tối ưu RAM Buffer Pool và giảm chi phí Cloud.

Kết luận: Đánh đổi một chút độ trễ đọc để bảo đảm tính toàn vẹn dữ liệu đầu vào và hạ chi phí vận hành là quyết định kiến trúc bắt buộc cho hệ thống IoT này.
