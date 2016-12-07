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
        <title>Home</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="vendor/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
        <link href="vendor/bootstrap/css/dataTable.css" rel="stylesheet"/>
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
                            <li class="active"><a href="student.jsp">Student</a></li>
                            <li><a href="admin.jsp">Admin</a></li> 
                        </ul>
                </div>
            </div>
            <div class="row">
                <div style="height: 50px"></div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                	<h2><i>Recommended Subject is</i> <b>${subject}</b></h2>	
                 </div>
            </div>
             <div class="row">
                <div style="height: 50px"></div>
            </div>
       
            
            <form action="FeedBackServlet" method="POST">
            <div class="row">
                <div class="col-lg-3 col-lg-offset-4">
            	        <div class="form-group">
	                          <label for="select_feedback">Select Feedback:</label>
	                          <select class="form-control" id="select_feedback" name="select_feedback">
	                          	<option>--Select Feedback--</option>
	                            <option value="5">Awesome!!</option>
	                            <option value="4">Good!</option>
	                            <option value="3">OK..</option>
	                            <option value="2">Bad!</option>
	                            <option value="1">Forget It..!!</option>  
	                          </select>
	                          <input type="hidden" name="semester" value="${semester}" />
	                          <input type="hidden" name="course" value="${course}" />
	                          <input type="hidden" name="subject" value="${subject}" />
                    	</div>
                    	<button class="btn btn-success" type="submit" id="Submit">Submit Feedback</button>
                    </div>
                 </div>
                 
            </form>
             <div class="row">
                <div style="height: 20px"></div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-lg-offset-4">
             		<button class="btn btn-danger" type="button" id="cancel" onclick="goBack()">Back</button>
             	</div>
             </div>
         </div>
         <script type="text/javascript">
	 	    function goBack() {
		        window.history.back();
		    }
         </script>
	</body>
</html>