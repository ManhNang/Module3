Cấu trúc B-Tree của Clustered Index lưu trữ dữ liệu bản ghi thực tế tại các nút lá (Leaf Nodes) như thế nào trong Storage Engine InnoDB?

Tại nút lá của Secondary Index trong InnoDB lưu trữ giá trị gì (Con trỏ hay Primary Key) và tại sao lại thiết kế như vậy?

Hiện tượng Secondary Key Lookup (về Clustered Index tìm dữ liệu) xảy ra khi nào và tại sao nó lại tốn chi phí I/O đĩa?

Khái niệm Covering Index là gì và tại sao khi chỉ truy vấn các cột có trong Composite Index lại tránh được việc Lookup về Clustered Index?

Tại sao việc chọn một khóa chính tự tăng (Auto-increment) giúp Clustered Index tránh hiện tượng phân trang (Page Split) tốt hơn một chuỗi UUID ngẫu nhiên?
