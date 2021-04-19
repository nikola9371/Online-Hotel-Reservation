<%-- 
    Document   : IzmeniSlikuHotel
    Created on : Jun 25, 2019, 2:17:37 AM
    Author     : OEM
--%>

<%@page import="JavaBean.HotelBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.MenadzerDao"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Postavljanje slike</title>
        
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
        <link href="vendor/minemenus.css" rel="stylesheet" type="text/css"/>
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    </head>
    <body>
        <%
            HttpSession sesija=request.getSession(false);
            MenadzerDao menz=new MenadzerDao();
            ArrayList<HotelBean> hotelMendz=menz.HotelExportDataMenz(Integer.parseInt(sesija.getAttribute("userID").toString()));
        %>
        <div class="container" style="padding-top: 10px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Promena slike</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errMessage")!=null){ %>
                            <div class="alert alert-warning hideAfter"><strong><%=(request.getAttribute("errMessage")==null)?"" 
                                    :request.getAttribute("errMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                            <% if(request.getAttribute("succMessage")!=null){ %>
                            <div class="alert alert-success hideAfter"><strong><%=(request.getAttribute("succMessage")==null)?"" 
                                    :request.getAttribute("succMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                                    <form id="form1" action="IzmeniSlikuServlet" method="post">
                                        <input type="hidden" name="type" value="mangHotel">
                                        <div class="form-group">
                                            <%for(HotelBean elem:hotelMendz){%>
                                            <input type="hidden" name="idHotel" value="<%=elem.getId()%>">
                                            <img src="images/<%=elem.getSlika()%>" data-altImage="images/no-image.jpg" onerror="this.src=$(this).attr('data-altImage')" width="35%">
                                            <input type="hidden" name="oldImageName" value="<%=elem.getSlika()%>">
                                            <%}%>
                                        </div>
                                        <div class="form-group">
                                            <label for="slika" class="cols-sm-2 control-label">Slika</label>
                                            <div class="cols-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-image fa" aria-hidden="true"></i></span>
                                                    <input type="file" class="form-control" name="slika" id="ImeSkole">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button id="dugme" class="btn btn-primary btn-lg btn-block login-button">Potvrdi</button>
                                        </div>  
                                    </form>
                                <div class="login-register">
                                    <a href="HomeMandg.jsp" class="moje2"><i class="fa fa-arrow-left fa-lg"></i> Nazad</a>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--===============================================================================================-->
                                <script>
                                    $(document).ready(function(){
                                        setTimeout(function (){$('.hideAfter').hide();},4000);
                                        
                                    });
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
