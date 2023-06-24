
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! something went wrong</title>
        
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
    <body>
        <div class="container text-center" >
            <img src="img/error.png" class="img-fluid w-25"> 
            <h3 class="display-3">Sorry! Something went wrong</h3>
            <%= exception %>
            <br>
            <a href="index.jsp" class=" btn btn-lg primary-background text-white mt-3" >Home</a>
        </div>
    </body>
</html>
