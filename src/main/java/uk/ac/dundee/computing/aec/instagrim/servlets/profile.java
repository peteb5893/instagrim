package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.lib.Convertors;
import uk.ac.dundee.computing.aec.instagrim.models.User;

/**
 *
 * @author peterbennington
 */
@WebServlet(urlPatterns = {
    "/profile",
    "/profile/*"
})

public class profile extends HttpServlet {

    private Cluster cluster;
    private HashMap CommandsMap = new HashMap();
    
    //these are the constructors for the class
    public profile() {
        CommandsMap.put("profile", 1);
    }
    
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet profile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String args[] = Convertors.SplitRequestPath(request);
        int command;
        try {
            command = (Integer) CommandsMap.get(args[1]);
        } catch (Exception et) {
            error("Bad Operator", response);
            return;
        }
        switch (command) {
            case 1:
                DisplayProfile(args[2], request, response);
                break;
            case 2:
                DisplayProfileList(args[2], request, response);
                break;
            default:
                error("Bad Operator", response);
        }
    }

    private void DisplayProfile(String username,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    User us = new User();
    us.setCluster(cluster);
    
    java.util.LinkedList<String> Profile = us.getProfileForUser(username);
    RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
    request.setAttribute("Profile", Profile);
    rd.forward(request, response);
    }

    private void DisplayProfileList(String arg, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    }
    
    //@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    //@Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void error(String bad_Operator, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
