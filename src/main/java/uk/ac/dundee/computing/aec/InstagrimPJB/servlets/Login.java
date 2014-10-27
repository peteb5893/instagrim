/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.InstagrimPJB.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.InstagrimPJB.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.InstagrimPJB.models.User;
import uk.ac.dundee.computing.aec.InstagrimPJB.stores.LoggedIn;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    Cluster cluster=null;


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
        
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        
        //below is an if statement that will check the user has not left either username or password blank
        if (username.equals("")||password.equals(""))
        {
            loginError(request ,response); // display error message
        }
        
        User us=new User();
        us.setCluster(cluster);
        boolean isValid=us.IsValidUser(username, password);
        HttpSession session=request.getSession();
        System.out.println("Session in servlet "+session);
        if (isValid){
            LoggedIn lg= new LoggedIn();
            lg.setLogedin();
            lg.setUsername(username);
            session.setAttribute("LoggedIn", lg);
            System.out.println("Session in servlet "+session);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            request.setAttribute("msg", username); //this should pass the username entered to index.jsp and allow it to print to screen.
            rd.forward(request, response);
        }else{
            loginError(request,response);
            //String loginError = "Error: Incorrect Username or Password.";
            //RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            //request.setAttribute("loginError", loginError); //this should pass the username entered to login.jsp and allow it to print to screen.
            //rd.forward(request, response);
            response.sendRedirect("/InstagrimPJB/login.jsp");
        }
        
    }


    //method that shows an error message on the login page when username or password is entered incorrectly or left blank
private void loginError(HttpServletRequest request, HttpServletResponse reponse)
        throws ServletException, IOException {
    String loginError = "Error: Username or Password have not been entered. Please try again.";
    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    request.setAttribute("loginError",loginError); // here we set the "msg" attribute to have value of loginErrorMessage
    rd.forward(request, reponse);
}
}
