package com.codegym;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Result</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f6f8; }");
        out.println(".card { background: white; padding: 24px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); max-width: 450px; }");
        out.println(".error { color: #d9534f; font-weight: bold; }");
        out.println(".result { font-size: 18px; color: #2e7d32; font-weight: bold; }");
        out.println("a { display: inline-block; margin-top: 15px; color: #1976d2; text-decoration: none; }");
        out.println("a:hover { text-decoration: underline; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='card'>");
        out.println("<h1>Result:</h1>");

        try {
            String firstOperandStr = request.getParameter("first-operand");
            String secondOperandStr = request.getParameter("second-operand");
            String operator = request.getParameter("operator");

            if (firstOperandStr == null || secondOperandStr == null || operator == null ||
                firstOperandStr.trim().isEmpty() || secondOperandStr.trim().isEmpty()) {
                throw new IllegalArgumentException("Vui lòng nhập đầy đủ hai toán hạng và toán tử.");
            }

            double firstOperand = Double.parseDouble(firstOperandStr.trim());
            double secondOperand = Double.parseDouble(secondOperandStr.trim());

            double result = Calculator.calculate(firstOperand, secondOperand, operator);
            
            // In ra phép tính ví dụ: 1 + 1 = 2
            out.println("<p class='result'>" + firstOperand + " " + operator + " " + secondOperand + " = " + result + "</p>");
        } catch (NumberFormatException e) {
            out.println("<p class='error'>Lỗi: Vui lòng nhập số hợp lệ!</p>");
        } catch (ArithmeticException | IllegalArgumentException e) {
            out.println("<p class='error'>Lỗi: " + e.getMessage() + "</p>");
        } catch (Exception e) {
            out.println("<p class='error'>Lỗi không xác định: " + e.getMessage() + "</p>");
        }

        out.println("<a href='index.jsp'>&larr; Quay lại trang tính</a>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
}
