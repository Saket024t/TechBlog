<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="error_page.jsp" %>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>
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

        <!--nav bar start-->

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
                    <li class="nav-item">
                        <a class="nav-link text-white" href="my_post.jsp?userId=<%= user.getId() %>">My Post</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white"  href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            All Post
                        </a>
                        
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            
                            <a href="#" class="dropdown-item " onclick="getPost(0)">All Posts</a>
                            
                            <% PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for(Category cc : list1){
                            
                            %>
                            <a href="#" onclick="getPost(<%=cc.getCid()%>)" class="dropdown-item"><%= cc.getName() %></a>
                            <%
                                }
                            %>
                            
<!--                            <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>-->
<!--                            <div class="dropdown-divider"></div>-->
<!--                            <a class="dropdown-item" href="#">Something else here</a>-->
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#!" data-toggle="modal" data-target="#add-post-modal">Do post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">

                        <a class="nav-link text-white" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--nav bar end-->
        
        
        <main>
            <div class="container">
                <div class="row mt-0">
                    <div class="col-md-1"></div>
                    
                    
                    <div class="col-md-10" ">
                        
                        <div class="container text-center" id="loader" >
                            <i class="fa fa-refresh fa-4x fa-spin"> </i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        
                        <div class="container-fluid" id="post-container" >
                            
                        </div>
                        
                        
                    </div>
                    <div class="col-md-1"></div>
                </div>
                
            </div>
        </main>


        <% Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>   

        <div class="alert <%=m.getCssClass()%>" role="alert" >
            <%= m.getContent()%>
        </div>


        <%
                session.removeAttribute("msg");
            }
        %>



        <!-- Profile Modal start -->

        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background">
                        <h6 class="modal-title text-white" id="exampleModalLabel">TechBlog </h6>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="text-white">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center" >
                            <img src="pics/<%= user.getProfile()%>" style="border-radius:50%;max-width: 120px;">
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--profile-detail-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>


                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About:</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%= user.getDateTime()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile-update-->
                            <div id="profile-edit" style="display:none;">
                                <h4 class="mt-2">Please edit carefully </h4>
                                <form action="EditServlet" method="post" enctype="multipart/form-data" >
                                    <table class="table">
                                        <tr>
                                            <td>Name:</td>
                                            <td><input type="text" class="form-control form-control-sm" name="user_name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input type="Email" class="form-control form-control-sm" name="user_email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input type="text" class="form-control form-control-sm" name="user_password" value="<%= user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>About:</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about">
                                                    <%= user.getAbout()%> 
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Profile:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control" >
                                            </td>

                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button class="btn primary-background text-white" type="submit" >Save</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn primary-background text-white" data-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-button" class="btn primary-background text-white">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Profile Modal end -->

        <!--Post Modal start-->

        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background ">
                        <h5 class="modal-title text-white" id="exampleModalLabel">Post</h5>
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="text-white">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---select category---</option>
                                    <% PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"> <%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="write the post Title" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                                <textarea name="pContent" class="form-control" style="height:200px" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group"> 
                                <textarea name="pCode" class="form-control" style="height:200px" placeholder="Enter your code(if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="img-for-post" >Select image(if any)</label>
                                <br>
                                <input name="pic" type="file" class="form-control " id="img-for-post"> 
                            </div>

                            <div class="container text-center">
                                <button class="btn primary-background text-white" type="submit">Post</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn primary-background text-white" data-dismiss="modal">Close</button>
                        
                    </div>
                </div>
            </div>
        </div>

        <!--Post Modal end-->


        <!-- JavaScript -->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"> </script>

        <!--javascript for edit inside profile-->

        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function () {
                    if (editStatus === false)
                    {
                        $("#profile-details").hide();
                        $("#profile-edit").show();

                        editStatus = true;
                        $(this).text("Back");
                    } else
                    {
                        $("#profile-edit").hide();
                        $("#profile-details").show();


                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
            });

        </script>

        <!--Javascript for post-->

        <script>
            $(document).ready(function (e) {

                $("#add-post-form").on('submit', function (event) {

                    event.preventDefault();
                    console.log("dk");
                    let form = new FormData(this);

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success..
                            console.log(data);
                            if(data.trim() == 'done')
                            {
                                swal("Good job!", "save successfully", "success");
                            }
                            else
                            {
                                swal("Error!", "Something went wrong", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("Error!", "Something went wrong", "error");
                        },
                        processData: false,
                        contentType: false

                    });


                });
            });
        </script>
        
        
        <!--Loading Post using ajax-->
        <script>
            
            function getPost( catId){
                $.ajax({
                    
                    url:"load_post.jsp",
                    data:{cid:catId},
                    success: function(data, textStatus, errorThrown){
                        
                        $("#loader").hide();
                        $("#post-container").html(data);
                    }
                });
            }
            $(document).ready(function(e){
                
                getPost(0);
            });
        </script>


    </body>
</html>
