<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driveways</title>
</head>
<body>
<h1>Driveways Signup Screen</h1>

<form action="" method="post" id="signup">
  <label for="fname">First name:</label>
  <input type="text" id="fname" name="fname"><br><br>
  
  <label for="lname">Last name:</label>
  <input type="text" id="lname" name="lname"><br><br>
  
  <label for="email">Email: </label>
  <input type="text" id="email" name="email"><br><br>
  
  <label for="password">Password: </label>
  <input type="text" id="password" name="password"><br><br>
  
 
  <input type="submit" value="Submit" id="submitBtn">
</form>

<p>
	
	<%
		String firstname = request.getParameter("fname");
		String lastname = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Driveways?autoReconnect=true&useSSL=false", "root", "Root123!");
		
		Statement stmt = con.createStatement();
		
		ResultSet res1 = stmt.executeQuery("SELECT userId FROM Driveways.Users WHERE email = '" + email + "';");
		
		
		if (res1.next() == true){
			out.println("that email already exists");
		} else{
			ResultSet test1 = con.createStatement().executeQuery("SELECT MAX(userId) FROM Driveways.Users");
			int newid = -1;
			while (test1.next()){
				newid = test1.getInt(1) + 1;
			}
			String vals = newid + ", '" + firstname + "', '" + lastname + "', '" + email + "', " + "'User', " + "NOW()";
			if (newid != -1){
				con.createStatement().executeUpdate("INSERT INTO Driveways.Users VALUES(" + vals + ")");
			}
			out.println("success");
			
		}
		
		con.close(); 
	}catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); 
	}  

		
	%>
</p>

</body>
</html>