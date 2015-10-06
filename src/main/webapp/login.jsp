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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

    </head>
    <body>
        <div class="nav">
            <div class="container">
                <ul class = "pull-left"> 
                    <li><a href="/Instagrim">Home</a></li>
                </ul>
                <ul class ="pull-right">
                    <li><a href="register.jsp">Register</a></li>
                    <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
                </ul>
            </div>
        </div>
        <div class="jumbotron">
            <div class="container">
                <h1>Instagrim</h1>
                <p>Your world in Black and White</p>
             </div>
        </div> 
       
        <article>
            <h3>Login</h3>
            <form method="POST"  action="Login">
                <ul>
                    <li>User Name <input type="text" name="username"></li>
                    <li>Password <input type="password" name="password"></li>
                </ul>
                <br/>
                <input type="submit" value="Login"> 
            </form>

        </article>
    </body>
</html>
