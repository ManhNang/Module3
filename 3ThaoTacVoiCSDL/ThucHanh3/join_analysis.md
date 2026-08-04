Khi sử dụng LEFT JOIN giữa bảng Customers và Orders, đối với những khách hàng chưa từng mua hàng (như Charlie), kết quả trả về vẫn giữ lại 1 dòng dữ liệu với các giá trị từ bảng Orders mang giá trị NULL.

COUNT(_): Đếm số lượng dòng trả về trong nhóm. Do dòng dữ liệu của khách hàng chưa mua hàng vẫn tồn tại (chứa các giá trị NULL), COUNT(_) sẽ đếm dòng đó và trả về kết quả là 1 (sai thực tế).

COUNT(o.order_id): Chỉ đếm các giá trị khác NULL trên cột order_id của bảng phụ (Orders). Do order_id của khách chưa mua hàng là NULL, hàm sẽ bỏ qua và trả về chính xác kết quả là 0.

Vì vậy, việc dùng COUNT(o.order_id) giúp phản ánh đúng số lượng đơn hàng thực tế của từng khách hàng.
