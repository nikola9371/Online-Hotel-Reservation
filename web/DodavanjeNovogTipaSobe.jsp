<%-- 
    Document   : DodavanjeNovogTipaSobe
    Created on : May 3, 2019, 1:41:27 AM
    Author     : OEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorpage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Dodavanje novog tipa sobe</title>
        
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
        <link href="vendor/minemenus.css" rel="stylesheet" type="text/css"/>
<!--===============================================================================================-->
    </head>
    <body>
                <div class="container" style="padding-top: 10px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Dodavanje novog tipa sobe:</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errMessage")!=null){ %>
                            <div class="alert alert-warning hideAfter"><strong><%=(request.getAttribute("errMessage")==null)?"" 
                                    :request.getAttribute("errMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                            <% if(request.getAttribute("succMessage")!=null){ %>
                            <div class="alert alert-success hideAfter"><strong><%=(request.getAttribute("succMessage")==null)?"" 
                                    :request.getAttribute("succMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                    <form class="form-horizontal" name="forma" method="post" action="DodavanjeTipaSobeServlet" id="forma">
                        <div class="form-group">
                            <label for="OznakaTipa" class="cols-sm-2 control-label">Skracena oznaka tipa sobe</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-creative-commons fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="OznakaTipa" maxlength="5">
                                </div>
                            </div>
                        </div>
      
                                <div class="form-group">
                                    <label for="TipSobe" class="cols-sm-2 control-label">Tip sobe</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-bed" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control input100" name="TipSobe" id="TipSobe" maxlength="15">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-lg btn-block login-button disabled">Potvrdi</button>
                                </div>       
                            </form>
                                <div class="login-register grupa">
                                    <a href="HomeMandg.jsp" class="moje2"><i class="fa fa-arrow-left fa-lg"></i> Nazad</a>
                                </div>
                                
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
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
