<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                	<div style="height:25px"></div>
            </div>
            
             <div class="row">
                <div class="col-lg-3 col-lg-offset-3">
                   <h1>Add Subject</h1>
                 </div>
            <div class="row">
                	<div style="height: 70px"></div>
            </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-lg-offset-4">
                    	<c:if test="${not empty msg}">
                    	
                        	<p style="color:red" id="addSubject_msg">${msg}</p>
                        </c:if>
                </div>        
            </div>
            <div class="row">
            	<div class="col-lg-3 col-lg-offset-4">
            		<form id="addSubjectForm" action="addSubject" method="POST">
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
	                          <label for="select_subject_type">Select Subject Type:</label>
	                          <select class="form-control" id="select_subject_type" name="select_subject_type" disabled="disabled">
	                          	<option>--Select Subject Type--</option>
	                            
	                          </select>
                    	</div>
                    	<div class="form-group">
    						<label for="subject_name">Subject Name:</label>
    						<input type="text" class="form-control" id="subject_name" name="subject_name" placeholder="Enter Subject Name" disabled="disabled"/>
    						
  						</div>
  						<button class="btn btn-success" type="submit">Add Subject</button> 
                         
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
        	    		$('#addSubject_msg').text('');
        	    		  //alert( this.value ); // or $(this).val()
        	    			var courseName = this.value;
        	    		  	if(courseName=='--Select Course--'){
        	    		  		$('#select_semester').empty();
        	    		  		
    	    		  			$('#select_semester').append('<option>--Select Semester--</option>');
        	    		  		$('#select_semester').prop('disabled','disabled');
        	    		  		$('#select_subject_type').empty();
        	    		  		$('#select_subject_type').append('<option>--Select Subject Type--</option>');
        	    		  		$('#select_subject_type').prop('disabled', 'disabled');
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
        	    	
        	    	$('#select_semester').on('change', function() {
        	    		var semester = this.value;
        	    		if(semester=='--Select Semester--'){
        	    			$('#select_subject_type').empty();
        	    			$('#select_subject_type').append('<option>--Select Subject Type--</option>');
        	    			$('#select_subject_type').prop('disabled', 'disabled');
        	    		}
        	    		else{
        	    			$('#select_subject_type').prop('disabled', false);
        	    			
        	    			$('#select_subject_type').append('<option>Analysis</option>');
        	    			$('#select_subject_type').append('<option>Design</option>');
        	    			$('#select_subject_type').append('<option>Logic</option>');
        	    			
        	    		}
        	    	});
        	    	$('#select_subject_type').on('change', function() {
        	    		var subjectType=this.value;
        	    		if(subjectType=='--Select Subject Type--'){
        	    			$('#subject_name').empty();
        	    			$('#subject_name').prop('disabled', 'disabled');
        	    		}
        	    		else{
        	    			$('#subject_name').prop('disabled', false);
        	    		}
        	    	});
        	    });
        	    function goBack() {
        	        window.history.back();
        	    }
        	    
        </script>
    </body>
</html>