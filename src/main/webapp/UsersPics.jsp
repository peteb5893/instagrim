<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.InstagrimPJB.stores.*" %>
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
                <li><a href="/InstagrimPJB/profile/<%=lg.getUsername()%>">Profile</a></li>
                <li><a href="/InstagrimPJB/upload.jsp">Upload</a></li>
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
            <h1 style = "text-align:left;">Pics</h1>
            <%
                LinkedList<Pic> lsPics = (LinkedList<Pic>) request.getAttribute("Pics");
                if (lsPics == null) {
            %>
            <p>No Pictures found</p>
            <%
            } else {
                Iterator<Pic> iterator;
                iterator = lsPics.iterator();
                while (iterator.hasNext()) {
                    Pic p = (Pic) iterator.next();
            %>
            <a href="/InstagrimPJB/Image/<%=p.getSUUID()%>" ><img src="/InstagrimPJB/Thumb/<%=p.getSUUID()%>"></a><br/>
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
