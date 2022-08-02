<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listings</title>
<link href="style.css" rel="stylesheet" />
<style><%@include file="./style.css"%></style>
</head>


<body>
	<h2>Find Parking</h2>
	<form action="" method="post" id="listingSearch" >
  	<label for="search">Search:</label>
  	<input type="text" id="search" name="search">

  	<input type="submit" value="Submit" id="submitBtn">
</form>
	
	<table border="1">
		<tr>
			<td>Number</td>
			<td>Street</td>
			<td>City</td>
			<td>Zipcode</td>
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
 				<td> <button id="reserve" value=<%out.println(res1.getInt("addressId"));%> onclick="handleClick(event)"> Reserve </button></td>
 			</tr>
 			<% 
 		}
 		
 		con.close(); 
 		}catch(SQLException e) { 
 			out.println("SQLException caught: " +e.getMessage()); 
 		} 
%>
	</table>
	
	
	<div id="modal">
	
		<div id="modal-content">
		</div>
		
		<button id="closeModal" onclick="closeModal()"> Back </button>
	
	</div>
	
	
	<a href="dashboard.jsp"><button>Back</button></a>
	<br>
	
	
	<script>
		function doSomething(){
			document.getElementById("test").innerHTML = "Goodbye";
		}
		
		function handleClick(event){
			console.log(event.target.value);
			const thisRow = event.target.parentElement.parentElement;
			const thisNum = thisRow.childNodes[1].innerHTML;
			const thisStreet = thisRow.childNodes[3].innerHTML;
			const thisCity = thisRow.childNodes[5].innerHTML;
			console.log(thisRow);
			console.log(thisStreet);
			const modal = document.getElementById("modal");
			const modalContent = document.getElementById("modal-content");

			const span1 = document.createElement("span");
			span1.innerHTML = thisNum;
			
			const span2 = document.createElement("span");
			span2.innerHTML = thisStreet;
			
			const span3 = document.createElement("span");
			span3.innerHTML = thisCity;
				
			modalContent.appendChild(span1);
			modalContent.appendChild(span2);
			modalContent.appendChild(span3);
			modal.style.display = "block";
			
			
			
			
			
			
		}
		
		function closeModal() {
			document.getElementById("modal-content").innerHTML = "";
			document.getElementById("modal").style.display = "none";
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