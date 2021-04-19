<%-- 
    Document   : Pretraga
    Created on : Jun 21, 2019, 9:19:46 PM
    Author     : OEM
--%>

<%@page import="JavaBean.HotelBean"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Stranica za pretragu</title>
        
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="vendor/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
                                                        <!--VARIOUS ICONS-->
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/util.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
                                             <!--Potrebni zbog pokretanja modala, iz nekog razloga trazi popper, ko zna zasto, samo on zna valjda -->
                   	<script src="vendor/bootstrap/js/popper.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" charset="ut8" src="vendor/jquery/jquery.confirm.min.js"></script>
        <%
            ArrayList<HotelBean> listaHotela=(ArrayList<HotelBean>) request.getAttribute("hoteliLista");
        %>
        <div class="container" style="padding-top: 10px; padding-bottom: 10px;">
            <% if(listaHotela.size()>0){%>
            <h4>Rezultat pretrage</h4>
            <hr>
                    <div class="row">
                        <div class="col-sm text-primary">Ime</div>
                        <div class="col-sm text-primary">Adresa</div>
                        <div class="col-sm text-primary">Mesto</div>
                        <div class="col-sm text-primary">Grad</div>
                    </div>
                    <%for(HotelBean elem:listaHotela){%>
                    <div class="row">
                        <div class="col-sm"><%=elem.getIme()%></div>
                        <div class="col-sm"><%=elem.getAdresa()%></div>
                        <div class="col-sm"><%=elem.getMesto()%></div>
                       <div class="col-sm"><%=elem.getGrad()%></div>
                       <a href="SobePonudeServlet?id=<%=elem.getId()%>&type=pretraga&word=<%=request.getAttribute("searchWord")%>" role="button" class="btn btn-link btn-sm" title="ponude soba"><i class="fa fa-search fa-2x"></i></a>
                    </div>
                    <hr>
                    <%}%>
                    <div class="row">
                        <button class="btn btn-info" onclick="window.location.href('Home.jsp')"><i class="fa fa-arrow-left"></i> Prethodna strana</button>
                    </div>
            <%}else{%>
            <h4>Nema rezultata</h4>
            <%}%>
        </div>
    </body>
</html>
