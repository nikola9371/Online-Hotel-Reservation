<%-- 
    Document   : SlikeSmestaj
    Created on : Jun 25, 2019, 3:30:33 AM
    Author     : OEM
--%>

<%@page import="JavaBean.SlikeSobaBean"%>
<%@page import="Classes.HoteliDao"%>
<%@page import="Classes.MenadzerDao"%>
<%@page import="JavaBean.HotelSobeMenzBean"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Slike smestaj</title>
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
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <link href="vendor/minemenus.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession sesija=request.getSession(false);
            HoteliDao hoteli=new HoteliDao();
            ArrayList<SlikeSobaBean> slikesobe=hoteli.slikesoba(Integer.parseInt(request.getAttribute("idPonuda").toString()));
            
        %>
            <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                <div class="navbar-header">
                    <a class="navbar-brand" href="HomeMandg.jsp" ><i class="zmdi zmdi-arrow-left zmdi-hc-lg"></i> <i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
                </div>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#modalDodajSliku" href="">Dodaj sliku</a></li>
                </ul>
            </nav>
        <div class="container p-t-15 p-b-15">
            
            <div class="card-columns">
                <%for(SlikeSobaBean elem:slikesobe){%>
                <div class="card" style="width: 18rem;">
                    <img src="images/rooms/<%=elem.getIme()%>" width="100%">
                </div>
                <%}%>
            </div>
        </div>
            <div id="modalDodajSliku" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Dodavanje sliku smestaja</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                                                                <form id="form1" action="IzmeniSlikuServlet" method="post">
                                                                    <input type="hidden" name="type" value="slikaSmestaj">
                                                                    <input type="hidden" name="idPonuda" value="<%=request.getAttribute("idPonuda")%>">
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
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                        </div>
                    </div>
                </div>
            </div>
                        <div id="ModalSucc" class="modal fade" role="dialog" aria-labellebdy="modal-title" data-backdrop="static">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4>Poruka o uspehu</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <h3><%=request.getAttribute("SuccMessage")%></h3>
                                        <i class="fa fa-check-circle fa-4x" style="color:green;padding-left: 40%;"></i>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                                                                    
                                                                    <%if(request.getAttribute("SuccMessage")!=null){%>
                                                                        <script>
                                                                            $(window).on('load',function(){
                                                                                $('#ModalSucc').modal('show');
                                                                            }) ;
                                                                        </script>
                                                                    <%}%>
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
