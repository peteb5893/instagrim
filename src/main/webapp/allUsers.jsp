<%-- 
    Document   : allUsers
    Created on : Oct 26, 2014, 7:23:18 PM
    Author     : peterbennington
--%>
<%@page import="java.util.*"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <li><a href="/Instagrim/profile/<%=lg.getUsername()%>">Profile</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
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
            <h1 style = "text-align:left;">All Users</h1>
            <%
                LinkedList<String> allUsers = (LinkedList<String>) request.getAttribute("allUsers");
                if (allUsers == null) {
            %>
            <p>No Profiles found</p>
            <%
            } else {
                Iterator<String> iterator;
                iterator = allUsers.iterator();
                while (iterator.hasNext()) {
                    String p = (String) iterator.next();

            %>

            <p><a href="/Instagrim/Images/<%=p%>"><%=p%>'s Profile</a> </p>

            <%
                    }
                }
            %>

        </article>
        <footer>
            &COPY; Peter Bennington
        </footer>
    </body>
</html>
