<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<html> 
<head> 
<title>Driveways</title> 
</head>
<body> 
<h1>Welcome to Driveways </h1> 
<% 
	try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Driveways?autoReconnect=true&useSSL=false", "root", "Root123!");
		out.println ("\"Driveways\" database successfully opened."); 
		Statement stmt=con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from Driveways.Test");
		while(rs.next())
			out.println(rs.getInt(1));
		con.close(); 
	} catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); } 
%> 
<script type="text/javascript">

console.log("test");
</script>
</body> 
</html> 