package com.example.productdiscountcalculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductDiscountCalculator", value = "/caculation")
public class ProductDiscountCalculator extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        String product = req.getParameter("product");
        double price = Double.parseDouble(req.getParameter("price"));
        double percent = Double.parseDouble(req.getParameter("percent"));
        double amount = price * percent * 0.01;
        double discountPrice = price - amount;

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<body>");
        writer.println("<p> Mô tả sản phẩm : " + product + "</p>");
        writer.println("<p> Giá niêm yết : " + price + "</p>");
        writer.println("<p> Chiết khấu : " + percent + "</p>");
        writer.println("<p> Lượng chiết khấu  : " + amount + "</p>");
        writer.println("<p> Giá sau chiết khấu  : " + discountPrice + "</p>");
        writer.println("</body>");
        writer.println("</html>");

    }
}