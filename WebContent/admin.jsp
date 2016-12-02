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
    <%
    	String name = (String)session.getAttribute("user");
    	if(null==name||name.isEmpty()){
    		response.sendRedirect("/SERS/AdminLogin.jsp");
    	}
    %>
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
                            <li class="active" id="logout"><a href="logoutServlet">Logout</a></li> 
                        </ul>
                </div>
            </div>
            <div class="row">
                	<div style="height:70px"></div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-lg-offset-3">
                   <h1>Welcome Admin!</h1>
                 </div>
            
            </div>
            <div class="row">
                	<div style="height:70px"></div>
            </div>
            <div class="row">
            	<div class="col-xs-offset-5">
            		<div class="btn btn-success" id="view_sub">View Subjects</div>
            	</div>
            </div>
            <div class="row">
                	<div style="height:30px"></div>
            </div>
			<div class="row">
				<div class="col-xs-offset-5">
            		<div class="btn btn-danger" id="add_sub">Add Subject</div>
            	</div>
            </div>
		</div>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery/jquery_session.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
        	$(document).ready(function(){
        		$("#view_sub").click(function(){
        			window.location.href="viewSubjects.jsp";
        		});
        		$("#add_sub").click(function(){
        			window.location.href="addSubject.jsp";
        		});
        	});
        </script>
    </body>
</html>