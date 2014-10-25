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
        
        <%  //this code checks the loggedIn state to determine which navigation links to display.    
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            String UserName = lg.getUsername();
        %>
        <nav>
            <ul>
                <li><a href="/Instagrim">Home</a></li>
                <li><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li><a href="/Instagrim/Logout"> Logout</a></li>
            </ul>
        </nav>
        
        <article>
            <h1>Your Profile</h1>
        
            <%--potentially have a user profile photo here--%>
            
            <ul>
                <li>Username: ${Profile.get(0)}</li>
                <li>First Name: ${Profile.get(1)}</li>
                <li>Last Name: ${Profile.get(2)}</li>
                <li>Email: ${Profile.get(3)}</li>
            </ul>
  
        </article>
        <footer>
            <ul>
                <li>&COPY; Andy Cobley</li>
            </ul>
        </footer>
    </body>
</html>
