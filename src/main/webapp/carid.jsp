<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driveways</title>
<link href="./style.css" rel="stylesheet" type="text/css" />
	<style><%@include file="./style.css"%></style>
</head>
<body>


<div class="topnav" id="myTopnav">
  <a href="dashboard.jsp" class="active">Driveways </a>
  <a href="carid.jsp">Add Vehicle</a>
  <a href="hostparking.jsp">Add listing</a>
  <a href="checkout.jsp">Add payment method</a>
  <a href="myaccount.jsp">My Account</a>
  <a href="driveways.jsp" class ="signout">Sign out</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<br/>

<%
String editMake = request.getParameter("editMake");
String editModel = request.getParameter("editModel");
String editColor = request.getParameter("editColor");
String editPlate = request.getParameter("editPlate");

boolean editing = false;

if (editMake == "" || editMake == null){
	editMake = "";
	editModel = "";
	editColor = "";
	editPlate = "";
}
else{
	editing = true;
}


%>

<h1>
Vehicle Information
<%if (editing) { 

%>
	- Editing: Press Submit to save vehicle unedited
<%
}
%>

</h1>
<br/>
<form action="" method="post" id="carid" onsubmit="submitHandler()">
  <label for="make">Make:</label>
  <input type="text" id="make" name="make" value="<%= editMake%>"><br><br>
  <label for="model">Model: </label>
  <input type="text" id="model" name="model" value="<%= editModel%>"><br><br>
  <label for="color">Color: </label>
  <input type="text" id="color" name="Color" value="<%= editColor%>"><br><br>
  <label for="license_plate">License Plate: </label>
  <input type="text" id="license_plate" name="license_plate" value="<%= editPlate%>"><br><br>
 
  <input type="submit" value="Submit" id="submitBtn">
</form>
<p>
<%
	String feedback = "";
 	out.println(feedback);
 	
 	// Get values from HTML Form
 	String carMake = request.getParameter("make");
 	String carModel = request.getParameter("model");
 	String carColor = request.getParameter("Color");
 	String licensePlate = request.getParameter("license_plate");
 	
 	
 	
 	
 	// Begin try block for Database Connection
 	try { 
 		
 		//Initialize db connection variables
 		java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");
 		Statement stmt = con.createStatement();
 		
 		// Format values for input to SQL Statement
 		String vals = "0, '" + carMake + "', '" + carModel + "', '" + carColor + "', '" + licensePlate + "'";

		// Check to see if license plate is already on record (avoid duplicates)
 		ResultSet res1 = stmt.executeQuery("SELECT * FROM driveway.vehicle WHERE license_plate = '" + licensePlate + "';");
 		int vehicleId = -1;
 		if(res1.next()) {
 			vehicleId = res1.getInt("vehicleId");
 		}
 		
 		// If license plate is new, add to database
 		if (carMake != null && carMake != "") {
 			if (vehicleId < 0) {
 				
 				// Insert into vehicle table + connect userId to vehicleId in guest table
 				stmt.executeUpdate("INSERT INTO driveway.vehicle VALUES("+ vals + ");");
 				String subQ1 = "(SELECT vehicleId FROM driveway.vehicle WHERE license_plate='" + licensePlate + "')";
 				String subQ2 = "(SELECT accountId FROM driveway.account WHERE accountId=" + session.getAttribute("sessId") + ")";
 				stmt.executeUpdate("INSERT INTO driveway.guest VALUES(" + subQ2 + ", " + subQ1 + ");");
 				
 				out.println("\nSuccesfully added");
 				//out.println("INSERT INTO driveway.guest VALUES(" + subQ1 + ", " + subQ2 + ");");
 	 		}
 	 		// Otherwise, give user feedback
 	 		else {
 	 			out.println("Error: that vehicle is already on record.");
 	 		}
 		}
 		
 		con.close(); 
 		}catch(SQLException e) { 
 			out.println("SQLException caught: " +e.getMessage()); 
 		} 
%>
</p>
<br>
<br>
<a href="dashboard.jsp"><button>Back</button></a>