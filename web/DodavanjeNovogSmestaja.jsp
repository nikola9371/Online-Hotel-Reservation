<%-- 
    Document   : DodavanjeNovogSmestaja
    Created on : May 12, 2019, 2:23:16 AM
    Author     : OEM
--%>

<%@page import="JavaBean.TipSobeBean"%>
<%@page import="Classes.MenadzerDao"%>
<%@page import="JavaBean.HotelBean"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Dodavanje novog smestaja</title>
        
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
        <%
            HttpSession sesija=request.getSession(false);
            MenadzerDao mendzInfo=new MenadzerDao();
            ArrayList<HotelBean> hotelMendz=mendzInfo.HotelExportDataMenz(Integer.parseInt(sesija.getAttribute("userID").toString()));
            ArrayList<TipSobeBean> TipSobe=mendzInfo.ManzTipSobeFind();
        %>
               <div class="container" style="padding-top: 10px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Dodavanje novog smestaja:</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errMessage")!=null){ %>
                            <div class="alert alert-warning hideAfter"><strong><%=(request.getAttribute("errMessage")==null)?"" 
                                    :request.getAttribute("errMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                            <% if(request.getAttribute("succMessage")!=null){ %>
                            <div class="alert alert-success hideAfter"><strong><%=(request.getAttribute("succMessage")==null)?"" 
                                    :request.getAttribute("succMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                    <form class="form-horizontal" name="forma" method="post" action="DodavanjeSmestajaServlet" id="forma">
                        <div class="form-group">
                            <label for="TipSobe" class="cols-sm-2 control-label">Tip sobe</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-bed fa" aria-hidden="true"></i></span>
                                    <select class="form-control" name="TipSobe">
                                        <% for (TipSobeBean elem : TipSobe) {%>
                                            <option value="<%=elem.getIdSoba()%>"><%=elem.getTipSobe()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                        </div>
      
                                <div class="form-group">
                                    <label for="Cena" class="cols-sm-2 control-label">Cena</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-money" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control " name="Cena" id="Cena">
                                            <span class="input-group-addon">din.</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="CenaPoeni" class="cols-sm-2 control-label">Cena(u poenima)</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-yen" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control " name="CenaPoeni" id="CenaPoeni">
                                            <span class="input-group-addon">bodova</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="brPonuda" class="cols-sm-2 control-label">Broj ponuda</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="zmdi zmdi-storage" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="brPonuda" id="brPonuda">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Hotel" class="cols-sm-2 control-label">Hotel</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="zmdi zmdi-hotel" aria-hidden="true"></i></span>
                                            <% for(HotelBean elem:hotelMendz){%>
                                                <input type="text" class="form-control" name="Hotel" id="Hotel" disabled="true" value="<%=elem.getIme()%>">
                                                <input type="hidden" name="HotelId" value="<%=elem.getId()%>">
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Opis" class="cols-sm-2 control-label">Opis</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <textarea class="form-control" name="Opis" id="Opis" form="forma" maxlength="100" rows="5" cols="20" wrap="hard"></textarea>
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
