<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.InstagrimPJB.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>InstagrimPJB</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>
            <h1>InstagrimPJB ! </h1>
            <h2>Your world in Black and White</h2>
        </header>
        <%  // prints a message to screen telling the user they have successfully logged in
            String message = (String) request.getAttribute("msg");
            if (message != null) {
                out.println("You are logged in as: <b>" + message + "</b>"); // show user logged in
            }

            String usernameCreated = (String) request.getAttribute("usernameCreated");
            if (usernameCreated != null) {
                out.println("The username <b>" + usernameCreated + "</b> has been created.");
            }
        %>

        <article>
            <h3 style ="text-align: left"> Welcome to my Instagrim Project.</h3>
            <p>
                This is a web application with a backend Cassandra database.
            </p>
        </article>
        
        <nav>
            <ul>
                <li><a href="/InstagrimPJB">Home</a></li>
                    <% // this code checks the loggedIn state to determine which navigation links to display.    
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <li><a href="/InstagrimPJB/upload.jsp">Upload</a></li>
                <li><a href="/InstagrimPJB/profile/<%=lg.getUsername()%>">Profile</a></li>
                <li><a href="/InstagrimPJB/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li><a href="/InstagrimPJB/allUsers"> All Users</a></li>
                <li><a href="/InstagrimPJB/Logout"> Logout</a></li>
                    <%}
                    } else {
                    %>
                <li><a href="/InstagrimPJB/register.jsp">Register</a></li>
                <li><a href="/InstagrimPJB/login.jsp">Login</a></li>
                    <%}%>
            </ul>
        </nav>
        <footer>
            &COPY; Peter Bennington
        </footer>
    </body>
</html>
