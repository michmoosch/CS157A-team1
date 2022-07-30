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
<h1>Vehicle Information</h1>

<form action="" method="post" id="carid" onsubmit="submitHandler()">
  <label for="make">Make:</label>
  <input type="text" id="make" name="make"><br><br>
  <label for="model">Model: </label>
  <input type="text" id="model" name="model"><br><br>
  <label for="color">Color: </label>
  <input type="text" id="color" name="Color"><br><br>
  <label for="license_plate">License Plate: </label>
  <input type="text" id="license_plate" name="license_plate"><br><br>
 
  <input type="submit" value="Submit" id="submitBtn">
</form>
<br>
<br>
<a href="driveways.jsp"><button>Back</button></a>