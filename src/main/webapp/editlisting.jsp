<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Listing</title>
</head>
<body>
<p>
<%

String adid = request.getParameter("id");
int addressId = Integer.parseInt(adid);
out.println(addressId);
try { 
	java.sql.Connection con; 
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");

	Statement stmt = con.createStatement();

	 
	
	 int listingId = -1;
	 
	 ResultSet delete = stmt.executeQuery("SELECT * FROM driveway.listing WHERE addressId = " + addressId + "");
	 if(delete.next()) {
		 listingId = delete.getInt("listingId");
	 }
	
	
	
	stmt.executeUpdate("DELETE FROM driveway.host WHERE listingId=" + listingId + ";");
	stmt.executeUpdate("DELETE FROM driveway.listing WHERE listingId=" + listingId + ";");
	stmt.executeUpdate("DELETE FROM driveway.address WHERE addressId=" + addressId + ";");
	out.println("listingId: " + listingId);
	out.println("addressId: " + addressId);

	con.close(); 
}catch(SQLException e) { 
	out.println("SQLException caught: " +e.getMessage()); 
} 
String redirectURL = "http://localhost:8080/driveways/rentparking.jsp";

response.sendRedirect(redirectURL);
%>
</p>
</body>
</html>