<%@ taglib prefix="c" uri="jakarta.tags.core" %> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Quản lý User</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 30px;
        background-color: #f8fafc;
      }
      h2 {
        color: #1b2a7a;
        text-align: center;
      }
      table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
      }
      th,
      td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
      }
      th {
        background-color: #1b2a7a;
        color: white;
      }
      tr:hover {
        background-color: #f1f5f9;
      }
      .btn {
        padding: 8px 12px;
        text-decoration: none;
        border-radius: 4px;
        color: white;
        font-weight: bold;
        font-size: 14px;
      }
      .btn-add {
        background-color: #27ae60;
        margin-left: 10%;
        display: inline-block;
        margin-bottom: 15px;
      }
      .btn-edit {
        background-color: #2980b9;
        margin-right: 5px;
      }
      .btn-delete {
        background-color: #c0392b;
      }
      .btn-sort {
        background-color: #8e44ad;
        display: inline-block;
        margin-bottom: 15px;
      }
      .btn-search {
        background-color: #34495e;
        border: none;
        cursor: pointer;
      }
      .action-bar {
        width: 80%;
        margin: 0 auto 15px auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 10px;
      }
      .search-form {
        display: flex;
        gap: 5px;
        align-items: center;
      }
      .search-input {
        padding: 8px 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
      }
    </style>
  </head>
  <body>
    <h2>Danh Sách Người Dùng (Users)</h2>
    <div class="action-bar">
      <div>
        <a
          href="${pageContext.request.contextPath}/users?action=create"
          class="btn btn-add"
          style="margin-left: 0; margin-bottom: 0;"
          >Thêm mới User</a
        >
        <a
          href="${pageContext.request.contextPath}/users?action=sort"
          class="btn btn-sort"
          style="margin-bottom: 0;"
          >Sắp xếp theo Tên</a
        >
        <a
          href="${pageContext.request.contextPath}/users"
          class="btn"
          style="background-color: #7f8c8d; margin-bottom: 0;"
          >Tất cả Users</a
        >
      </div>
      <form
        action="${pageContext.request.contextPath}/users"
        method="get"
        class="search-form"
      >
        <input type="hidden" name="action" value="search" />
        <input
          type="text"
          name="country"
          class="search-input"
          placeholder="Nhập quốc gia cần tìm..."
          value="<c:out value='${requestScope.searchCountry}' />"
        />
        <button type="submit" class="btn btn-search">Tìm kiếm</button>
      </form>
    </div>
    <table>
      <tr>
        <th>ID</th>
        <th>Tên User</th>
        <th>Email</th>
        <th>Quốc gia</th>
        <th>Hành động</th>
      </tr>
      <c:choose>
        <c:when test="${empty requestScope.listUser}">
          <tr>
            <td colspan="5" style="text-align: center; color: #7f8c8d; padding: 20px;">
              Không tìm thấy người dùng nào phù hợp.
            </td>
          </tr>
        </c:when>
        <c:otherwise>
          <c:forEach var="user" items="${requestScope.listUser}">
            <tr>
              <td><c:out value="${user.id}" /></td>
              <td><c:out value="${user.name}" /></td>
              <td><c:out value="${user.email}" /></td>
              <td><c:out value="${user.country}" /></td>
              <td>
                <a
                  href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}"
                  class="btn btn-edit"
                  >Sửa</a
                >
                <a
                  href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}"
                  class="btn btn-delete"
                  >Xóa</a
                >
              </td>
            </tr>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </table>
  </body>
</html>
