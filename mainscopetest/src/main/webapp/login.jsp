<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="profile" href="http://gmpg.org/xfn/11" />
    <link rel="pingback" href="http://tuitusgroup.com/wordpress/xmlrpc.php" />
    <title>Mainscope Test</title>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
</head>
    
<style>
    #grad1 {
        background: #f6f6f6; /* For browsers that do not support gradients */    
        background: -webkit-linear-gradient(left top,rgba(246,246,246,0), rgba(244, 249, 255,1)); /* For Safari 5.1 to 6.0 */
        background: -o-linear-gradient(bottom right,rgba(246,246,246,0), rgba(244, 249, 255,1)); /* For Opera 11.1 to 12.0 */
        background: -moz-linear-gradient(bottom right,rgba(246,246,246,0), rgba(244, 249, 255,1)); /* For Firefox 3.6 to 15 */
        background: linear-gradient(to bottom right,rgba(246,246,246,0), rgba(244, 249, 255,1)); /* Standard syntax (must be last) */
    }
</style>

<body id="page-top" class="home blog custom-background index">
    <div id="grad1">

        <!--<section id="section1">
            <div class="container">
                <div class="container-login" style="margin-top:40px;margin-bottom:40px;">
                    <form action="Php/login.php" method="POST">
                        <h4>Usuario: </h4>
                        <input type="text" name="username" class="input-class" />
                        <h4>Contraseña: </h4>
                        <input type="password" name="password" class="input-class" />
                        <br/>
                        <input type="submit" name="bSubmit" class="input-submit" value="Ingresar">
                    </form>
                </div>
            </div>
        </section>-->
        
        <div class="container margin-login" align="center" style="height: 80%;">
			<div class="col-md-6 col-md-offset-3">
				<div class="jumbotron">
					<div class="card card-container" style="padding: 15px 15px 15px 15px;">
			            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
			            <img id="profile-img" class="profile-img-card img-thumbnail" src="images/avatar.png" />
			            <p id="profile-name" class="profile-name-card"></p>
                        <form class="form-signin" action="login" method="POST">
			                <span id="reauth-email" class="reauth-email"></span>
			                <input type="text" id="username" name="username" class="form-control" placeholder="Username" autofocus style="margin-bottom:5px">
			                <input type="password" id="password" name="password" class="form-control" placeholder="Password" style="margin-bottom:5px">
			                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" name="bSubmit">Login</button>
			            </form><!-- /form -->
			        </div><!-- /card-container -->
				</div>
			</div>
	    </div><!-- /container -->
        
    </div>
</body>

</html>