<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.codegym.model.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jakartaC" uri="jakarta.tags.core" %>

<%
    // Khởi tạo danh sách khách hàng giả lập
    List<Customer> customerList = new ArrayList<>();
    customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&auto=format&fit=crop&q=80"));
    customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&auto=format&fit=crop&q=80"));
    customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&auto=format&fit=crop&q=80"));
    customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?w=150&auto=format&fit=crop&q=80"));
    customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=150&auto=format&fit=crop&q=80"));

    request.setAttribute("customerList", customerList);
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách khách hàng</title>
    <style>
        :root {
            --primary-color: #4f46e5;
            --primary-hover: #4338ca;
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
            --shadow-sm: 0 1px 3px rgba(0,0,0,0.1);
            --shadow-md: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -2px rgba(0,0,0,0.1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 900px;
            background: var(--card-bg);
            padding: 30px;
            border-radius: 12px;
            box-shadow: var(--shadow-md);
        }

        .header {
            margin-bottom: 24px;
            text-align: center;
        }

        .header h1 {
            font-size: 26px;
            color: #0f172a;
            font-weight: 700;
            letter-spacing: -0.5px;
        }

        .header p {
            color: var(--text-muted);
            margin-top: 6px;
            font-size: 14px;
        }

        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th {
            background-color: #f1f5f9;
            color: #475569;
            font-size: 13px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 14px 16px;
            border-bottom: 2px solid var(--border-color);
        }

        td {
            padding: 14px 16px;
            font-size: 14px;
            border-bottom: 1px solid var(--border-color);
            vertical-align: middle;
        }

        tr:hover {
            background-color: #f8fafc;
        }

        .customer-img {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #e0e7ff;
            box-shadow: var(--shadow-sm);
        }

        .customer-name {
            font-weight: 600;
            color: #0f172a;
        }

        .badge-index {
            background: #eef2ff;
            color: var(--primary-color);
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: bold;
            display: inline-block;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Danh Sách Khách Hàng</h1>
        <p>Hiển thị danh sách khách hàng sử dụng JSP và JSTL (Tomcat 10+)</p>
    </div>

    <div class="table-responsive">
        <table>
            <thead>
                <tr>
                    <th style="width: 60px; text-align: center;">STT</th>
                    <th style="width: 70px; text-align: center;">Ảnh</th>
                    <th>Tên khách hàng</th>
                    <th>Ngày sinh</th>
                    <th>Địa chỉ</th>
                </tr>
            </thead>
            <tbody>
                <!-- Sử dụng JSTL Core để lặp qua danh sách -->
                <c:forEach var="customer" items="${customerList}" varStatus="status">
                    <tr>
                        <td style="text-align: center;">
                            <span class="badge-index">${status.index + 1}</span>
                        </td>
                        <td style="text-align: center;">
                            <img src="${customer.image}" alt="${customer.name}" class="customer-img" />
                        </td>
                        <td class="customer-name">${customer.name}</td>
                        <td>${customer.dob}</td>
                        <td>${customer.address}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
