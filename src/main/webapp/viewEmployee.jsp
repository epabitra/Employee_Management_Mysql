<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>View Employees</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="assets/css/viewEmp.css">
    <script src="assets/js/ViewEmp.js"></script>
    <script
	  src="https://code.jquery.com/jquery-3.6.0.js"
	  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	  crossorigin="anonymous">
  	</script>
  </head>
<body>
	<div class="container1">
      <nav>
        <h1 class="logo">Net<span style="color: red;">X</span>s</h1>
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li class="active"><a href="viewEmployee.jsp">View Employee</a></li>
          <li><a href="#">Contact</a></liass=>
          <li><a href="#">About</a></li>
        </ul>
      </nav>
      
      <h1>All Employees List</h1>
      <div class="msg">
      	<span id="msg"></span>
      </div>
      <div class="empListTableContainer">
        <table id="empList">
          <tr><th>Employee Id</th><th>Name</th><th>Gender</th></tr>
        </table>
      </div>
    </div>
    
    <script>
    	loadList();
	    function loadList(){
			// Load Employee List
		    $.ajax({
		    	url: 'emplist',
		    	type: 'post',
		    	success: function(data, textStatus, jqXHR){
		        	empList.innerHTML = data;
		    	},
		    	error: function(data, textStatus, errorThrown){
		    		console.log("error occure");
		    	}
		    })
		}
	    
	    function submit(btn){
	    	let flag = confirm("Are you sure you want to delete employee?");
	    	
	    	if(flag){
		    	let param = "employeeid="+btn.value;
		    	let msg = document.getElementById("msg");
		    	
		    	$.ajax({
		    		url: "deleteemp",
		    		data: param,
		    		type: 'post',
		    		success: function(data, textStatus, jqXHR){
		    			if(data.trim()=="deleted"){
		    				msg.innerHTML = "Employee Deleted Successfully";
		    				$("#msg").css('color','green');
		    				$("#msg").css('display','block');
		    				setTimeout(() => {$("#msg").css('display','none');}, 5000);
		    				loadList();
		    			}
		    			if(data.trim()=="error"){
		    				msg.innerHTML = "Some Error Occured Try Again";
		    				$("#msg").css('color','red');
		    				$("#msg").css('display','block');
		    				setTimeout(() => {$("#msg").css('display','none');}, 5000);
		    			}
		    		}
		    	})
	    	}
	    }
    </script>
</body>
</html>