<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driveways</title>
<link href="style.css" rel="stylesheet" />
</head>
<body>
<h1>Driveways Signup Screen</h1>

<form action="" method="post" id="signup" onsubmit="submitHandler()">
  <label for="fname">Name:</label>
  <input type="text" id="fname" name="fname"><br><br>
  <!-- 
  <label for="lname">Last name:</label>
  <input type="text" id="lname" name="lname"><br><br> -->
  
  <label for="email">Email: </label>
  <input type="text" id="email" name="email"><br><br>
  
  <label for="password">Password: </label>
  <input type="password" id="password" name="password"><br><br>
  
 
  <input type="submit" value="Submit" id="submitBtn">
</form>
<br>
<br>
<a href="driveways.jsp"><button>back</button></a>


<p id="feedback">

	
	<%
		String firstname = request.getParameter("fname");
		String lastname = request.getParameter("lname"); 
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		out.println("");
		 try { 
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Driveways?autoReconnect=true&useSSL=false", "root", "Root123!");
		
			Statement stmt = con.createStatement();
		
			ResultSet res1 = stmt.executeQuery("SELECT accountId FROM Driveways.Account WHERE email = '" + email + "');");
		
		
			if (email != null){
				if (res1.next() == true){
					out.println("that email already exists");
				} else{
					String newVals = "0, '" + email + "', MD5('" + password + "')'";
					con.createStatement().executeUpdate("INSERT INTO Driveways.Account VALUES(" + newVals + ");");
					out.println("successfully created new account");	
				}
			}
			
			
		
			con.close(); 
		}catch(SQLException e) { 
			out.println("SQLException caught: " +e.getMessage()); 
		}  
		 
	%>
</p>

<script>

	const submitHandler = () => {
		
		document.getElementById("feedback").style.display = "block";
		
		setTimeout(() => {}, 10000);
		
	}
	
</script>
<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>

</body>
</html>
