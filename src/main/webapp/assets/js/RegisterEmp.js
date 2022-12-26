/*
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>
$(".frm").on('submit', function(event){
	event.preventDefault();
	let name = document.getElementById("name").value;
    let salary = document.getElementById("salary").value;
    let dob = document.getElementById("dob").value;
    let gender = document.getElementById("gender").value;
    let address = document.getElementById("address").value;
    let error = document.getElementById("error");
 
    let params = "name="+name+"&salary="+salary+"&dob="+dob+"&gender="+gender+"&address="+address;
	$.ajax({
		url: "http://localhost:7777/Employee_Management/register",
		data: params,
		type: 'post',
		success: function(data, textStatus, jqXHR){
			if(data.trim == "fill"){
				error.innerHTML = "Please Fill All Required Fields";
			}
		}
	})
})*/