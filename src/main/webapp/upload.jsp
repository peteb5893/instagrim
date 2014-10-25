<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
    <% // this code checks the loggedIn state to determine which navigation links to display.    
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        String UserName = lg.getUsername();
    %>
        <nav>
            <ul>
                <li><a href="/Instagrim">Home</a></li>
                <li><a href="upload.jsp">Upload</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
            </ul>
        </nav>
 
        <article>
            <h3>File Upload</h3>
            <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" accept="image/*" name="upfile"><br/>
                <%-- By using the accept keyword, we allow only files with an image type file extension to be uploaded.--%>
                <br/>
                <input type="submit" value="Press"> to upload the file!
            </form>

        </article>
        <footer>
            <ul>
                <li>&COPY; Andy Cobley</li>
            </ul>
        </footer>
    </body>
</html>
