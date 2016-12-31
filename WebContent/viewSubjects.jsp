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
    <%
    	String name = (String)session.getAttribute("user");
    	if(null==name||name.isEmpty()){
    		response.sendRedirect("AdminLogin.jsp");
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
                   <h1>View Subjects</h1>
                 </div>
           
            <div class="row">
                	<div style="height: 100px"></div>
            </div>
            </div>
            <div class="row">
       			<div class="col-lg-3 col-lg-offset-4">
                        <p style="color:red" id="msgId"></p>
                 </div>
            </div>
            <div class="row">
            	<div class="col-lg-3 col-lg-offset-4">
            		<form action="showSubjects.jsp">	
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
	                          <select class="form-control" id="select_semester" disabled="disabled" name="select_semester">
	                           		<option>--Select Semester--</option>
	                          </select>
                    	</div>
                    	
  						<button class="btn btn-success" type="submit" id="viewSubjectsId">View Subjects</button> 
                         
            		</form>
            		<button class="btn btn-danger" type="button" id="cancel" onclick="goBack()">Back</button>
            	</div>
            </div>
           
		</div>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery/jquery_session.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/bootstrap/js/dataTable.js"></script>
       <!--  <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script> -->
        <script type="text/javascript">
        $(document).ready(function(){
	    	$('#select_course').on('change', function() {
	    		  //alert( this.value ); // or $(this).val()
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
	        window.location.href="admin.jsp";
	    }
        
        (function($){
 		   $('#viewSubjectsId').on('click',function(){
 			   
 			  var course=$('#select_course').val();
 			  var sem=$('#select_semester').val();
 			  if((course=='--Select Course--')||(sem=='--Select Semester--')){
 				  $('#msgId').text('Select course and semester');
 				  return false;
 			  }
		    	  
 		 	});
 		   
 		   $('#cancelId').on('click',function(){
 		   		window.location.href='student.jsp';
 		   });
 		  
 	   })(jQuery);
	    
        </script>
    </body>
</html>