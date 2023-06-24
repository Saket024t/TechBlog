
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

        <%@include file="normal_navbar.jsp" %>
        
        <main class="d-flex align-items-center" style="height:135vh">
            <div class="container" style="background-image: url('img/7495.jpg');background-repeat: no-repeat;background-size: 300px 300px;">

                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h3>Register here</h3>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
     
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="Male"> Male
                                    <input type="radio" id="gender" name="gender" value="Female"> Female
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    
                                    <label for="about">About</label>
                                    <textarea name="about" class="form-control" id="about" rows="5" placeholder="Write about your self"></textarea>
                                </div>
                                
                                
                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms and condition</label>
                                </div>
<!--                                <div class="container text-center" id="loader" style="display:none;"> 
                                    <span class="fa  fa-refresh fa-spin fa-3x"> </span>
                                    <h4> Please wait..</h4>
                                </div>
                                <br>-->
                                <button type="submit" class="btn primary-background mt-2">Register</button>
                            </form>
                        </div>
                        
                    </div>
                </div>

            </div>
        </main>



        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"> </script>
        <script>
            $(document).ready(function(){
                console.log("registration page is loaded");
                
                $('#reg-form').on('submit', function(event){
                    event.preventDefault(); //here we stoped the page to go to servlet page 
                    //instead going to servlet page we send the data maually and we will show a
                    //done message on this page using ajax
                    let form = new FormData(this);
                    $.ajax({
                        url:"RegisterServlet" , //servlet page on which we are sending the form data
                        type: 'POST',
                        data: form,
                        success: function(data, textStatus, jqXHR){
                          
                            console.log(data);
                            
                            if(data.trim() === 'done')
                            {
                                swal("registered successfully.. we redirecting to login page")
                                        .then((value)=>{
                                            window.location = "login_page.jsp";
                                });
                            }else{
                                swal(data);
                            }
                            
                            
                            
                           
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            console.log(jqXHR);
                            swal("something went wrong.. try again");
                           
                        },
                        processData:false,
                        contentType:false
                    });
                });
            });
            
            
        </script>
            
            
            
    </body>
</html>
