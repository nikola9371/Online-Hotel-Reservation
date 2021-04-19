<%-- 
    Document   : Profil
    Created on : Apr 7, 2019, 11:40:14 PM
    Author     : OEM
--%>

<%@page import="JavaBean.StanjeBean"%>
<%@page import="Classes.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JavaBean.LoginBean"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Korisnicki profil</title>
        
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
        <link href="vendor/sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/minemenus.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            UserDao userDao=new UserDao();
            HttpSession sesija=request.getSession(false);
            ArrayList<LoginBean> userDetails=userDao.userDataExport(Integer.parseInt(sesija.getAttribute("userID").toString()));
        %>
        <!-- The sidebar -->
        <div class="sidebar">
          <a class="active" href="HoteliPonudeServlet"><i class="zmdi zmdi-arrow-left zmdi-hc-lg"></i> <i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
          <a href="#" role="button" class="btn btn-link btn-sm" style="text-decoration: none;" data-toggle="modal" data-target="#myModal3">Podaci o korisniku</a>
          <a href="#" role="button" class="btn btn-link btn-sm" style="text-decoration: none;" data-toggle="modal" data-target="#myModal2">Promena lozinke</a>
          <a href="#" role="button" class="btn btn-link btn-sm" style="text-decoration: none;" data-toggle="modal" data-target="#myModal">Provera stanja</a>
          <a href="Placanje.jsp" class="btn btn-link btn-sm nav-link">Placanje rezervacija</a>
        </div>

        <!-- Page content -->
        <div class="content">
            <% for (LoginBean elem : userDetails) {  %>
            <div id="myModal" class="modal fade" role="dialog" aria-labellebdy="modal-title"> 
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Trenutno stanje</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                                <p><i class="fa fa-money fa-2x"> <%=elem.getStanje()%> dinara</i></p>
                                <p><i class="fa fa-gg fa-2x"> <%=elem.getBodovi()%> bodova</i></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default moje" data-dismiss="modal">Zatvori</button>
                            <a  href="Uplata.jsp" class="btn btn-link btn-default moje" style="text-decoration: none; color: black;">Uplati</a>
                        </div>
                    </div>
                </div>
            </div>
                        
            <div id="myModal2" class="modal fade" role="dialog" aria-labellebdy="modal-title"> 
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Promena lozinke</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Kliknite na dugme <i>"promeni lozinku"</i> da biste promenili lozinku, i pratite uputstva</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default moje" data-dismiss="modal">Zatvori</button>
                            <a href="PromenaLozinke.jsp" class="btn btn-link btn-default moje" style="text-decoration: none; color: black;">Promeni lozinku</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="myModal3" class="modal fade" role="dialog" aria-labellebdy="modal-title"> 
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Korisnik <%=elem.getFullName()%></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p><i class="fa fa-user fa-2x"></i><b>Username:</b> <%=elem.getUserName()%></p>
                            <p><i class="fa fa-user-secret fa-2x"></i><b>Tip korisnika:</b> <%=elem.getUserType()%></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default moje" data-dismiss="modal">Zatvori</button>
                            <a href="#" class="btn btn-default moje" style="text-decoration: none; color: black;">Istorija kupovine</a>
                        </div>
                    </div>
                </div>
            </div>
            <% }%>
        </div>
        
        
<!--===============================================================================================-->      
        
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.min.js"></script>
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
