<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creating Session</title>
</head>
<body>
<%

String email = request.getParameter("email");
String password = request.getParameter("password");

String username = "NULL";


try { 
	java.sql.Connection con; 
	Class.forName("com.mysql.jdbc.Driver"); 

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123!");


	Statement stmt = con.createStatement();

	//ResultSet res1 = stmt.executeQuery("SELECT * FROM driveway.account WHERE email = '" + email + "';");
	ResultSet res1 = stmt.executeQuery("SELECT * FROM driveway.account WHERE email = '" + email + "' AND password = MD5('" + password + "');");
	
	if (res1.next()) {
		int id = res1.getInt("accountId");
		
		request.setAttribute("EMAIL", res1.getString("email"));
		
		ResultSet res2 = stmt.executeQuery("SELECT * FROM driveway.user WHERE userId = " + id + ";");
		
		if (res2.next()){
			if (username == "NULL") username = res2.getString("first_name");
			request.setAttribute("NAME", res2.getString("first_name"));
		}
		
		session.setAttribute("sessname", username);
		session.setAttribute("sessId", id);
		session.setAttribute("sessemail", email);
		
		
	 }
	
	
	con.close(); 
	}catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); 
	} 
	String redirectURL = "http://localhost:8080/driveways/dashboard.jsp";

	if (username == "NULL"){
		session.invalidate();
		redirectURL = "http://localhost:8080/driveways/driveways.jsp";
	}

	
	response.sendRedirect(redirectURL);
%>
</body>
</html>