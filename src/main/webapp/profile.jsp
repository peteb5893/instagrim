<%-- 
    Document   : profile
    Created on : Oct 25, 2014, 12:54:28 PM
    Author     : peterbennington
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
        <header>
            <h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>
        </header>
        <nav>
            <ul>
                <li><a href="/Instagrim">Home</a></li>
                    <% // this code checks the loggedIn state to determine which navigation links to display.    
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <li><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li><a href="/Instagrim/allUsers"> All Users</a></li>
                <li><a href="/Instagrim/Logout"> Logout</a></li>
                    <%}
                    } else {
                    %>
                <li><a href="/Instagrim/register.jsp">Register</a></li>
                <li><a href="/Instagrim/login.jsp">Login</a></li>
                    <%}%>
            </ul>
        </nav>

        <article>
            <h1>Your Profile</h1>
            <ul>
                <li>Username: ${Profile.get(0)}</li>
                <li>First Name: ${Profile.get(1)}</li>
                <li>Last Name: ${Profile.get(2)}</li>
                <li>Email: ${Profile.get(3)}</li>
            </ul>
        </article>
        <footer>
            &COPY; Peter Bennington
        </footer>
    </body>
</html>
