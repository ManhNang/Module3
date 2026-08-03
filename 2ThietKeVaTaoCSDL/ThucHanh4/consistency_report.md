1. Sai lầm trong quản lý vòng đời trạng thái (is_active):
Nghiệp vụ quy định lịch hẹn trải qua 5 trạng thái liên tục: PENDING -> CONFIRMED -> CHECKED_IN -> COMPLETED/CANCELLED. Việc Legacy SQL dùng kiểu BOOLEAN (is_active) chỉ có hai giá trị (True/False) là hoàn toàn bất lực trong việc thể hiện tiến trình này, khiến hệ thống không thể biết bệnh nhân đã đến khám hay chưa.

2. Thiếu hụt dữ liệu tài chính và xử lý hủy lịch:
Quy trình yêu cầu thu tiền cọc khi đặt lịch và trừ phí phạt kèm lý do khi bệnh nhân hủy. Bảng Appointments cũ thiếu hoàn toàn các trường lưu trữ tiền cọc (deposit_amount), phí phạt (penalty_fee) và lý do hủy (cancel_reason), dẫn đến thất thoát tài chính và mất khả năng đối soát cho bộ phận kế toán.

3. Thiếu sót thực thể Đơn thuốc (Prescriptions):
Nghiệp vụ yêu cầu bác sĩ kê đơn ngay sau khi hoàn tất khám (COMPLETED). Bản thiết kế cũ không có bảng Prescriptions cũng như khóa ngoại kết nối với Appointments, làm gãy hoàn toàn luồng nghiệp vụ khám chữa bệnh cốt lõi.