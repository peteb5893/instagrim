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
                <li class="nav"><a href="/Instagrim">Home</a></li>
                
            </ul>
        </nav>
       
        <article>
            <h3>Login</h3>
            <%
                String message = (String) request.getAttribute("msg");
                if (message==null)
                {
                     // if message is null, i.e something entered in both fields, do nothing
                } else {
                    out.println(message); // else if not null, print message to screen
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
            <ul>
                <li>&COPY; Andy Cobley</li>
            </ul>
        </footer>
    </body>
</html>
