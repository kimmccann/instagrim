<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        
        <!-- CSS Stylesheets for bootstrap and custom made one -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/Instagrim/Stylesheets/Styles.css" />
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- JavaScript for bootstrap -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>
        
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Responsive navbar with toggle navigation -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand"></a>
                </div>
                
                <!--Navbar links depending on if logged in or not -->
                <div class="collapse navbar-collapse">
                    <ul class = "nav navbar-nav"> 
                        <li><a href="/Instagrim">Home</a></li>
                    </ul>
                    <ul class ="nav navbar-nav navbar-right">
                        <li><a href="register.jsp">Register</a></li>
                        <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
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
