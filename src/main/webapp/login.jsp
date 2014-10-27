<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />

    </head>
    <body>
        <header>
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        </header>
        <nav>
            <ul>
                <li><a href="/Instagrim">Home</a></li>
                <li><a href="/Instagrim/register.jsp">Register</a></li>
            </ul>
        </nav>
       
        <article>
            <h3 style = "text-align:left;">Login</h3>
            <%
                String message = (String) request.getAttribute("msg");
                if (message != null)
                {
                    out.println(message); 
                }
                
                String loginError = (String) request.getAttribute("loginError");
                if (loginError != null)
                {
                    out.println(loginError);
                }
            %>
            <form method="POST"  action="Login">
                <ul>
                    <li>User Name <input type="text" name="username"></li>
                    <li>Password  <input type="password" name="password"></li>
                </ul>
                <br/>
                <input type="submit" value="Login"> 
            </form>

        </article>
        <footer>
            &COPY; Peter Bennington
        </footer>
    </body>
</html>
