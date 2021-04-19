<%-- 
    Document   : index
    Created on : Mar 11, 2019, 1:07:12 PM
    Author     : OEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorpage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Stranica za logovanje</title>
        
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

    </head>
    <body>
        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                <div class="wrap-login100">
        <form class="login100-form validate-form" name="form" action="LoginServlet" method="post">
            <span class="login100-form-logo">
                <i class="zmdi zmdi-hotel"></i>
            </span>
            
            <span class="login100-form-title p-b-34 p-t-27">
		Hotelska sluzba
            </span>
            
            <span class="hideAfter" style="color: red;"><%=(request.getAttribute("errMessage")==null)?"" 
                    :request.getAttribute("errMessage")%></span>    
            <div class="wrap-input100 validate-input" data-validate = "Unesite korisnicko ime">
                <%if(request.getAttribute("Username")!=null){%>
                <input class="input100" type="text" name="username" placeholder="Korisnicko ime" value="<%=request.getAttribute("Username")%>">
                <%}else{%>
                <input class="input100" type="text" name="username" placeholder="Korisnicko ime">
                <% }%>
		<span class="focus-input100" data-placeholder="&#xf207;"></span>
            </div>
            
            <div class="wrap-input100 validate-input" data-validate="Unesite lozinku">
                <%if(request.getAttribute("password")!=null){%>
                <input class="input100" type="password" name="password" placeholder="Lozinka" value="<%=request.getAttribute("password")%>">
                <%}else{ %>
                <input class="input100" type="password" name="password" placeholder="Lozinka">
                <% }%>
		<span class="focus-input100" data-placeholder="&#xf191;"></span>
            </div>
            <div class="contact100-form-checkbox">
                <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me" value="">
                    <label class="label-checkbox100" for="ckb1">
			Zapamti me
                    </label>
            </div>
            
             <div class="container-login100-form-btn">
		<button class="login100-form-btn">
                    Potvrdi 
		</button>
            </div>

            <div class="text-center p-t-90">
                <a class="txt1" href="Registracija.jsp">
                    Registracija
                </a>
                <br/>
		<a class="txt1" href="ZaboravljenaLozinka.jsp">
                    Zaboravili lozinku?
                </a>
            </div>
        </form>
                </div>
            </div>
        </div>
             
        <div id="dropDownSelect1"></div>
<!--===============================================================================================-->
                                <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
                                <script>
                                        setTimeout(function (){$('.hideAfter').hide();},4000);
                                </script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
    </body>
</html>
