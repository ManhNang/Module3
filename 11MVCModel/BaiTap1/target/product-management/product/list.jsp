<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        h1 { color: #1b2a7a; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #1b2a7a; color: white; }
        tr:hover { background-color: #f1f5f9; }
        .btn { display: inline-block; padding: 8px 16px; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 14px; }
        .btn-create { background-color: #27ae60; color: white; margin-bottom: 15px; }
        .btn-search { background-color: #3e23c4; color: white; margin-bottom: 15px; }
        .btn-edit { color: #2980b9; text-decoration: none; margin-right: 10px; }
        .btn-delete { color: #c0392b; text-decoration: none; }
        .btn-view { color: #3043ab; text-decoration: none; margin-right: 10px; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Danh Sách Sản Phẩm</h1>
    <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-create">Thêm sản phẩm mới</a>
    <a href="${pageContext.request.contextPath}/products?action=search" class="btn btn-search">Tìm kiếm sản phẩm</a>
    
    <table>
        <thead>
            <tr>
                <th>Mã sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Mô tả</th>
                <th>Nhà sản xuất</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.products}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/products?action=view&name=${product.name}" class="btn-view">${product.name}</a>
                    </td>
                    <td>${product.price}</td>
                    <td>${product.description}</td>
                    <td>${product.manufacturer}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/products?action=edit&name=${product.name}" class="btn-edit">Sửa</a>
                        <a href="${pageContext.request.contextPath}/products?action=delete&name=${product.name}" class="btn-delete">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>