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
                <div class="col-lg-3 col-lg-offset-4">
            		<div>
                    	<c:if test="${not empty msg}">
                    	
                        	<p style="color:red" id="msgId">${msg}</p>
                        </c:if>
                        
                    </div>
                  </div>
              </div>
            <div class="row">
                <div class="col-lg-3 col-lg-offset-4">
                   <h1>Student Details</h1>
                   <form method="post" action="RecommenderServlet">
                        <div class="form-group">
	                          <label for="select_course">Select Course:</label>
	                          <select class="form-control" id="select_course" name="select_course">
	                          	<option>--Select Course--</option>
	                            <option>BE</option>
	                            <option>MTech</option> 
	                          </select>
                    	</div>
                        <div class="form-group">
	                          <label for="select_semester">Select Semester:</label>
	                          <select class="form-control" id="select_semester" name="select_semester" disabled="disabled">
	                           		<option>--Select Semester--</option>
	                          </select>
                    	</div>
                        <div class="form-group">
                          <label for="select_interest">Select Interest:</label>
                          <select class="form-control" id="select_interest" name="select_interest">
                          <option>--Select Interest--</option>
                            <option>Analysis</option>
                            <option>Design</option>
                            <option>Logic</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="select_aversion">Select Aversion:</label>
                          <select class="form-control" id="select_aversion" name="select_aversion">
                          	<option>--Select Aversion--</option>
                            <option>Conceptual</option>
                            <option>Code</option>
         
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="select_project_undertaken">Select Project Undertaken:</label>
                          <select class="form-control" id="select_project_undertaken" name="select_project_undertaken">
                          <option>--Select Project Undertaken--</option>
                            <option>Image Processing</option>
                            <option>Web application</option>
                            <option>E-Commerce</option>
                            <option>BigData</option>
                            <option>IoT</option>
                          </select>
                        </div>
                        <button class="btn btn-success" type="submit">Recommend Subject</button> 
                         
                    </form>
                    <button class="btn btn-danger" type="button" id="cancel" onclick="goBack()">Back</button>
                 </div>
            
            </div>
		</div>

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery/jquery_session.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){
	    	$('#select_course').on('change', function() {
	    		  //alert( this.value ); // or $(this).val()
	    		  $('#msgId').text('');
	    			var courseName = this.value;
	    		  	if(courseName=='--Select Course--'){
	    		  		$('#select_semester').empty();
	    		  		
    		  			$('#select_semester').append('<option>--Select Semester--</option>');
	    		  		$('#select_semester').prop('disabled','disabled');
	    		  		
	    		  	}
	    		  	else if(courseName=='BE'){
	    		  		$('#select_semester').empty();
	    		  			var option='';
	    		  			$('#select_semester').prop('disabled', false);
	    		  			option = '<option>--Select Semester--</option>';
	    		  			$('#select_semester').append(option);
	    		  			for(var i=1;i<=8;i++){
	    		  				option = '<option>' + i + '</option>';
	    		  				$('#select_semester').append(option);
	    		  			}
	    		  	}
	    		  	else if(courseName=='MTech'){
	    		  		$('#select_semester').empty();
    		  			$('#select_semester').prop('disabled', false);
    		  			option = '<option>--Select Semester--</option>';
    		  			$('#select_semester').append(option);
    		  			for(var i=1;i<=4;i++){
    		  				var option = '<option>' + i + '</option>';
    		  				$('#select_semester').append(option);
    		  			}
	    		  	}
	    	});
	    	
	    		    });

        function goBack() {
	        window.history.back();
	    }
        </script>
    
	</body>
</html>