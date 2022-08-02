<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driveways</title>
<link href="style.css" rel="stylesheet" />
</head>
<body>

<h1>Account Information</h1>


<%
	String feedback = "";
 	out.println(feedback);

 	
 	
 	// Begin try block for Database Connection
 	try { 
 		
 		//Initialize db connection variables
 		java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");
 		Statement stmt = con.createStatement();
 		
 		String fname ="";
		String lname ="";
		String email="";
		
		

		// Check to see if license plate is already on record (avoid duplicates)
 		ResultSet res1 = stmt.executeQuery("(SELECT * FROM driveway.account WHERE accountId=" + session.getAttribute("sessId") + ")");
 		int accountId = -1;
 		if(res1.next()) {
 			accountId = res1.getInt("accountId");
 			email = res1.getString("email");
 		}
 		
 		
 		
 		if (accountId >= 0) {
 			
 			// Sets of User Data
 			ResultSet userInfo = stmt.executeQuery("SELECT * FROM user WHERE userId=" + accountId + "");
 			if(userInfo.next()) {
 				fname = userInfo.getString("first_name");
 				lname = userInfo.getString("last_name");
 			}
 			
 			
 			String subq1 = "SELECT vehicleId FROM guest WHERE guestId=" + accountId + "";
 			ResultSet vehicles = stmt.executeQuery("SELECT * FROM vehicle WHERE vehicleId IN (" + subq1 +")");
 			
 			
 			

 			%>
 			<h2><% out.println("Name: " + fname + " " + lname); %> </h2>
 			<h2><% out.println("Email: " + email); %> </h2>
 			<table border="1">
 				<tr>
 					<td>My Vehicles</td>
 				</tr>
 				<tr>
 					<td>Make</td>
 					<td>Model</td>
 					<td>License Plate</td>
 				</tr>
 			<% 
 			while (vehicles.next()){
 				
 			
 				
 				%>
 				<tr>
 					<td><% out.println(vehicles.getString("Make")); %></td>
 					<td><% out.println(vehicles.getString("Model")); %></td>
 					<td><% out.println(vehicles.getString("license_plate")); %></td>
 				</tr>
 				
 				
 				<%
 			}
 				
 				
 	 		
%>
</table>
<table border="1">
	<tr><td>My Listings</td></tr>
		<tr>
 			<td>Street</td>
 			<td>City</td>
 			<td>Zipcode</td>
 		</tr>

<%

	String subq2 = "SELECT listingId FROM host WHERE accountId=" + accountId + "";
	String subq3 = "SELECT addressId FROM listing WHERE listingId IN ("+subq2+ ")";
	ResultSet listings = stmt.executeQuery("SELECT * FROM address WHERE addressId IN (" + subq3 +")");
	
	while (listings.next()){
		%>
		<tr>
			<td><% out.println(listings.getString("Street")); %></td>
 			<td><% out.println(listings.getString("City")); %></td>
 			<td><% out.println(listings.getInt("Zipcode")); %></td>
		</tr>
		
		<% 
	}
	
	%></table>
	<table border="1">
	<tr><td>My Card</td></tr>
	<tr>
 			<td>Card Number</td>
 			<td>Exp Date</td>
 		</tr>
	<%
		
	
	ResultSet card = stmt.executeQuery("SELECT * FROM paymentinformation WHERE userId=" + accountId + "");
	while (card.next()) {
		%>
			
		<tr>
			<td><% out.println(card.getInt("CardNumber")); %></td>
 			<td><% out.println(card.getString("ExpDate")); %></td>
		</tr>
		<%
	}
	
	
 		}
	 		// Otherwise, give user feedback
	 		else {
	 			out.println("Error: user not logged in");
	 		}
		
		
		con.close(); 
		}catch(SQLException e) { 
			out.println("SQLException caught: " +e.getMessage()); 
		} 
%>
</table>
<br>
<br>
<a href="dashboard.jsp"><button>Back</button></a>