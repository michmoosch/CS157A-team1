<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>DashBoard</title>
	<link href="./style.css" rel="stylesheet" type="text/css" />
	<style><%@include file="./style.css"%></style>
</head>
<body>
<div class="topnav" id="myTopnav">
  <a href="dashboard.jsp" class="active">Driveways </a>
  <a href="carid.jsp">Add Vehicle</a>
  <a href="hostparking.jsp">Add listing</a>
  <a href="checkout.jsp">Add payment method</a>
  <a href="driveways.jsp" class ="signout">Sign out</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<%

	String email = request.getParameter("email");
	
 	try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.jdbc.Driver"); 

		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");


		Statement stmt = con.createStatement();

		ResultSet res1 = stmt.executeQuery("SELECT * FROM driveway.account WHERE email = '" + email + "';");

		request.setAttribute("NAME", session.getAttribute("sessname"));
		request.setAttribute("EMAIL", session.getAttribute("sessemail"));
		
		/* if (res1.next()) {
			int id = res1.getInt("accountId");
			ResultSet res2 = stmt.executeQuery("SELECT * FROM driveway.user WHERE userId = " + id + ";");
			if (res2.next()){
				request.setAttribute("NAME", res2.getString("first_name"));
			}
			
			//request.setAttribute("NAME",res1.getString("name"));
			
			//request.setAttribute("EMAIL", res1.getString("email"));
		 } */
		
		
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
	<!-- <h3 id = "location">Location: </h3>
	<h3 id = "userType">User Type: </h3> -->
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
		<a href="driveways.jsp"><button>Back</button></a>
</body>

<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>
</html>
