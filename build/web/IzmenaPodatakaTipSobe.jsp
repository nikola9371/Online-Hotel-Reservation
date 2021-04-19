<%-- 
    Document   : IzmenaPodatakaTipSobe
    Created on : May 3, 2019, 1:46:47 AM
    Author     : OEM
--%>

<%@page import="JavaBean.TipSobeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.MenadzerDao"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Izmena podataka Tip Sobe</title>
        
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
            MenadzerDao mendz=new MenadzerDao();
            ArrayList<TipSobeBean> tipSoba=mendz.TipSobeExportDataMenz2(Integer.parseInt(request.getAttribute("idSobe").toString()));
            ArrayList<String> TipSobaOznake=mendz.TipSobeImeSort(mendz.TipSobeSelect());
        %>
         <div class="container" style="padding-top: 10px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Izmena Podataka Tipa Sobe</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errMessage")!=null){ %>
                            <div class="alert alert-warning hideAfter"><strong><%=(request.getAttribute("errMessage")==null)?"" 
                                    :request.getAttribute("errMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                            <% if(request.getAttribute("succMessage")!=null){ %>
                            <div class="alert alert-success hideAfter"><strong><%=(request.getAttribute("succMessage")==null)?"" 
                                    :request.getAttribute("succMessage")%></strong><button class="close" onclick="$('.hideAfter').hide();">&times;</button></div>
                                    <% }%>
                    <form class="form-horizontal" name="forma" method="post" action="IzmeniTipSobeServlet">
                        <%for (TipSobeBean elem : tipSoba) {%>
                        <div class="form-group">
                            <label for="idTipSobe" class="cols-sm-2 control-label">Identifikacioni kljuc</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="idTipSobe" value="<%=elem.getIdSoba()%>" readonly="true">
                                </div>
                            </div>
                        </div>
                        
                                <div class="form-group">
                                    <label for="iznosUplata" class="cols-sm-2 control-label">Skraceni naziv tipa sobe</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-creative-commons fa" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="OznakaTipaSobe" id="money" value="<%=elem.getOznakaSobe()%>" maxlength="5">
                                        </div>
                                    </div>
                                </div>
                                              
                            <div class="form-group">
                                    <label for="iznosUplata" class="cols-sm-2 control-label">Tip sobe</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-hotel fa" aria-hidden="true"></i></span>
                                            <select name="oznakeSobeList" class="form-control">
                                                <% 
                                                    for (String elem2 :TipSobaOznake) {
                                                        if(elem.getTipSobe().equals(elem2)){
                                                %>
                                                <option value="<%=elem2%>" selected><%=elem2%></option> 
                                                <%}else{%>
                                                <option value="<%=elem2%>"><%=elem2%></option>
                                                <%}}%>
                                            </select>
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
                                        $("#Izmeni").click(function (){
                                           $("#forma").find('.remove').removeAttr('readonly');
                                        });
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
