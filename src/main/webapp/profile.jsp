<%-- 
    Document   : profile
    Created on : 01-Oct-2015, 21:01:14
    Author     : Kimberley
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");%>
        <header>
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        <h3>Welcome back <%out.println(lg.getUsername());%>!</h3>
        </header>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
