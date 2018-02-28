<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title>Mainscope Test</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" />
	<script
	  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	  <script src="js/myjs.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
</head>
<body>
<%
	//allow access only if session exists
	String user = null;
	if(session.getAttribute("username") == null){
		response.sendRedirect("login.jsp");
	}else user = (String) session.getAttribute("username");
	String userName = user;
%>
    <!-- Navigation -->
    <nav class="navbar navbar-toggleable-md navbar-inverse" style="background-color:black;">
	  <a class="navbar-brand" href="#">Test</a>
	  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav nav">
	      <li class="nav-item active">
	        <form action="index.jsp" method="post">
			  <button type="submit" name="home" value="Home" class="btn btn-link nav-link active">Home</button>
			</form>
	      </li>
	      <li class="nav-item dropdown">
	        <button type="button" name="clients" value="clients" class="btn btn-link nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Clients</button>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	        		<button onclick="ajaxCallJSLT('clients');" type="button" name="clients" value="Clientes" class="dropdown-item">Clients</button>
	        		<button onclick="ajaxCallJSLT('contacts');"type="button" name="contacts" value="Contactos" class="dropdown-item">Contacts</button>
	        </div>
	      </li>
	      <li class="nav-item">
	      	<form action="logout" method="post">
			  <button type="submit" name="logout" value="logout" class="btn btn-link nav-link">Logout</button>
			</form>
	      </li>
	    </ul>
	    <!--<form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="text" placeholder="Search" />
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form>-->
	  </div>
	</nav>
	<br/>
    <div id="grad1">
        <div id="gradContainer" class="container" align="center">
			<h3>Hi <%=userName %>, remember to logout.</h3>
			<button onclick="ajaxCall();" type="button" name="clickme" value="Click Me" class="btn btn-primary">Ajax Servlet Test</button>
	    </div><!-- /container -->
    </div>
</body>
</html>