package java_web_currency_converter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "java_Web_Currency_Converter", value = "/convert")
public class java_Web_Currency_Converter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float rate = Float.parseFloat(req.getParameter("rate"));
        float usd = Float.parseFloat(req.getParameter("usd"));
        float vnd = rate * usd;

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<h1>Rate:" + rate + "</h1>");
        writer.println("<h1>USD:" + usd + "</h1>");
        writer.println("<h1>VND:" + vnd + "</h1>");
        writer.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("foooo");
        float rate = Float.parseFloat(req.getParameter("rate"));
        float usd = Float.parseFloat(req.getParameter("usd"));
        float vnd = rate * usd;

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<h1>Rate:" + rate + "</h1>");
        writer.println("<h1>USD:" + usd + "</h1>");
        writer.println("<h1>VND:" + vnd + "</h1>");
        writer.println("</html>");
        writer.close();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
