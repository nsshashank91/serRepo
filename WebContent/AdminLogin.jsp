<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
            <%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
		%>
        <title>Admin</title>
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
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="student.jsp">Student</a></li>
                            <li class="active"><a href="admin.jsp">Admin</a></li> 
                        </ul>
                </div>
            </div>
            <div class="row">
                <div style="height: 50px"></div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-lg-offset-4">
                    <h2>Login</h2>
                    <div>
                    	<c:if test="${not empty error}">
                    	
                        	<p style="color:red" id="login_error">Invalid Credentials</p>
                        </c:if>
                        
                    </div>
                    <form method="post" action="loginServlet">
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" name="username" id="username" class="form-control" />
                            
                        </div>  
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" name="password" id="password" class="form-control" />

                        </div> 
                        <button class="btn btn-success" type="submit" id="login">Login</button> 
                    </form>
                </div>
            </div>
            
        </div>


        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery/jquery_session.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                
            });
            
        </script>

    </body>
</html>