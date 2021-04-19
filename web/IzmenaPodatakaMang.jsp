<%-- 
    Document   : IzmenaPodatakaMang
    Created on : May 16, 2019, 1:28:11 AM
    Author     : OEM
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="JavaBean.StrucnaSpremaBean"%>
<%@page import="JavaBean.MenadzerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.MenadzerDao"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Izmena podataka menadzer</title>
        
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
            HttpSession sesija=request.getSession(false);
            MenadzerDao mendzInfo=new MenadzerDao();
            ArrayList<MenadzerBean> menadzerInfo=mendzInfo.MenzExportData(Integer.parseInt(sesija.getAttribute("userID").toString()));
            ArrayList<StrucnaSpremaBean> strucnaSprema=mendzInfo.StrucnaSpremaDataExport();
        %>
        <div class="container" style="padding-top: 10px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Izmena podataka menadzera</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errMessage")!=null){ %>
                            <div class="alert alert-warning hideAfter"><strong><%=(request.getAttribute("errMessage")==null)?"" 
                                    :request.getAttribute("errMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                            <% if(request.getAttribute("succMessage")!=null){ %>
                            <div class="alert alert-success hideAfter"><strong><%=(request.getAttribute("succMessage")==null)?"" 
                                    :request.getAttribute("succMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                    <form class="form-horizontal" name="forma" method="post" action="IzmeniPodaciAdminServlet">
                        <input type="hidden" name="type" value="mang">
                        <%for (MenadzerBean elem : menadzerInfo) {%>
                        <div class="form-group">
                            <label for="idMang" class="cols-sm-2 control-label">Identifikacioni kljuc</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="idMang" value="<%=elem.getIdManz()%>" readonly="true">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ImePrezime" class="cols-sm-2 control-label">ImePrezime</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="zmdi zmdi-account" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="ImePrezime" value="<%=elem.getImePrezime()%>">
                                </div>
                            </div>
                        </div>
                        
                                <div class="form-group">
                                    <label for="DatumRodjenja" class="cols-sm-2 control-label">Datum rodjenja</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-calendar fa" aria-hidden="true"></i></span>
                                            <input type="date" class="form-control" name="DatumRodjenja" id="DatumRodjenja" value="<%=elem.getGodinaRodjenja()%>" max="<%=LocalDate.now()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Prebivaliste" class="cols-sm-2 control-label">Prebivaliste</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-home fa" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Prebivaliste" id="Prebivaliste" value="<%=elem.getPrebivaliste()%>">
                                        </div>
                                    </div>
                                </div>             
                                <div class="form-group">
                                    <label for="Adresa" class="cols-sm-2 control-label">Adresa stanovanja</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="zmdi zmdi-book" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Adresa" id="money" value="<%=elem.getAdresa()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Telefon" class="cols-sm-2 control-label">Kontakt telefon</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-phone fa" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Telefon" id="Telefon" value="<%=elem.getTelefon()%>">
                                        </div>
                                    </div>
                                </div>
                            <div class="form-group">
                                    <label for="StrucnaSprema" class="cols-sm-2 control-label">Strucna sprema</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="zmdi zmdi-book-photo" aria-hidden="true"></i></span>
                                            <select name="StrucnaSprema" class="form-control">
                                                <% 
                                                    for (StrucnaSpremaBean elem2  :strucnaSprema) {
                                                       if(elem.getStrucnaSprema().equals(elem2.getStepenSpreme())){
                                                %>
                                                <option value="<%=elem2.getId()%>" selected><%=elem2.getStepenSpreme()%></option> 
                                                <%}else{%>
                                                <option value="<%=elem2.getId()%>"><%=elem2.getStepenSpreme()%></option>
                                                <%}}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="ImeSkole" class="cols-sm-2 control-label">Ime skole</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-book fa" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="ImeSkole" id="ImeSkole" value="<%=elem.getSkola()%>">
                                        </div>
                                    </div>
                                </div>
                        <% }%> 
                                <div class="form-group">
                                    <button class="btn btn-primary btn-lg btn-block login-button">Potvrdi</button>
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
