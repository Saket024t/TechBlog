<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<% PostDao d = new PostDao(ConnectionProvider.getConnection());
   UserDao u = new UserDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    if(cid==0)
    {
        posts = d.getAllPost();
    }
    else
    {
        posts = d.getPostByCatId(cid);
    }
    
    for (Post p : posts) {
    
    User user = u.getUserById(p.getUserId());
    

%>

<div class="card container-fluid d-flex justify-content-center mt-3 border border-secondary bg-color" style="max-width: 40rem;">
    <div class="container-fluid">
        <div class="row mt-2">
            <div class="col-1 px-2"><img src="pics/<%= user.getProfile() %>" class=" rounded-circle"  style="width:30px"></div>
            <div class="col-5 mt-3 px-1"><h6 class="card-subtitle mb-2 text-muted"><a href="friends_profile.jsp?userId=<%= user.getId() %>"  ><%= user.getName() %></a></h6></div>
        </div>
        <h5 class="card-title mt-1"><%= p.getpTitle() %></h5>
    </div>   

    <ul class="list-group list-group-flush">
        <li class="list-group-item bg-color">
            
            <div class="container-fluid d-flex justify-content-center">
                <img class="card-img-top text-center " src="blog_pics/<%= p.getpPic() %>" style="max-width:50%;margin: 0 auto;" alt="Card image cap">
            </div>
            
        </li>
        <li class="list-group-item bg-color"><div class="card-body py-0">
                <p class="card-text"><%= p.getpContent() %></p>
            </div>
        </li>
        <li class="list-group-item bg-color"><div class="card-body py-0">
                <pre class="card-text "><%= p.getpCode() %></pre>
            </div>
        </li>
    </ul>

    <div class="row mt-2 bg-color">
            <div class="col-2 mt-1"><h6 class="card-subtitle mb-2 text-muted"> like </h6></div>
            <div class="col-3 mt-1"><h6 class="card-subtitle mb-2 text-muted"> dislike </h6></div>
            <div class="col-3 mt-1"><h6 class="card-subtitle mb-2 text-muted"> comment </h6></div>
            <!--<div class="col-5 mt-3 px-1"><h6 class="card-subtitle mb-2 text-muted"> Saket kadu </h6></div>-->
    </div>
</div>


<%    }
%>



<!--<img class="card-img-top" src="" alt="Card image cap">-->
<!-- <h5 class="card-title"></h5>
    <p class="card-text"></p>
    <p class="card-text"</p>-->
<!--<a href="#" class="btn btn-primary">Go somewhere</a>-->





