<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User edit</title>
</head>
<body>
<%

String editType = request.getParameter("type");
int id = -1;
int num = -1;

try { 
	java.sql.Connection con; 
	Class.forName("com.mysql.jdbc.Driver"); 

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");


	Statement stmt = con.createStatement();
	
	ResultSet vehicle;
	String make = "";
	String model = "";
	String color = "";
	String plate = "";
	
	ResultSet listing;
	int number = -1;
	String street = "";
	String city = "";
	int zipcode = -1;
	String carsize ="";
	ResultSet card;

	switch (editType) {
	case "vehicle":
		id = Integer.parseInt(request.getParameter("id"));
		vehicle = stmt.executeQuery("SELECT * FROM driveway.vehicle WHERE vehicleId=" + id + ";");
		if (vehicle.next()){
			make = vehicle.getString("Make");
			model = vehicle.getString("Model");
			color = vehicle.getString("Color");
			plate = vehicle.getString("license_plate");
			
		}
		stmt.executeUpdate("DELETE FROM driveway.guest WHERE vehicleId=" + id +"");
		stmt.executeUpdate("DELETE FROM driveway.vehicle WHERE vehicleId=" + id +"");
		%>
		<jsp:forward page="carid.jsp">
  			<jsp:param name="editMake" value="<%=make %>" ></jsp:param>
  			<jsp:param name="editModel" value="<%=model %>" ></jsp:param>
  			<jsp:param name="editColor" value="<%=color %>" ></jsp:param>
  			<jsp:param name="editPlate" value="<%=plate %>" ></jsp:param>
  			<jsp:param name="editing" value="true" ></jsp:param>
		</jsp:forward>
		
		
		<%
		  
		
		
		break;
	case "listing":
		id = Integer.parseInt(request.getParameter("id"));
		id = Integer.parseInt(request.getParameter("id"));
		listing = stmt.executeQuery("SELECT * FROM driveway.address WHERE addressId=" + id + ";");
		
		if (listing.next()){
			number = listing.getInt("Number");
		 	street = listing.getString("Street");
		 	zipcode = listing.getInt("Zipcode");
		 	city = listing.getString("City");
		 
		}
		
		stmt.executeUpdate("DELETE FROM driveway.host WHERE listingId IN (SELECT listingId FROM listing WHERE addressId=" + id +")");
		stmt.executeUpdate("DELETE FROM driveway.listing WHERE addressId=" + id +"");
		stmt.executeUpdate("DELETE FROM driveway.address WHERE addressId=" + id +"");
		%>
		<jsp:forward page="hostparking.jsp">
  			<jsp:param name="editNumber" value="<%=number %>" ></jsp:param>
  			<jsp:param name="editStreet" value="<%=street %>" ></jsp:param>
  			<jsp:param name="editZipcode" value="<%=zipcode %>" ></jsp:param>
  			<jsp:param name="editCity" value="<%=city %>" ></jsp:param>
  			<jsp:param name="editing" value="true" ></jsp:param>
		</jsp:forward>
		
		<%
		  
		
		break;
	case "card":
		num = Integer.parseInt(request.getParameter("num"));
		stmt.executeUpdate("DELETE FROM driveway.paymentinformation WHERE CardNumber=" + num + "");
		%>
		<jsp:forward page="checkout.jsp">
  			<jsp:param name="editCardNumber" value="<%=num %>" ></jsp:param>
		</jsp:forward>
		
		
		<%
		out.println("card Num: " + num);
		break;
	default:
		break;
	}
	

	
	
	

	
	
	con.close(); 
	}catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); 
	} 
	String redirectURL = "http://localhost:8080/driveways/dashboard.jsp";

	
    //response.sendRedirect(redirectURL);
%>
</body>
</html>