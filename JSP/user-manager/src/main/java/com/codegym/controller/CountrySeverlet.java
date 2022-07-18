package com.codegym.controller;

import com.codegym.dao.CountryDAO;
import com.codegym.dao.ICountryDAO;
import com.codegym.dao.UserDAO;
import com.codegym.model.Country;
import com.codegym.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CountrySeverlet", urlPatterns = "/country")
public class CountrySeverlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CountryDAO countryDAO;

    public void init() {
        countryDAO = new CountryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showNewCountry(req, resp);
                    break;
                case "edit":
                    showEditForm(req,resp);
                    break;
                case "delete" :
                    deleteCountry(req, resp);
                    break;
                default:
                    listCountry(req, resp);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertCountry(req, resp);
                    break;
                case "edit":
                    updateCountry(req, resp);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
    private void listCountry(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Country> listCountry = countryDAO.selectAllCountry();
        request.setAttribute("listCountry", listCountry);
        RequestDispatcher dispatcher = request.getRequestDispatcher("country/list.jsp");
        dispatcher.forward(request, response);
    }
    private void showNewCountry(HttpServletRequest request,HttpServletResponse response)throws SQLException, IOException, ServletException {
      RequestDispatcher requestDispatcher = request.getRequestDispatcher("country/create.jsp");
      requestDispatcher.forward(request,response);
    }
    private void insertCountry(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, ServletException{
        String name = request.getParameter("name");
        Country newCountry = new Country(name);
        countryDAO.insertCountry(newCountry);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("country/create.jsp");
        requestDispatcher.forward(request,response);
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Country existingCountry = countryDAO.selectCountry(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("country/edit.jsp");
        request.setAttribute("country", existingCountry);
        dispatcher.forward(request, response);
    }
    private void updateCountry(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Country book = new Country(id, name);
        countryDAO.updateCountry(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("country/edit.jsp");
        dispatcher.forward(request, response);
    }
    private void deleteCountry(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        countryDAO.deleteCountry(id);

        List<Country> countryList = countryDAO.selectAllCountry();
        request.setAttribute("listCountry", countryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("country/list.jsp");
        dispatcher.forward(request, response);
    }

}
