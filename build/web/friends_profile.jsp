<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 84% 95%, 68% 100%, 50% 95%, 32% 100%, 16% 95%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>

        <!--Navbar-->
        
        <% PostDao d = new PostDao(ConnectionProvider.getConnection());
            UserDao u = new UserDao(ConnectionProvider.getConnection());
            int uid = Integer.parseInt(request.getParameter("userId"));
            
            User user = u.getUserById(uid);
            List<Post> posts = d.getPostByUserId(uid);
        %>
        

        <nav class="navbar navbar-expand-lg navbar-light primary-background">
            <a class="navbar-brand text-white" href="index.jsp"><span class="fa fa-comments-o text-white"> </span> TechBlog </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
<!--                    <li class="nav-item">
                        <a class="nav-link text-white" href="profile.jsp">Back</a>
                    </li>-->



                </ul>
                <ul class="navbar-nav mr-right">
<!--                    <li class="nav-item">

                        <a class="nav-link text-white" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%> </a>
                    </li>-->
                    <li class="nav-item">
                        <a class="nav-link text-white " href="profile.jsp">Back</a>
                    </li>
                </ul>
            </div>
        </nav>


  
        
        <div class="container mt-4 border-top border-dark border-bottom">
            <h3 class="display-4"> Profile</h3>
        </div>
        <!--#46446e-->

        <div class="container-fluid text-center" ">
            <div class=" m-3">
                <img src="pics/<%= user.getProfile()%>" class=" rounded-circle m-2"  style=";max-width: 120px;">
            </div>
            <div class=" text-center m-4  " style="border-radius:2%">
                <table class="table  d-flex justify-content-around px-5">

                    <tbody class="px-3 border border-light text-white " style="border-radius:4%; background-color:#3e3d53">
                        <tr>
                            <th scope="row">Name:</th>
                            <td><%= user.getName() %></td>

                        </tr>
                        <tr>
                            <th scope="row">Email:</th>
                            <td><%= user.getEmail()%></td>

                        </tr>
                        <tr>
                            <th scope="row">About:</th>
                            <td><%= user.getAbout() %></td>            
                        </tr>
                        <tr>
                            <th scope="row">Total post:</th>
                            <td class="pl-0"><%= posts.size() %></td>            
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="container  border-top border-dark border-bottom">
            <h3 class="display-4"> Post</h3>
        </div>

      
        
        <%
            for (Post p : posts) {
        %>

        <div class="card container-fluid d-flex justify-content-center mt-3 bg-color" style="max-width: 40rem;">
            <div class="container-fluid">
                <div class="row mt-2" >
                    <div class="col-1 px-2"><img src="pics/<%= user.getProfile()%>" class=" rounded-circle"  style="width:30px"></div>
                    <div class="col-5 mt-3 px-1"><h6 class="card-subtitle mb-2 text-muted"><a href="friends_profile.jsp"><%= user.getName()%></a></h6></div>
                </div>
                <h5 class="card-title mt-1"><%= p.getpTitle()%></h5>
            </div>   

            <ul class="list-group list-group-flush">
                <li class="list-group-item bg-color">

                    <div class="container-fluid d-flex justify-content-center">
                        <img class="card-img-top text-center " src="blog_pics/<%= p.getpPic()%>" style="max-width:50%;margin: 0 auto;" alt="Card image cap">
                    </div>

                </li>
                <li class="list-group-item bg-color"><div class="card-body py-0">
                        <p class="card-text"><%= p.getpContent()%></p>
                    </div>
                </li>
                <li class="list-group-item bg-color"><div class="card-body py-0">
                        <pre class="card-text "><%= p.getpCode()%></pre>
                    </div>
                </li>
            </ul>

            <div class="row mt-2">
                <div class="col-2 mt-1"><h6 class="card-subtitle mb-2 text-muted"> like </h6></div>
                <div class="col-3 mt-1"><h6 class="card-subtitle mb-2 text-muted"> dislike </h6></div>
                <div class="col-3 mt-1"><h6 class="card-subtitle mb-2 text-muted"> comment </h6></div>
                <!--<div class="col-5 mt-3 px-1"><h6 class="card-subtitle mb-2 text-muted"> Saket kadu </h6></div>-->
            </div>
        </div>


        <%    }
        %>













        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    </body>
</html>
