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
<h1>Account Information</h1>


<%
	String feedback = "";
 	out.println(feedback);
 	//boolean isAdmin = (boolean) session.getAttribute("isAdmin");
 			

 	
 	
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
		int accountId = -1;
		
		

		// Check to see if license plate is already on record (avoid duplicates)
 		ResultSet res1 = stmt.executeQuery("(SELECT * FROM driveway.account WHERE accountId=" + session.getAttribute("sessId") + ")");
 		
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
 			<div id="tableShell" style="display: flex; flex-direction:column; margin: 2; align-items: center;">
 			<br>
 			
 			<table style="width: 500px;" class="greenTable" border="1">
 				<caption style="background-color: #D4EED1; font-size: 20px;"> My Vehicles</caption>
 				<tr>
 					<td>Make</td>
 					<td>Model</td>
 					<td>License Plate</td>
 					<td>Edit</td>
 				</tr>
 			<% 
 			while (vehicles.next()){
 				int vehicleId = vehicles.getInt("vehicleId");
 				
 				%>
 				<tr>
 					<td><% out.println(vehicles.getString("Make")); %></td>
 					<td><% out.println(vehicles.getString("Model")); %></td>
 					<td><% out.println(vehicles.getString("license_plate")); %></td>
 					<td>
 						<a href="useredit.jsp?type=<%="vehicle"%>&id=<%=vehicleId%>"><button type="button" class="accountButton" >Edit Listing</button></a>
 					</td>
 				</tr>
 				
 				
 				<%
 			}
 				
 				
 	 		
%>
</table>
<br>
<table class="greenTable" border="1">
	<caption style="background-color: #D4EED1; font-size: 20px;"> My Listings</caption>
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
		int addressId = listings.getInt("addressId");
		%>
		<tr>
			<td><% out.println(listings.getString("Street")); %></td>
 			<td><% out.println(listings.getString("City")); %></td>
 			<td><% out.println(listings.getInt("Zipcode")); %></td>
 			<td>
 				<a href="useredit.jsp?type=<%="vehicle"%>&id=<%=addressId%>"><button type="button" class="accountButton" >Edit Listing</button></a>
 			</td>
		</tr>
		
		<% 
	}
	
	%>
	</table>
	<br/>
	<table class="greenTable" border="1">
	<caption style="background-color: #D4EED1; font-size: 20px;"> My Cards</caption>
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
</div>
<br>
<br>
<a href="dashboard.jsp"><button>Back</button></a>