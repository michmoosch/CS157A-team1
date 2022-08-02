<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a Listing</title>
</head>
<link href="style.css" rel="stylesheet" />
<body>
<form action="" method="post" id="listing" >
  <label for="number">Number:</label>
  <input type="text" id="number" name="number"><br><br>
  <label for="street">Street:</label>
  <input type="text" id="street" name="street"><br><br>
  <label for="zipcode">Zipcode: </label>
  <input type="text" id="zipcode" name="zipcode"><br><br>
  <label for="city">City: </label>
  <input type="text" id="city" name="city"><br><br>
  <label for="carSize">Car Size: </label>
  <input list="carSizes" id="carSize" name="carSize"><br><br>
  
  <datalist id="carSizes">
    <option value="Small">
    <option value="Medium">
    <option value="Large">
  </datalist>
 
  <input type="submit" value="Submit" id="submitBtn">
</form>
<p> Note: Closed beta restricted to Bay Area, CA </p>
<%
	String feedback = "";
 	out.println(feedback);
 	
 	// Get values from HTML Form
 	String strtNumber = request.getParameter("number");
 	String street = request.getParameter("street");
 	String zipcode = request.getParameter("zipcode");
 	String city = request.getParameter("city");
 	String carSize = request.getParameter("carSize");
 	
 	
 	
 	
 	// Begin try block for Database Connection
 	try { 
 		
 		//Initialize db connection variables
 		java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");
 		Statement stmt = con.createStatement();
 		
 		// Format values for input to SQL Statement
 		String vals = "0, 'U.S.A.', 'California', '" + city + "', '" + zipcode + "', '" + street + "', '" + strtNumber + "'";
 		String listingVals = "0, NULL, '" + carSize + "'";

		// Check to see if address is already on record (avoid duplicates)
 		ResultSet res1 = stmt.executeQuery("SELECT * FROM driveway.address WHERE Number = " + strtNumber + " AND Street = '" + street + "';");
		
		
 		int addressId = -1;
 		if(res1.next()) {
 			addressId = res1.getInt("addressId");
 		}
 		
 		// If license plate is new, add to database
 		if (strtNumber != null && strtNumber != "") {
 			if (addressId < 0) {
 				
 				// Insert into vehicle table + connect userId to vehicleId in guest table
 				stmt.executeUpdate("INSERT INTO driveway.listing VALUES (" + listingVals + ");");
 				String subQ1 = "(SELECT listingId FROM listing WHERE listingId=(SELECT  MAX(listingId) FROM listing))";
 				String subQ2 = "(SELECT accountId FROM driveway.account WHERE accountId=" + session.getAttribute("sessId") + ")";
 				stmt.executeUpdate("INSERT INTO driveway.host VALUES(" + subQ2 + ", " + subQ1 + ");");
 				stmt.executeUpdate("INSERT INTO driveway.address VALUES("+ vals + ");");
 				
 				out.println("\nSuccesfully added");
 				
 	 		}
 	 		// Otherwise, give user feedback
 	 		else {
 	 			out.println("Error: that address is already on record.");
 	 		}
 		}
 		
 		con.close(); 
 		}catch(SQLException e) { 
 			out.println("SQLException caught: " +e.getMessage()); 
 		} 
%>

<!-- 	<h2>Enter Parking Details<h2>
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
<button>Save the listing</button> -->
<hr>
   <a href="dashboard.jsp" ><button>Back</button></a>
</body>
<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>
