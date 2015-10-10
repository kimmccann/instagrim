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
                <div class="logo">Register as user</div>
                <form method="POST"  action="Register">
                    <div class="input-spacing">
                        <input type="text" name="firstname" placeholder="First name">
                    </div>
                    <div class="input-spacing">
                        <input type="text" name="surname" placeholder="Surname">
                    </div>
                    <div class="input-spacing">
                        <input type="email" name="email address" placeholder="Email Address">
                    </div>
                    <div class="input-spacing">
                        <input type="text" name="username" placeholder="Username">
                    </div>
                    <div class="input-spacing">
                        <input type="password" name="password" placeholder="Password">
                    </div>
                    <input type="submit" value="Register" class="btn btn-primary btn-large">
                </form>
            </div>
        </div>
        
    </body>
</html>
