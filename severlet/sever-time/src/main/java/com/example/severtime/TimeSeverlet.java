package com.example.severtime;

import java.io.*;
import java.util.Date;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "TimeSeverlet", value = "/index")
public class TimeSeverlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<html>");
        Date today = new Date();
        out.println("<h1>"+ today + "</h1>");
        out.println("</html>");
    }

    public void destroy() {
    }
}