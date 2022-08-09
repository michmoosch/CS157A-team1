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
	<form action="" method="post" id="listingSearch" >
  	
  	<input type="text" id="search" name="search" placeholder="Search">

  	<input type="submit" value="Submit" id="submitBtn">
</form>
	<% boolean isAdmin = (boolean) session.getAttribute("isAdmin"); %>
	<table border="1">
		<tr>
			<td>Number</td>
			<td>Street</td>
			<td>City</td>
			<td>Zipcode</td>
			<td>Rent this</td>
			<%if(isAdmin){
			%>
			<td>Admin Powers</td>
			<%	
			} %>
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
 			
 			int addressId = res1.getInt("addressId");
 			
 			
 			%>
 			<tr>
 				<td> <% out.println(res1.getInt("Number")); %></td>
 				<td> <% out.println(res1.getString("Street")); %></td>
 				<td> <% out.println(res1.getString("City")); %></td>
 				<td> <% out.println(res1.getString("Zipcode")); %></td>
 				<td> 
 					<button id="reserve" value=<%out.println(res1.getInt("addressId"));%> onclick="handleClick(event)"> Reserve </button>
 				</td>
 				<%if(isAdmin) {%>
 				<td>
 					<a href="editlisting.jsp?id=<%=res1.getInt("addressId") %>"><button type="button" >Delete Listing</button></a>
 				</td>
 				<%
 				}
 				%>
 			</tr>
 			<% 
 		}
 		%>
 		
</table>
	<input type="hidden" id="hiddenField"/>
	
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
			
			const span4 = document.createElement("span");
			span4.innerHTML = "SUCCESSFULLY BOOKED";
				
			modalContent.appendChild(span1);
			modalContent.appendChild(span2);
			modalContent.appendChild(span3);
			modalContent.appendChild(span4);
			modal.style.display = "block";
			
			
			
			
			
			
		}
		
		function handleAdmin(event) {
			
			const adId = event.target.value;
			
			
			
			const modal = document.getElementById("modal");
			const modalContent = document.getElementById("modal-content");

			const span1 = document.createElement("span");
			span1.innerHTML = "Are You sure you want to delete this entry?";
			
			const yes = document.createElement("button");
			yes.innerHTML = "Yes";
			
			const no = document.createElement("button");
			no.innerHTML = "No";
			
			
			  <%
			 
			 
			 int addressId = -2;
			 int listingId = -1;
			 
			 ResultSet delete = stmt.executeQuery("SELECT * FROM driveway.listing WHERE addressId = " + addressId + "");
			 if(delete.next()) {
				 listingId = delete.getInt("listingId");
			 }
			 /* stmt.executeUpdate("DELETE FROM driveway.host WHERE listingId=" + listingId + "");
			 stmt.executeUpdate("DELETE FROM driveway.listing WHERE listingId=" + listingId + "");
			 stmt.executeUpdate("DELETE FROM driveway.address WHERE adressId=" + addressId + "");  */
			 %> 
			console.log(event.target.value);
		}
		
		
		function closeModal() {
			document.getElementById("modal-content").innerHTML = "";
			document.getElementById("modal").style.display = "none";
		}
		
	</script>
	<%con.close(); 
 		}catch(SQLException e) { 
 			out.println("SQLException caught: " +e.getMessage()); 
 		}  %>
</body>
<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>

</html>