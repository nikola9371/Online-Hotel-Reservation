<%-- 
    Document   : IzmenaPodatakaHotelAdmin
    Created on : Jun 23, 2019, 5:49:16 AM
    Author     : OEM
--%>

<%@page import="Classes.AdminDao"%>
<%@page import="Classes.MenadzerDao"%>
<%@page import="JavaBean.HotelBean"%>
<%@page import="JavaBean.DrzaveBean"%>
<%@page import="JavaBean.LanciHotelBean"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Izmena podataka o hotelu</title>
        
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
            MenadzerDao menz=new MenadzerDao();
            AdminDao admindao=new AdminDao();
            ArrayList<HotelBean> hotelInfo=admindao.HotelExportDataMenz(Integer.parseInt(request.getAttribute("idHotel").toString()));
            ArrayList<DrzaveBean> drzave=menz.DrzaveInfoExport();
            ArrayList<LanciHotelBean> lanci=menz.LanciHotelaInfoExport();
        %>
        <div class="container" style="padding-top: 10px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Izmena Podataka o hotelu</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errMessage")!=null){ %>
                            <div class="alert alert-warning hideAfter"><strong><%=(request.getAttribute("errMessage")==null)?"" 
                                    :request.getAttribute("errMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                            <% if(request.getAttribute("succMessage")!=null){ %>
                            <div class="alert alert-success hideAfter"><strong><%=(request.getAttribute("succMessage")==null)?"" 
                                    :request.getAttribute("succMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                    <form class="form-horizontal" name="forma" method="post" action="IzmeniHotelPodaciServlet">
                        <input type="hidden" name="type" value="admin">
                        <%for (HotelBean elem : hotelInfo) {%>
                        <div class="form-group">
                            <label for="idTipSobe" class="cols-sm-2 control-label">Identifikacioni kljuc</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="idHotel" value="<%=elem.getId()%>" readonly="true">
                                </div>
                            </div>
                        </div>
                        
                                <div class="form-group">
                                    <label for="ImeHotel" class="cols-sm-2 control-label">Ime hotela</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-hotel" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="ImeHotel" id="HotelIme" value="<%=elem.getIme()%>">
                                        </div>
                                    </div>
                                </div>
                                              
                            <div class="form-group">
                                    <label for="imeLanca" class="cols-sm-2 control-label">Ime lanca</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-chain-broken fa" aria-hidden="true"></i></span>
                                            <select class="form-control" name="imeLanac">
                                                <%
                                                    for (LanciHotelBean elem2 : lanci) {
                                                        if(elem2.getNaziv().equals(elem.getImeLanca())){
                                                %>
                                                    <option value="<%=elem2.getId()%>" selected="true"><%=elem2.getNaziv()%></option>
                                                <%}else{ %>
                                                    <option value="<%=elem2.getId()%>"><%=elem2.getNaziv()%></option>
                                                <%}}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Adresa" class="cols-sm-2 control-label">Adresa</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-address-book" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Adresa" id="AdresaHotela" value="<%=elem.getAdresa()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ImeHotel" class="cols-sm-2 control-label">Mesto</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-hotel" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Mesto" id="HotelIme" value="<%=elem.getMesto()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ImeGrad" class="cols-sm-2 control-label">Grad</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="zmdi zmdi-landscape" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Grad" id="DrzavaIme" value="<%=elem.getGrad()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Drzava" class="cols-sm-2 control-label">Drzava</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="zmdi zmdi-city" aria-hidden="true"></i></span>
                                            <select class="form-control" name="imeDrzava">
                                                <%
                                                    for (DrzaveBean elem3 : drzave) {
                                                        if(elem3.getName().equals(elem.getDrzava())){
                                                %>
                                                    <option value="<%=elem3.getId()%>" selected="true"><%=elem3.getName()%></option>
                                                <%}else{ %>
                                                    <option value="<%=elem3.getId()%>"><%=elem3.getName()%></option>
                                                <%}}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Imejl" class="cols-sm-2 control-label">Imejl</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-mail-reply" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Imejl" id="Imejl" value="<%=elem.getImejl()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Telefon" class="cols-sm-2 control-label">Telefon</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Telefon" id="Telefon" value="<%=elem.getTelefon()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="VebStranica" class="cols-sm-2 control-label">Veb stranica</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="zmdi zmdi-pages" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="VebStranica" id="HotelIme" value="<%=elem.getVebStranica()%>">
                                        </div>
                                    </div>
                                </div>
                        <% }%> 
                                <div class="form-group">
                                    <button class="btn btn-primary btn-lg btn-block login-button">Potvrdi</button>
                                </div>       
                            </form>

                                <div class="login-register">
                                    <a href="HomeAdmin.jsp" class="moje2"><i class="fa fa-arrow-left fa-lg"></i> Nazad</a>
                                </div>
                                
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
<!--===============================================================================================-->
                                <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
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
