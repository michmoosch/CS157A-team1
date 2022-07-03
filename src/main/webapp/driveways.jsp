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
<h2>Host or rent parking spaces anywhere you travel</h2>
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
    <legend>Personal Data</legend>
    <label for="user">Username: </label>
    <input id="user" type="text" name="user" />
    <br />
    <label for="password">Password: </label>
    <input id="password" type="text" name="password" />
    <br />
    <input type="submit" value="Login" />
    <input type="submit" value="SignUp" />
  </fieldset>
</form>
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
  </script>


<% 
/* try { 
	java.sql.Connection con; 
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sonwane?autoReconnect=true&useSSL=false", "root", "root");
	//out.println (request.getParameter("sonwane") + "database successfully opened."); 
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from sonwane.student");
	while(rs.next())
	out.println("<br>" + rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
	con.close(); 
}catch(SQLException e) { 
	out.println("SQLException caught: " +e.getMessage()); 
}  */

%> 
<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/2/2022 <br>
	</p>
</footer>
</body> 
</html>
