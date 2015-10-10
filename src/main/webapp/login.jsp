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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        
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
        
	<div class="form">
            <div class="form-box">
                <div class="logo">Login</div>
                <form method="POST" action="Login">
                    <div class="input-spacing">
                        <input type="text" name="username" placeholder="username">
                    </div>

                    <div class="input-spacing">
                        <input type="password" name="password" placeholder="password">
                    </div>

                    <input type="submit" value="Login" class="btn btn-primary btn-large">
                </form>
            </div>
	</div>

    </body>
</html>
