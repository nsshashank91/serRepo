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
                   <h1>View Subjects</h1>
                 </div>
	            <div class="row">
	                	<div style="height: 100px"></div>
	            </div>
            </div>
            <div class="row">
            	 <div class="col-lg-6 col-lg-offset-3">
	            	<table id="viewSubjectsId">
	            	<thead>
	            		<tr>
	            			<th>Course Name</th>
			                <th>Semester</th>
			                <th>Subject Type</th>
			                <th>Subject Name</th>
			                
	            		</tr>
	            	</thead>
	            	
	            	</table>
	            	
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
        	$.urlParam = function(name){
        		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
        		return results[1] || 0;
        	}
	        var courseName = 	decodeURIComponent($.urlParam('select_course'));
	        var semester = 	decodeURIComponent($.urlParam('select_semester'));
	        
	        	$('#viewSubjectsId').DataTable({
	        		
	        			"ajax": {
	        	            "url": "showSubjectServlet?course="+courseName+"&semester="+semester,
	        	            "dataSrc": ""
	        	        },
	        	        "columns": [
	        	            { "data": "courseName" },
	        	            { "data": "semester" },
	        	            { "data": "subjectType" },
	        	            { "data": "subjectName" }
	        	            
	        	        ]
	        	});
        	});
        	/* $('#viewSubjects').on('click', function() {
	    		//alert("view button click");
	    		$.ajax({
	                type: "GET",
	                url: "showSubjectServlet",
	                //data: {jsonData: JSON.stringify(myData)},
	                dataType: "json",

	                //if received a response from the server
	                success: function (data) {
	                    //our country code was correct so we have some information to display

	                        var json = JSON.parse(data);        
	                        //alert(json["resultText"]);        
	                       document.getElementById('number1').value = data.        
	                }
	            });
        	});

	    
	    	
	    });*/
	    function goBack() {
	        window.history.back();
	    }
	    
        </script>
    </body>
</html>