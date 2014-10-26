<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
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
            </ul>
        </nav>
       
        <article>
            <h3>Register as user</h3>
            <%
                String message = (String) request.getAttribute("msg");
                if (message!=null)
                {
                    out.println(message);
                }
                
                String takenUsername = (String) request.getAttribute("takenUsername");
                if (takenUsername!=null)
                {
                    out.println("The username <b>"+takenUsername+"</b> is already taken. Try again.");
                }    
            %>
            
            <form method="POST"  action="Register">
                <ul>
                    <li>User Name <input type="text" name="username"></li>
                    <li>Password <input type="password" name="password"></li>
                    <li>Email <input type="text" name="email"</li>
                    <li>First Name <input type="text" name="first_name" </li>
                    <li>Last Name <input type="text" name="last_name" </li>
                    
                </ul>
                <br/>
                <input type="submit" value="Register"> 
            </form>

        </article>
        <footer>
            <ul>
                <li>&COPY; Andy Cobley</li>
            </ul>
        </footer>
    </body>
</html>
