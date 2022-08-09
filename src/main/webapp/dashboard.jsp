<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>DashBoard</title>
	<link href="./style.css" rel="stylesheet" type="text/css" />
	<style><%@include file="./style.css"%></style>
	
	<style>
      *{
        margin : 0;
        padding :0;
      }
      #map{
        height : 500px;
        width: 100%;
      }
    </style>
    
</head>

<body>
<!-- navigation -->
<div class="topnav" id="myTopnav">
  <a href="dashboard.jsp" class="active">Driveways </a>
  <a href="carid.jsp">Add Vehicle</a>
  <a href="hostparking.jsp">Add listing</a>
  <a href="checkout.jsp">Add payment method</a>
  <a href="myaccount.jsp">My Account</a>
  <a href="driveways.jsp" class ="signout">Sign out</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>

<!--Database connect-->

<p>
<%
	String email = request.getParameter("email");
	boolean isAdmin = (boolean) session.getAttribute("isAdmin");
 	try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "root");
		Statement stmt = con.createStatement();
		ResultSet res1 = stmt.executeQuery("SELECT * FROM driveway.account WHERE email = '" + email + "';");
		request.setAttribute("NAME", session.getAttribute("sessname"));
		request.setAttribute("EMAIL", session.getAttribute("sessemail"));
		con.close(); 
		}catch(SQLException e) { 
			out.println("SQLException caught: " +e.getMessage()); 
		} 
%>
</p>

<!--Main Body Interface  -->
	<h1>Customer Details</h1>
	<hr>
	<h3 id = "username">Welcome, <%= request.getAttribute("NAME") %> </h3> 
	<h3 id = "email">Email: <%= request.getAttribute("EMAIL") %></h3>
<%-- 	<%
		if(isAdmin) {
			%>
			<h4>You are an admin, nice.</h4>
			<%
		}
		

	%> --%>
	<h1>Parking Spots Available:</h1>
    <div id="map"></div>
	<h1 onclick = "handleClick(this)"> Host a Parking </h1>
	<a href = "images/HostParking.jpg">
	<img src="images/HostParking.jpg" width="700" height="400" />
	</a>
	<a href="hostparking.jsp" ><button>Host Parking</button></a>
	<h1 onclick = "handleClick(this)"> Rent a Parking Spot</h1> 
	<a href = "images/RentParking.jpg">
	<img src="images/RentParking.jpg" width="700" height="400" />
	</a>
	<a href="rentparking.jsp" ><button>Rent Parking</button></a>
	<h1 onclick = "handleClick(this)"> Exit </h1> 
	<a href="driveways.jsp"><button>Back</button></a>
</body>

 <script>
      function initMap(){
        var location = {lat : 37.344690, lng: -121.891090 };
        var map = new google.maps.Map(document.getElementById("map"), {
          zoom : 9,
          center: location
        });
        let marker1 = new google.maps.Marker({
            position : new google.maps.LatLng(37.2198164,-121.8618324),
                map : map
          });
        let marker2 = new google.maps.Marker({
            position : new google.maps.LatLng(37.3158445,-121.880036),
            map : map
          });
        let marker3 = new google.maps.Marker({
            position : new google.maps.LatLng(37.2998167,-121.84457),
            map : map
          });
        let marker4 = new google.maps.Marker({
        	 position : new google.maps.LatLng(37.3955492,-122.0914759),
           map : map
         });
        let marker5 = new google.maps.Marker({
            position : new google.maps.LatLng(37.4882612,-122.2647424),
            map : map
          });
        var marker6 = new google.maps.Marker({
            position : new google.maps.LatLng(37.6094196,-122.3987592),
            map : map
          });
        var marker7 = new google.maps.Marker({
            position : new google.maps.LatLng(37.3409202,-121.8934923),
            map : map
          }); 
       }
   	</script>
	<script async defer src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyArIVqq4LetQc27-bit7Flo5W5bN4eilhI&callback=initMap"></script>

<footer>
	<p>
	Special Thanks to our professor Mike Wu </br>
	Done by: Dat, Micheal, Mohit</br>
	last updated: 8/9/2022 </br>
	</p>
</footer>
</html>
