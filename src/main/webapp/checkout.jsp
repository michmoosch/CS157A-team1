<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driveways</title>
<link href="style.css" rel="stylesheet" />
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
<h1>Add Payment Method</h1>
<br/>

<form action="" method="post" id="carid" onsubmit="submitHandler()">
  <label for="cardNumber">Card Number:</label>
  <input type="text" id="cardNumber" name="cardNumber"><br><br>
  <label for="expDate">Exp Date: </label>
  <input type="text" id="expDate" name="expDate"><br><br>
  <input type="submit" value="Submit" id="submitBtn">
</form>
<p>
<%
	String feedback = "";
 	out.println(feedback);
	 // Get values from HTML Form
  	String cardNum = request.getParameter("cardNumber");
  	String exp = request.getParameter("expDate");

 	request.setAttribute("userId", session.getAttribute("sessId"));
 	
 	
 	String vals = request.getAttribute("userId") + ", " + cardNum + ", NULL , NULL";
 	//out.println("vals: " + vals);
 	
 	// Begin try block for Database Connection
 	try { 
 		
 		
 		
 		//Initialize db connection variables
 		java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");
 		Statement stmt = con.createStatement();
 		int userId = -1;
 		if(cardNum != null && cardNum != ""){
 			ResultSet res1 = stmt.executeQuery("SELECT userId FROM paymentinformation WHERE CardNumber = " + cardNum);
 	 		stmt.executeUpdate("INSERT INTO paymentinformation VALUES(" + vals +");");
 		}
 		
 		//stmt.executeUpdate("INSERT INTO paymentinformation VALUES(" + vals +");");
 		/* if (res1.next()){
 			userId = res1.getInt("userId");
 			
 			// New Card
 			if(userId < 0) {
 				stmt.executeUpdate("INSERT INTO paymentinformation VALUES(" + vals +");");
 			}
 			else{ 
 				out.println("You already have a card on file");
 			}
 		}  */
 		con.close(); 
 		}catch(SQLException e) { 
 			out.println("SQLException caught: " +e.getMessage()); 
 		} 
%>
</p>
<br>
<br>
<a href="dashboard.jsp"><button>Back</button></a>