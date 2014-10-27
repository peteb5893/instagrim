<%-- 
    Document   : profile
    Created on : Oct 25, 2014, 12:54:28 PM
    Author     : peterbennington
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.InstagrimPJB.stores.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InstagrimPJB</title>
        <link rel="stylesheet" type="text/css" href="/InstagrimPJB/Styles.css" />
    </head>
    <body>
        <header>
            <h1>InstagrimPJB ! </h1>
            <h2>Your world in Black and White</h2>
        </header>
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

        <article style = "text-align: left;">
            <h1 style = "text-align:left;">Your Profile</h1>
            <ul>
                <li>Username:${Profile.get(0)}</li>
                <li>First Name:${Profile.get(1)}</li>
                <li>Last Name:${Profile.get(2)}</li>
                <li>Email:${Profile.get(3)}</li>
            </ul>
        </article>
        <footer>
            &COPY; Peter Bennington
        </footer>
    </body>
</html>
