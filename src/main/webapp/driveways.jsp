<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html> 
<head> 
<div class="topnav" id="myTopnav">
  <a href="driveways.jsp" class="active">Driveways/a>
  <a href="signup.jsp">Create an account</a>
  <a href="signin.jsp">Sign in</a>
 <!--   <a href="r">Rent a driveway</a> -->
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
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
<br>
<a href = ".images/car.png">
	 <img src="images/car.png" width="426" height="240" />
</a>
<br>
<br>
<br>
<aside class="rightBar"> &quot;..Hassle Free Commute...&quot;
</aside>
<br>

<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>


</body> 
</html>
