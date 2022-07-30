<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="style.css" rel="stylesheet" />
<style>
table, th, td {
  border:1px solid black;
}
</style>
<body>
<div class="topnav" id="myTopnav">
  <a href="dashboard.jsp" class="active">Driveways </a>
  <a href="carid.jsp">Add Vehicle info</a>
  <a href="checkout.jsp">Add payment detail</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
	<form>
    <h5>Search:</h5>
    <input type='text'/>
    </form>
	
	<!--User Table-->
	<table style="width:100%">
	  <tr>
	  	<th>Owner Name</th>
	    <th>Location</th>
	    <th>Availability</th>
	    <th>Time Available</th>
	    <th>Image</th>
	  </tr>
	</table>
	
	<a href="dashboard.jsp"><button>Back</button></a>
		
	<!--Java Script-->
	<script>
	
	</script>
</body>
</html>