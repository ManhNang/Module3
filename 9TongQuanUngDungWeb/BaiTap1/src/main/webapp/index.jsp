<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Tính chiết khấu cho sản phẩm khi mua hàng online</title>
    <style>
      body {
        font-family: "Arial", sans-serif;
        display: flex;
        justify-content: center;
        margin-top: 100px;
        background-color: #f8fafc;
      }
      .calculator-container {
        background: white;
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        width: 350px;
      }
      input {
        padding: 12px;
        margin: 15px 0;
        width: 90%;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: 16px;
      }
      button {
        background-color: #1b2a7a;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 90%;
        font-weight: bold;
        font-size: 16px;
      }
      button:hover {
        background-color: #121c54;
      }
    </style>
  </head>
  <body>
    <div class="calculator-container">
      <h2 style="color: #1b2a7a">Product Discount Calculator</h2>
      <!-- Form gửi dữ liệu bằng phương thức POST tới đường dẫn /display-discount -->
      <form action="display-discount" method="POST">
        <input
          type="text"
          name="description"
          placeholder="Mô tả của sản phẩm..."
          required
        />
        <input
          type="number"
          name="listPrice"
          placeholder="Giá niêm yết của sản phẩm..."
          min="0"
          required
          step="any"
        />
        <input
          type="number"
          name="discountPercent"
          placeholder="Tỷ lệ chiết khấu (phần trăm)"
          min="0"
          max="100"
          required
          step="any"
        />
        <button type="submit">Tính chiết khấu</button>
      </form>
    </div>
  </body>
</html>
