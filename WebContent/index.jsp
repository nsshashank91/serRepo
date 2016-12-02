<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
		%>
        <title>Home</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="vendor/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
    </head>
    <body>
    
        <div class="container-fluid">
            <div class="row">
                
                     <div class="col-lg-8 col-lg-offset-3">
                        <h1 style="">Student Elective Recommender System</h1> 
                    </div>
                
               </div> 
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                        <ul class="nav nav-pills nav-justified">
                            <li class="active"><a href="index.jsp">Home</a></li>
                            <li><a href="student.jsp">Student</a></li>
                            <li><a href="admin.jsp">Admin</a></li> 
                        </ul>
                </div>
            </div>
            <div class="row">
                <div style="height:100px"></div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-lg-offset-5">
                   <h1>Welcome!</h1>
                 </div>
            
            </div>

		</div>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery/jquery_session.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>


    </body>
</html>