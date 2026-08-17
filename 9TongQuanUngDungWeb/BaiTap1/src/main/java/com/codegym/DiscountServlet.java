package com.codegym;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
                request.setCharacterEncoding("UTF-8");
                response.setContentType("text/html;charset=UTF-8");

                String description = request.getParameter("description");
                double listPrice = 0;
                double discountPercent = 0;

                try {
                        listPrice = Double.parseDouble(request.getParameter("listPrice"));
                        discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
                } catch (NumberFormatException e) {
                        // handle parse exception if any
                }

                double discountAmount = listPrice * discountPercent * 0.01;
                double discountPrice = listPrice - discountAmount;

                PrintWriter writer = response.getWriter();
                writer.println("<!DOCTYPE html>");
                writer.println("<html>");
                writer.println("<head>");
                writer.println("<meta charset='UTF-8'>");
                writer.println("<title>Kết quả tính chiết khấu</title>");
                writer.println("<style>");
                writer.println(
                                "body { font-family: 'Arial', sans-serif; display: flex; justify-content: center; margin-top: 80px; background-color: #f8fafc; }");
                writer.println(
                                ".result-container { background: white; padding: 30px 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 380px; }");
                writer.println("h2 { color: #1b2a7a; text-align: center; margin-bottom: 20px; }");
                writer.println(
                                ".item { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #eee; }");
                writer.println(".item:last-child { border-bottom: none; }");
                writer.println(".label { font-weight: bold; color: #555; }");
                writer.println(".value { color: #222; }");
                writer.println(".highlight { color: #e11d48; font-weight: bold; font-size: 18px; }");
                writer.println(
                                ".back-btn { display: block; text-align: center; margin-top: 25px; padding: 10px; background-color: #1b2a7a; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; }");
                writer.println(".back-btn:hover { background-color: #121c54; }");
                writer.println("</style>");
                writer.println("</head>");
                writer.println("<body>");
                writer.println("<div class='result-container'>");
                writer.println("<h2>Kết Quả Chiết Khấu</h2>");
                writer.println("<div class='item'><span class='label'>Mô tả sản phẩm:</span><span class='value'>"
                                + (description != null ? description : "") + "</span></div>");
                writer.println("<div class='item'><span class='label'>Giá niêm yết:</span><span class='value'>"
                                + String.format("%,.2f", listPrice) + "</span></div>");
                writer.println("<div class='item'><span class='label'>Tỷ lệ chiết khấu:</span><span class='value'>"
                                + discountPercent + "%</span></div>");
                writer.println("<div class='item'><span class='label'>Lượng chiết khấu:</span><span class='value'>"
                                + String.format("%,.2f", discountAmount) + "</span></div>");
                writer.println("<div class='item'><span class='label'>Giá sau chiết khấu:</span><span class='value highlight'>"
                                + String.format("%,.2f", discountPrice) + "</span></div>");
                writer.println("<a href='index.jsp' class='back-btn'>Quay lại</a>");
                writer.println("</div>");
                writer.println("</body>");
                writer.println("</html>");
        }
}
