<%-- 
    Document   : Dodelemeng
    Created on : Jun 27, 2019, 12:05:15 AM
    Author     : OEM
--%>

<%@page import="Classes.MenadzerDao"%>
<%@page import="JavaBean.StrucnaSpremaBean"%>
<%@page import="JavaBean.HotelBean"%>
<%@page import="Classes.HoteliDao"%>
<%@page import="Classes.AdminDao"%>
<%@page import="JavaBean.DodelaMengBean"%>
<%@page import="Classes.UserDao"%>
<%@page import="JavaBean.ListUsersBean"%>
<%@page import="JavaBean.MenadzerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
         <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Dodela menadzera</title>
        
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
            UserDao userdao=new UserDao();
            HoteliDao hotelidao=new HoteliDao();
            AdminDao admindao=new AdminDao();
            MenadzerDao menz=new MenadzerDao();
            ArrayList<ListUsersBean> usersAll=userdao.userDataExportAll(Integer.parseInt(sesija.getAttribute("userID").toString()));
            ArrayList<DodelaMengBean> dodelaUsers=admindao.menzDodela();
            ArrayList<HotelBean> listaHotela=hotelidao.prikaziPonude();
            ArrayList<StrucnaSpremaBean> strucnaSprema=menz.StrucnaSpremaDataExport();
        %>
        <div class="container" style="padding-top: 10px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Dodela menadzera</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errMessage")!=null){ %>
                            <div class="alert alert-warning hideAfter"><strong><%=(request.getAttribute("errMessage")==null)?"" 
                                    :request.getAttribute("errMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                            <% if(request.getAttribute("succMessage")!=null){ %>
                            <div class="alert alert-success hideAfter"><strong><%=(request.getAttribute("succMessage")==null)?"" 
                                    :request.getAttribute("succMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                    <form class="form-horizontal" name="forma" method="post" action="DodajNalogServlet">
                        <input type="hidden" name="type" value="adminMangDodela">
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Ime/Prezime</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="Fullname" id="name" placeholder="Unesite svoje Ime i prezime">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Prebivaliste</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user-circle fa" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="prebivaliste" id="userName" placeholder="Unesite prebivaliste">
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Datum rodjenja</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                            <input type="date" class="form-control" name="datumRodj" id="email">
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Adresa</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="adresa" id="password" placeholder="Unesite adresu">
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Skola</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="skola" id="password" placeholder="Unesite ime skole">
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="strucnaSprema" class="cols-sm-2 control-label">Strucna sprema</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                            <select class="form-control" name="strucnaSprema">
                                                <%for(StrucnaSpremaBean elem:strucnaSprema){%>
                                                    <option value="<%=elem.getId()%>"><%=elem.getStepenSpreme()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Telefon</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                            <input type="text" name="telefon" placeholder="Unesite telefon" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Hoteli</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                            <select name="hoteli" class="form-control">
                                                <%for(HotelBean elem:listaHotela){
                                                    for(DodelaMengBean elem2:dodelaUsers){
                                                        if(elem.getId()!=elem2.getIdHotel()){
                                                %>
                                                <option value="<%=elem.getId()%>"><%=elem.getIme()%></option>
                                                <%}}}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Menadzeri</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-handshake-o fa-lg" aria-hidden="true"></i></span>
                                            <select name="menadzeri" class="form-control">
                                                <%for(ListUsersBean elem:usersAll){
                                                    for(DodelaMengBean elem2:dodelaUsers){
                                                        if(elem.getIdUser()!=elem2.getIdUser()){
                                                            if(!elem.getAccType().equals("user")&&!elem.getAccType().equals("admin")){
                                                %>
                                                <option value="<%=elem.getIdUser()%>"><%=elem.getFullName()%></option>
                                                <%}}}}%>
                                            </select>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-lg btn-block login-button">Dodaj</button>
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
