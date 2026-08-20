<%@ taglib prefix="c" uri="jakarta.tags.core" %> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Tìm kiếm sản phẩm</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 30px;
        background-color: #f8fafc;
      }
      .form-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); max-width: 100%; margin: auto; }
      h1 { color: #1b2a7a; text-align: center; }
      .form-search {
        display: flex;
        align-items: center;
        gap: 12px;
      }
      .form-search label {
        font-weight: 600;
        white-space: nowrap;
      }
      .form-search input {
        padding: 10px 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
        outline: none;
        min-width: 250px;
      }
      table { border-collapse: collapse; width: 100%; margin-top: 20px; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
      th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
      th { background-color: #1b2a7a; color: white; }
      tr:hover { background-color: #f1f5f9; }
      .btn-submit { background-color: #27ae60; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; width: 150px;}
      .btn-submit:hover { background-color: #219150; }
      .link-back { display: block; text-align: center; margin-top: 15px; color: #1b2a7a; text-decoration: none; }
    </style>
  </head>
  <body>
    <div class="form-container">
      <h1>Tìm Kiếm Sản Phẩm</h1>
      <form action="${pageContext.request.contextPath}/products?action=search" class="form-search" method="POST">
        <label for="name">Tên sản phẩm:</label>
        <input type="search" id="name" name="name" required placeholder="Nhập tên sản phẩm..."/>
        <button type="submit" class="btn-submit">Search</button>
      </form>

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
      <a href="${pageContext.request.contextPath}/products" class="link-back">Quay lại danh sách</a>
    </div>
  </body>
</html>
