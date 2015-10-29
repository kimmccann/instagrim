<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
       <title>Instagrim</title>
        
        <!-- CSS Stylesheets for bootstrap and custom made one -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Stylesheets/Styles.css" />
        
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
                        <li><a href="/InstaKim">Home</a></li>
                    </ul>
                    <ul class ="nav navbar-nav navbar-right">
                        <li><a href="/InstaKim/Upload">Upload</a></li>
                        <li><a href="/InstaKim/Images/majed">Sample Images</a></li>
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
        
        <article>
            <h1>Your Pics</h1>
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
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
        <a href="/InstaKim/Image/<%=p.getSUUID()%>" ><img src="/InstaKim/Thumb/<%=p.getSUUID()%>"></a><br/><%
            }
            }
        %>
        </article>
    </body>
</html>