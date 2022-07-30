<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="style.css" rel="stylesheet" />
<body>
	<h2>Enter Parking Details<h2>
	<hr>
	<h3 id = "location">Location: </h3>
	<h3 id = "time">Time available: </h3>
	<h3 id = "noOfSpots">Parking spots available </h3>
	<h3 id = "cost">Parking Cost/Hour: </h3>
	<h3>Upload the driveway picture</h3>
    <form action="/action_page.php">
  <input type="file" id="myFile" name="filename">
  <input type="submit">
</form>
<button>Save the listing</button>
<hr>
   <a href="dashboard.jsp" ><button>Back</button></a>
</body>
<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>
