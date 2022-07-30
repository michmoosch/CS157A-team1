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

<br>
<h1 onclick = "handleClick(this)"> Login/Sign Up</h1> 

<form name="loginForm" id="loginId" method="post" action="session.jsp"  >
  <fieldset>
    <legend>Login</legend>
    <label for="email">Email  : </label>
    <input id="email" type="text" name="email" />
    <br />
    <label for="password">Password :</label>
    <input id="password" type="password" name="password" />
    <br />
    <input type="submit" value="Login" ></input>
  </fieldset>
 </form>
<!-- <a href="dashboard.jsp" ><button>Login</button></a>  action = "dashboard.jsp"-->


<p style="font-weight: bold; color: red;">
<% 
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	boolean loggedIn = false;
	out.println("");
	
	try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/driveway?autoReconnect=true&useSSL=false", "root", "Root123@");
	
		Statement stmt = con.createStatement();
	
		ResultSet res1 = stmt.executeQuery("SELECT * FROM driveway.account WHERE email = '" + email + "' AND password = MD5('" + password + "');");
		
		int thisId = -1;
		
		while(res1.next()){
			thisId = res1.getInt(1);
		}
	
		if (email != null){
			if (thisId <= 0 ){
				out.println("Login not found, click Register to create an account");
				
			} else{
				out.println("Successfully Logged in to: " + email);
				loggedIn = true;
			}
		}
		
	
		con.close(); 
	}catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); 
	} 
%>
</p>

<a href="signup.jsp"><button>Register</button></a>
<br>
<br>
  
 <form action = "#">
  <fieldset>
	 <legend>Reviews</legend>
	 <p>Feedbacks from end user</p>
	 <textarea id="comments" rows="3" cols="50" name="comments"></textarea>
	 <br>
  	 <input type="submit" value="Submit" id="submitBtn">
  	 <br>
   </fieldset>
</form>




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
    
    const formCheck = function(event) {
    	
    	const validation = (<%= loggedIn %>)
    	console.log(validation);
    	return true;
    	
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
