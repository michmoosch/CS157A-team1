<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html> 
<head> 
<title>DriveWays</title> 
  <meta name="description" content="Parking hosting/renting">
  <meta name="author" content="Mohit, Micheal, Dat">
  <meta name="keywords" content="html,css,javascript">
<link href="style.css" rel="stylesheet" />
</head>
<body >
 
<h1 onclick = "handleClick(this)"> Welcome to Driveways </h1> 
<h2>Host or rent parking spaces anywhere you travel!</h2>
<br>
<aside class="leftBar"> &quot;..Save Money, Affordable Parkings...&quot;
</aside>
<br>
<br>
<h1 onclick = "handleClick(this)"> Host a Parking </h1>
<a href = "images/HostParking.jpg">
 <img src="images/HostParking.jpg" width="426" height="240" />
</a>
<h1 onclick = "handleClick(this)"> Rent a Parking</h1> 
<a href = "images/RentParking.jpg">
<img src="images/RentParking.jpg" width="426" height="240" />
</a>
<h1 onclick = "handleClick(this)"> Login/Sign Up</h1> 
<form action = "#">
  <fieldset>
    <legend>Login</legend>
    <label for="email">Email  : </label>
    <input id="email" type="text" name="email" />
    <br />
    <label for="password">Password :</label>
    <input id="password" type="password" name="password" />
    <br />
    <input type="submit" value="Login" />
    <a href="signup.jsp" >Sign-up</a>
  </fieldset>
</form>

<p style="font-weight: bold;">
<% 
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	out.println("");
	
	try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Driveways?autoReconnect=true&useSSL=false", "root", "Root123!");
	
		Statement stmt = con.createStatement();
	
		ResultSet res1 = stmt.executeQuery("SELECT * FROM Driveways.UserAuth WHERE UserEmail = '" + email + "' AND UserPassword = MD5('" + password + "');");
		
		int thisId = -1;
		
		while(res1.next()){
			thisId = res1.getInt(1);
		}
	
		if (email != null){
			if (thisId <= 0 ){
				out.println("Not Found");
			} else{
				out.println("Successfully Logged in");
			}
		}
		
	
		con.close(); 
	}catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); 
	} 

%>
</p>

<br>

<aside class="leftBar"> &quot;..Hassle Free Commute...&quot;
</aside>
<br>
<br>
<script>
//Accepts an html element
    function handleClick(node) {
      var value = node.getAttribute('class') || '';
      value = value === '' ? 'clicked' : '';
      node.setAttribute('class', value);
    }
    
    function handleSubmit() {
    	console.log("Submitted: " + email);
    }
  </script>


 
<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/2/2022 <br>
	</p>
</footer>
</body> 
</html>
