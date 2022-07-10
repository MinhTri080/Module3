package com.example.simple_dictionary;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "simple_dictionary", value = "/translate")
public class simple_dictionary extends HttpServlet {
    private String message;

    public void init() {
        message = "Simple Dictionary";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String,String> dictionary = new HashMap<>();
        dictionary.put("hello","xin chào");
        dictionary.put("how","thế nào");
        dictionary.put("book","quyển sách");
        dictionary.put("computer","máy tính");
        String search = request.getParameter("txtSearch");
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        String result = dictionary.get(search);
        if(result != null){
            writer.println("Word : "+ search);
            writer.println("Result :" + result);

        }else {
            writer.println(" Not fond");
        }
        writer.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String,String> dictionary = new HashMap<>();
        dictionary.put("hello","xin chào");
        dictionary.put("how","thế nào");
        dictionary.put("book","quyển vở");
        dictionary.put("computer","máy tính");
        String search = req.getParameter("txtSearch");
        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        String result = dictionary.get(search);
        if(result != null){
            writer.println("Word : "+ search +"</br>");
            writer.println("Result :" + result);

        }else {
            writer.println("<h3> Not fond</h3>");
        }
        writer.println("</html>");
    }

    public void destroy() {
    }
}