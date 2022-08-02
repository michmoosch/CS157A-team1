<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="style.css" rel="stylesheet" />
<body>
	<h2>Find Parking</h2>
	<form action="" method="post" id="listingSearch" >
  	<label for="search">Search:</label>
  	<input type="text" id="search" name="search">

  	<input type="submit" value="Submit" id="submitBtn">
</form>
	<!-- <hr>
	<h3 id = "location"> Preferred Location: </h3>
	<h3 id = "time">Duration of Parking: </h3>
	<h3 id = "noOfSpots">Car Number </h3>
	<hr> -->
	<table border="1">
		<tr>
			<td>Number</td>
			<td>Street</td>
			<td>City</td>
			<td>Zipcode</td>
			<td>Day</td>
			<td>Time</td>
			<td>Rent this</td>
		</tr>

<%

	String search = request.getParameter("search");
	
	boolean searchFlag = false;
	
	if (search != null && search != ""){
		searchFlag = true;
	}
	
	
	
 	// Begin try block for Database Connection
 	try { 
 		
 		//Initialize db connection variables
 		java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 
 		ResultSet res1;
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");
 		Statement stmt = con.createStatement();
 		
 		
 		String defaultSearch = "SELECT * FROM address;";
 		
 		if (searchFlag){
 			res1 = stmt.executeQuery("SELECT * FROM address WHERE city='" + search + "' OR Zipcode='" + search + "';");
 		}
 		else {
 			res1 = stmt.executeQuery("SELECT * FROM address;");
 		}
 		
 		
 		while(res1.next()) {
 			%>
 			<tr>
 				<td> <% out.println(res1.getInt("Number")); %></td>
 				<td> <% out.println(res1.getString("Street")); %></td>
 				<td> <% out.println(res1.getString("City")); %></td>
 				<td> <% out.println(res1.getString("Zipcode")); %></td>
 				<td>Day</td>
				<td>Time</td>
 				<td> <button id="reserve" value="<%out.println(res1.getString("addressId"));%>" onclick="handleClick(this)"> Reserve </button></td>
 			</tr>
 			<% 
 		}
 		
 		con.close(); 
 		}catch(SQLException e) { 
 			out.println("SQLException caught: " +e.getMessage()); 
 		} 
%>
	</table>
	<a href="dashboard.jsp"><button>Back</button></a>
	<br>
	
	<!-- <button onClick = "doSomething()"> Do Something </button>
		<p id = "test"> Hello </p> -->
	
	<script>
		function doSomething(){
			document.getElementById("test").innerHTML = "Goodbye";
		}
		function handleClick(event){
			console.log(event.value);
		}
		
		
	</script>
</body>
<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>
</html>