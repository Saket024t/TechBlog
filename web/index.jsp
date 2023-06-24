
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 84% 95%, 68% 100%, 50% 95%, 32% 100%, 16% 95%, 0 100%, 0 0);
            }
        </style>
    </head>

    <body >

        <%@include file="normal_navbar.jsp" %>

        <div class="container-fluid p-0 m-0   ">
            <div class="jumbotron  banner-background ">
                <div class="container text-center  " >
                    <h3>
                        Welcome, to TechBlog <span class="fa fa-comments-o"></span>
                    </h3>
                    <p>Share your tech knowledge with your friends. </p>
                    <p>Techblog is platform where you can gain and share tech knowledge with your friends by sharing technical posts.
                    </p>
                    <a href="register_page.jsp" class="btn-light btn"> Get Started</a>
                    <a href="login_page.jsp" class="btn-light btn"> Login</a>
                </div>
            </div>

        </div>
        <!--cards-->
        


        <footer>
            <div class="container-fluid primary-background text-center  p-2">
                <p class="mt-1 text-muted text-white">&copy; 2023 TechBlog. All rights reserved.</p>
            </div>
        </footer>


        <!-- JavaScript -->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>







    </body>


</html>
