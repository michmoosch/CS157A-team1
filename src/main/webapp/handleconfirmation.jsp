<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handle Confirmation</title>
</head>
<body>
<%


int addressId = Integer.parseInt(request.getParameter("id"));
out.println(addressId);



try { 
	java.sql.Connection con; 
	Class.forName("com.mysql.jdbc.Driver"); 

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");


	Statement stmt = con.createStatement();

	stmt.executeUpdate("UPDATE listing SET Status='Unavailable' WHERE addressId=" + addressId + ";");
	
		
		
	 
	
	
	con.close(); 
	}catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); 
	} 
	String redirectURL = "http://localhost:8080/driveways/rentparking.jsp";

    response.sendRedirect(redirectURL);
%>
</body>
</html>