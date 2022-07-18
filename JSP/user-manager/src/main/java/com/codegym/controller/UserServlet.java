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
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private ICountryDAO iCountryDAO;
    private CountryDAO countryDAO;
    private String errors = "";

    public void init() {
        userDAO = new UserDAO();
        iCountryDAO = new CountryDAO();
        if (this.getServletContext().getAttribute("listCountry") == null) {
            this.getServletContext().setAttribute("listCountry", iCountryDAO.selectAllCountry());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "p" :
                    selectUsersPagging(request, response);
                    break;
                default:
                    listUser(request, response);
//                    selectUsersPagging(request,response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void selectUsersPagging(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage=5;
        if(request.getParameter("page") != null){
            page = Integer.parseInt(request.getParameter("page"));
        }
        List<User> userList = userDAO.selectUsersPagging((page -1)* recordsPerPage,recordsPerPage);
        int noOfRecords = userDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        request.setAttribute("listUser", userList);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        RequestDispatcher view = request.getRequestDispatcher("/user/displayUsers.jsp");
        view.forward(request, response);

        request.setAttribute("listUser", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/displayUsers.jsp");
        dispatcher.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
//        int page = 1;
//        int recordsPerPage=10;
//        if(request.getParameter("page") != null){
//            page = Integer.parseInt(request.getParameter("page"));
//            List<User> userList = userDAO.selectUsersPagging((page -1)* recordsPerPage,recordsPerPage);
//            int noOfRecords = userDAO.getNoOfRecords();
//            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
//            request.setAttribute("listUser", userList);
//            request.setAttribute("noOfPages", noOfPages);
//            request.setAttribute("currentPage", page);
//            RequestDispatcher view = request.getRequestDispatcher("user/list.jsp");
//            view.forward(request, response);
//
//            request.setAttribute("listUser", userList);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/user/list.jsp");
//            dispatcher.forward(request, response);
//        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
//        String name = request.getParameter("name");
//        String email = request.getParameter("email");
//        int country = Integer.parseInt(request.getParameter("idCountry")) ;
//        User newUser = new User(name, email, country);
//        userDAO.insertUser(newUser);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
//        dispatcher.forward(request, response);
        User user = new User();
        boolean flag = true;
        Map<String, String> hashMap = new HashMap<String, String>();
        System.out.println(this.getClass() + "insertUser with validate");
        try {
            //user.setId(Integer.parseInt(request.getParameter("id")));

            String email = request.getParameter("email");
            user.setEmail(email);
            user.setName(request.getParameter("name"));
            user.setPassword(request.getParameter("password"));

            int idCountry = Integer.parseInt(request.getParameter("idCountry"));
            user.setIdCountry(idCountry);

            System.out.println(this.getClass() + "User info from request: " + user);

            ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
            Validator validator = validatorFactory.getValidator();

            Set<ConstraintViolation<User>> constraintViolations = validator.validate(user);


            if (!constraintViolations.isEmpty()) {

                errors = "<ul>";
                // constraintViolations is has error
                for (ConstraintViolation<User> constraintViolation : constraintViolations) {
                    errors += "<li>" + constraintViolation.getPropertyPath() + " " + constraintViolation.getMessage()
                            + "</li>";
                }
                errors += "</ul>";


                request.setAttribute("user", user);
                request.setAttribute("errors", errors);

                List<Country> listCountry = iCountryDAO.selectAllCountry();
                request.setAttribute("listCountry", listCountry);

                System.out.println(this.getClass() + " !constraintViolations.isEmpty()");
                request.getRequestDispatcher("/user/create.jsp").forward(request, response);
            } else {
                if (userDAO.selectUserByEmail(email) != null) {
                    flag = false;
                    hashMap.put("email", "Email exits in database");
                    System.out.println(this.getClass() + " Email exits in database");

                }
                if (iCountryDAO.selectCountry(idCountry) == null) {
                    flag = false;
                    hashMap.put("idCountry", "Country value invalid");
                    System.out.println(this.getClass() + " Country invalid");
                }

                if (flag) {
                    // Create user susscess
                    userDAO.insertUser(user);
                    User u = new User();
                    request.setAttribute("user", u);

                    request.getRequestDispatcher("user/create.jsp").forward(request, response);
                } else {
                    // Error : Email exits in database
                    // Error: Country invalid
                    errors = "<ul>";
                    // One more field has error
                    hashMap.forEach(new BiConsumer<String, String>() {
                        @Override
                        public void accept(String keyError, String valueError) {
                            errors += "<li>" + valueError
                                    + "</li>";

                        }
                    });
                    errors += "</ul>";

                    request.setAttribute("user", user);
                    request.setAttribute("errors", errors);


                    System.out.println(this.getClass() + " !constraintViolations.isEmpty()");
                    request.getRequestDispatcher("/user/create.jsp").forward(request, response);
                }


            }
        } catch (NumberFormatException ex) {
            System.out.println(this.getClass() + " NumberFormatException: User info from request: " + user);
            errors = "<ul>";
            errors += "<li>" + "Input format not right"
                    + "</li>";

            errors += "</ul>";


            request.setAttribute("user", user);
            request.setAttribute("errors", errors);

            request.getRequestDispatcher("/user/create.jsp").forward(request, response);
        } catch (Exception ex) {

        }

    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int idCountry = Integer.parseInt(request.getParameter("idCountry"));
//        String passWord = request.getParameter("password");
//        System.out.printf("%d %s %s %d", id,name,email,idCountry);
        User book = new User(id, name, email, idCountry);
        userDAO.updateUser(book);
//
        response.sendRedirect("/user");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);

        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }
}