<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Management</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/RegisterEmp.js"></script>
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
          <li class="active"><a href="index.jsp">Home</a></li>
          <li><a href="viewEmployee.jsp">View Employee</a></li>
          <li><a href="#">Contact</a></liass=>
          <li><a href="#">About</a></li>
        </ul>
      </nav>

      <div class="content">
        <div class="intro">
          <h4>Manage Your Employee's With NetXs</h4>
          <h1>Track and Mannage Your All Employees</h1>
        </div>
        <div class="register-frm">
          <form id="frm">
            <div class="register">
              <table>
                <legend style="text-align: center;">Register Employee</legend>
                <tr><span id="error" class="error"></span></tr>
                <tr>
                  <td><label for="name">Name&nbsp;<span style="color: red;">*</span></label></td><td><input type="text" name="name" id="name" class="input" placeholder="Employee Name"></td>
                </tr>
                <tr>
                  <td><label for="salary">Salary</label></td><td><input type="text" pattern="\d*" name="salary" id="salary" class="input" placeholder="Salary"  maxlength="5"></td>
                </tr>
                <tr>
                  <td><label for="dob">DOB&nbsp;<span style="color: red;">*</span></label></td><td><input type="date" name="dob" id="dob" class="input" max="2022-12-23"></td>
                </tr>
                <tr>
                  <td><label>Gender&nbsp;<span style="color: red;">*</span></label></td><td><input style="margin: 10px;" type="radio" name="gender" id="gender" value="1"><span>&nbsp;Male&nbsp;&nbsp;&nbsp;</span><input type="radio" name="gender" id="gender" value="2"><span>&nbsp;Female</span></td>
                </tr>
                <tr>
                  <td><label for="address" style="text-align: start;">Address</label></td><td><textarea type="textarea" name="address" id="address" placeholder="Address" class="input" maxlength="150"></textarea></td>
                </tr>
                <tr>
                  <td colspan="2" style="text-align: center;"><button class="btn2">ADD EMPLOYEE</button></td>
                </tr>
              </table>
            </div>
        </form>
        </div>
      </div>
    </div>
    
    <script>
	    $("#frm").on('submit', function(event){
	    	event.preventDefault();
	    	let name = document.getElementById("name").value;
	        let salary = document.getElementById("salary").value;
	        let dob = document.getElementById("dob").value;
	        let gender = $("#gender:checked").val();
	        let address = document.getElementById("address").value;
	        let error = document.getElementById("error");
	     
	        let params = "name="+name+"&salary="+salary+"&dob="+dob+"&gender="+gender+"&address="+address;
	    	$.ajax({
	    		url: "register",
	    		data: params,
	    		type: 'post',
	    		success: function(data, textStatus, jqXHR){
	    			if(data.trim() == "fill"){
	    				error.innerHTML = "Please Fill All Required Fields";
	    				$("#error").css('color','red');
	    				$("#error").css('display','block');
	    				$("#error").css('text-align','center');
	    			}
	    			if(data.trim() == "success"){
	    				error.innerHTML = "Employee Registred Successfully";
	    				$("#error").css('color','green');
	    				$("#error").css('display','block');
	    				$("#error").css('text-align','center');
	    				
	    			}
	    			if(data.trim() == "error"){
	    				error.innerHTML = "Some error occured try again";
	    				$("#error").css('color','red');
	    				$("#error").css('display','block');
	    				$("#error").css('text-align','center');
	    			}
	    		}
	    	})
	    })
    </script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
