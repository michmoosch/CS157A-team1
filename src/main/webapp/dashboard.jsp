<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DashBoard</title>
<link href="style.css" rel="stylesheet" />
</head>
<body>
	<h1 onclick = "handleClick(this)"> Driveway's Dashboard</h1>
	<h2>Customer Details</h2>
	<hr>
	<h3 id = "username">Name: </h3>
	<h3 id = "email">Email: </h3>
	<h3 id = "location">Location: </h3>
	<h3 id = "userType">User Type: </h3>
	<hr>
	<br>
	<h1 onclick = "handleClick(this)"> Host a Parking </h1>
	<a href = "images/HostParking.jpg">
	 <img src="images/HostParking.jpg" width="426" height="240" />
	</a>
		<a href="hostparking.jsp" ><button>Host Parking</button></a>
	<h1 onclick = "handleClick(this)"> Rent a Parking</h1> 
	<a href = "images/RentParking.jpg">
	<img src="images/RentParking.jpg" width="426" height="240" />
	</a>
		<a href="rentparking.jsp" ><button>Rent Parking</button></a>
		<br>
		<br>
		<h1 onclick = "handleClick(this)"> Exit </h1> 
		<a href="/Hands-On/src/main/webapp/driveways.jsp"><button>Back</button></a>
</body>

<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>
</html>
