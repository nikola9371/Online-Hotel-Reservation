<%-- 
    Document   : SmestajDetaljnije
    Created on : May 10, 2019, 3:29:54 PM
    Author     : OEM
--%>

<%@page import="JavaBean.TipSobeBean"%>
<%@page import="Classes.MenadzerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JavaBean.HotelSobeMenzBean"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Smestaj detaljnije</title>
        
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
    </head>
    <body>
        <%
            ArrayList<HotelSobeMenzBean> sobe=(ArrayList<HotelSobeMenzBean>) request.getAttribute("menzSobe");
            MenadzerDao menz=new MenadzerDao();
            ArrayList<TipSobeBean> TipSobe=menz.ManzTipSobeFind();
        %>
        <div class="container" style="padding-top: 10px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Detaljni podaci o smestaju:</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errMessage")!=null){ %>
                            <div class="alert alert-warning hideAfter"><strong><%=(request.getAttribute("errMessage")==null)?"" 
                                    :request.getAttribute("errMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                            <% if(request.getAttribute("succMessage")!=null){ %>
                            <div class="alert alert-success hideAfter"><strong><%=(request.getAttribute("succMessage")==null)?"" 
                                    :request.getAttribute("succMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                    <form class="form-horizontal" name="forma" method="post" action="SmestajDetaljnijeServlet" id="forma">
                        <%for (HotelSobeMenzBean elem : sobe) {%>
                        <div class="form-group">
                            <label for="idSmestaj" class="cols-sm-2 control-label">Identifikacioni kljuc</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="idSmestaj" value="<%=elem.getIdPonude()%>" readonly="true">
                                </div>
                            </div>
                        </div>
                        
                                <div class="form-group">
                                    <label for="Datum" class="cols-sm-2 control-label">Datum postavljanja</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Datum" id="Datum" value="<%=elem.getDatumPostavljanja()%>" disabled="true">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="TipSobe" class="cols-sm-2 control-label">Tip sobe</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-hotel" aria-hidden="true"></i></span>
                                            <select name="TipSobe" class="form-control remove" readonly="true">
                                                <%
                                                    for(TipSobeBean elem2:TipSobe){
                                                    if(elem.getTipSobe().equals(elem2.getTipSobe())){    
                                                %>
                                                <option value="<%=elem2.getIdSoba()%>" selected><%=elem2.getTipSobe()%></option>
                                                <%}else{%>
                                                <option value="<%=elem2.getIdSoba()%>"><%=elem2.getTipSobe()%></option>
                                                <%}}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="BrPonuda" class="cols-sm-2 control-label">Broj ponuda</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="zmdi zmdi-storage" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control remove" name="brPonuda" id="brPonuda" value="<%=elem.getBrPonudaZaliha()%>" readonly="true">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Cena" class="cols-sm-2 control-label">Cena(u dinarima)</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-money" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control remove" name="Cena" id="Cena" value="<%=elem.getCena()%>" readonly="true">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="CenaB" class="cols-sm-2 control-label">Cena(u bodovima)</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-yen" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control remove" name="CenaB" id="CenaB" value="<%=elem.getCenaUpoenima()%>" readonly="true">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Opis" class="cols-sm-2 control-label">Opis</label>
                                    <div class="cols-sm-10" id="grupa2">
                                        <div class="input-group">
                                            <textarea class="form-control remove" readonly="true" form="forma" maxlength="6000" rows="5" cols="20" wrap="hard" name="opis"><%=elem.getOpis()%></textarea>
                                        </div>
                                    </div>
                                </div>
                        <% }%> 
                                <div class="form-group">
                                    <button class="btn btn-primary btn-lg btn-block login-button disabled">Potvrdi</button>
                                </div>       
                            </form>
                                <div class="login-register grupa">
                                    <a href="HomeMandg.jsp" class="moje2"><i class="fa fa-arrow-left fa-lg"></i> Nazad</a>
                                    <button type="button" id="Izmeni" class="btn btn-light"><i class="fa fa-edit"></i> Izmeni</button>
                                </div>
                                
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
                                <script>
                                    $(document).ready(function(){
                                        $("#Izmeni").click(function (){
                                           $("#forma").find('.remove').removeAttr('readonly');
                                        });
                                        setTimeout(function (){$('.hideAfter').hide();},4000);
                                        
                                    });
                                </script>
<!--===============================================================================================-->
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
