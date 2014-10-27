<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.InstagrimPJB.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InstagrimPJB</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
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
                <li><a href="/InstagrimPJB/profile/<%=lg.getUsername()%>">Profile</a></li>
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

        <article>
            <h2 style = "text-align:left;">File Upload</h2>
            <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" accept="image/*" name="upfile"><br/>
                <%-- By using the accept keyword, we allow only files with an image type file extension to be uploaded.--%>
                <br/>
                <input type="submit" value="Press"> to upload the file!
            </form>

        </article>
        <footer>
            &COPY; Peter Bennington
        </footer>
    </body>
</html>
