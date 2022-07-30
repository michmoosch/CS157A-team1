<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DashBoard</title>
<link href="style.css" rel="stylesheet" />
</head>
<!--Body -->
<body>

	<div class="topnav" id="myTopnav">
	  <a href="dashboard.jsp" class="active">Driveways </a>
	  <a href="carid.jsp">Add Vehicle info</a>
	  <a href="checkout.jsp">Add payment detail</a>
	  <a href="driveways.jsp">Logout</a>
	  
	  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
	    <i class="fa fa-bars"></i>
	  </a>
	</div>
<%

	String email = request.getParameter("email");
	
 	try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Driveways?autoReconnect=true&useSSL=false", "root", "Root123@");

		Statement stmt = con.createStatement();

		ResultSet res1 = stmt.executeQuery("SELECT * FROM Driveways.UserAuth WHERE UserEmail = '" + email + "';");

		
		if (res1.next()) {
			request.setAttribute("NAME",res1.getString("Name"));
			request.setAttribute("EMAIL", res1.getString("UserEmail"));
		 }
		else{
			request.setAttribute("NAME", "User not found");
			request.setAttribute("EMAIL", "");
		}
		
		con.close(); 
		}catch(SQLException e) { 
			out.println("SQLException caught: " +e.getMessage()); 
		} 


%>
	<h1 onclick = "handleClick(this)"> Driveway's Dashboard</h1>
	<h2>Customer Details</h2>
	<hr>
	<h3 id = "username">Name: <%= request.getAttribute("NAME") %> </h3> 
	<h3 id = "email">Email: <%= request.getAttribute("EMAIL") %></h3>
	<hr>
	<br>
	
<!-- Host Parking -->
	<h1 onclick = "handleClick(this)"> Host Parking</h1>
	<img src="images/HostParking.jpg" width="500" height="240" />
	<a href="listing.jsp" ><button>Add Listing</button></a>
		
	
<!-- Book Parking -->
	<h1 onclick = "handleClick(this)">Rent Parking</h1>
	<img src="images/RentParking.jpg" width="500" height="240" />
	<a href="rentparking.jsp" ><button>Book</button></a>
	
</body>

<!-- Footer -->
<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>
</html>
