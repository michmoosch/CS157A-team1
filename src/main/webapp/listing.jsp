<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="style.css" rel="stylesheet" />
<body>
<div class="topnav" id="myTopnav">
  <a href="dashboard.jsp" class="active">Driveways </a>
  <a href="carid.jsp">Add Vehicle info</a>
  <a href="checkout.jsp">Add payment detail</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<form>
    <h5>Location:</h5>
    <input type='text'/>

    <h5>Time Available:</h5>
    <input type='date' />

    <h5>Parking Address:</h5>
    <input type='address' />

    <h5>Parking Spots </h5>
    <input type='text' />

    <h5>Parking Spot Image:</h5>
    <input class="file-upload-input" type = "file" onchange = "readURL(this)" accept = "Image/*"/>
    <br/>
    <br/>
    <button type='submit' className='submit'>Submit</button>
</form>
<a href="dashboard.jsp" ><button>Back</button></a>
</body>

<footer>
	<p>
	Special Thanks to our professor Mike Wu <br>
	last updated: 7/4/2022 <br>
	</p>
</footer>
