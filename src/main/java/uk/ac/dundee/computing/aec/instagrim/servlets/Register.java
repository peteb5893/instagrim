/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    Cluster cluster = null;

    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");

        //below is an if statement that will check none of the fields have been left empty
        if (username.equals("") || password.equals("") || email.equals("") || first_name.equals("") || last_name.equals("")) {
            registerError(request, response); // display error message
        }

        if (!username.equals("") && !password.equals("") && !email.equals("") && !first_name.equals("") && !last_name.equals("")) {
            User us = new User();
            us.setCluster(cluster);

            if (us.RegisterUser(username, password, email, first_name, last_name)) {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                request.setAttribute("usernameCreated", username);
                rd.forward(request, response);
            } else {

                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                request.setAttribute("takenUsername", username);
                rd.forward(request, response);
            }
        }
        response.sendRedirect("/Instagrim");
    }

    private void registerError(HttpServletRequest request, HttpServletResponse reponse)
            throws ServletException, IOException {
        String registerErrorMessage = "Error: One or more fields have not been completed. Please try again.";
        RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
        request.setAttribute("msg", registerErrorMessage); // here we set the "msg" attribute to have value of loginErrorMessage
        rd.forward(request, reponse);
    }

}
