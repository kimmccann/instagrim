<%-- 
    Document   : profile
    Created on : 01-Oct-2015, 21:01:14
    Author     : Kimberley
--%>
<!--imports-->
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
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
        <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
           Profile user = (Profile) session.getAttribute("Profile");%>
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
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="jumbotron">
            <div class="container">
                <h1>Instagrim</h1>
                <p>Your world in Black and White</p>
                <p>Welcome back <%out.println(user.getFirstName() + " " + user.getSecondName());%>!</p>
            </div>
        </div>
           
        <div class="container">
        <!--Profile picture to be displayed here--> 
        <h1>Profile Picture:</h1>
        <a href="/InstaKim/Image/<%=user.getProfilePicture()%>" ><img src="/InstaKim/Thumb/<%=user.getProfilePicture()%>"></a><br/>
        <p> User: <%=user.getFirstName() + user.getSecondName()%> </p>
        <p> Gender: <%=user.getGender()%></p>
        <p> Date of Birth: <%=user.getDateOfBirth()%></p>
        </div>
        
        <div class="container">
            
            <h1>Your Pics</h1>
            <%
                java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                java.util.ArrayList<java.util.ArrayList<Comment>> Comment = (java.util.ArrayList<java.util.ArrayList<Comment>>) request.getAttribute("comments");
                if (lsPics == null) {
            %>
            <p>No Pictures found</p>
            <%
            } else {
                    for (int i = 0; i < lsPics.size(); i++ ){
                      Pic p = lsPics.get(i);        
                      java.util.ArrayList<Comment> c = Comment.get(i);
            %>
                <div class="image-spacing">
                    <a href="/InstaKim/Image/<%=p.getSUUID()%>" ><img src="/InstaKim/Thumb/<%=p.getSUUID()%>"></a><br/>
                    <h4>Comments:</h4>
                    
                </div>
            <%
                    for (int j = 0; j < c.size(); j++){
                    Comment com = c.get(j);
            %>
            <div class="image-spacing">
                <p>User: <%=com.getUser()%></p>
                <p>Comment: <%=com.getComment()%></p>
            </div>
            <%
                    }
                    UUID pic_id = p.getUUID();
            %>
                <a href="/InstaKim/Comment/Id=<%=p.getSUUID()%>">To submit a comment on this picture click here</a>
                <%
                    System.out.println("prof id: " + pic_id);
                    session.setAttribute("pId", pic_id);
            
                    }
             }
            %>
        </div>
    </body>
</html>