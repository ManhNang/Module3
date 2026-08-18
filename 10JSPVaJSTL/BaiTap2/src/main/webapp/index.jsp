<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 40px;
        }
        .container {
            background-color: #ffffff;
            padding: 24px 32px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            max-width: 420px;
        }
        h2 {
            margin-top: 0;
            color: #333333;
        }
        fieldset {
            border: 1px solid #cccccc;
            border-radius: 6px;
            padding: 16px 20px;
        }
        legend {
            font-weight: bold;
            color: #444444;
            padding: 0 6px;
        }
        .form-group {
            margin-bottom: 14px;
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: 500;
            margin-bottom: 5px;
            color: #555555;
        }
        input[type="number"], input[type="text"], select {
            padding: 8px 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-size: 14px;
        }
        input[type="submit"] {
            margin-top: 8px;
            padding: 10px 16px;
            background-color: #1976d2;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        input[type="submit"]:hover {
            background-color: #1565c0;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Simple Calculator</h2>
    <form action="calculate" method="post">
        <fieldset>
            <legend>Calculator</legend>
            <div class="form-group">
                <label for="first-operand">First operand:</label>
                <input type="number" step="any" id="first-operand" name="first-operand" required placeholder="Nhập số thứ nhất" />
            </div>
            <div class="form-group">
                <label for="operator">Operator:</label>
                <select id="operator" name="operator">
                    <option value="+">Cộng (+)</option>
                    <option value="-">Trừ (-)</option>
                    <option value="*">Nhân (*)</option>
                    <option value="/">Chia (/)</option>
                </select>
            </div>
            <div class="form-group">
                <label for="second-operand">Second operand:</label>
                <input type="number" step="any" id="second-operand" name="second-operand" required placeholder="Nhập số thứ hai" />
            </div>
            <input type="submit" value="Calculate" />
        </fieldset>
    </form>
</div>
</body>
</html>
