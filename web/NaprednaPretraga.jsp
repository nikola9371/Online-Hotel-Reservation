<%-- 
    Document   : NaprednaPretraga
    Created on : Apr 15, 2019, 6:53:44 PM
    Author     : OEM
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="JavaBean.HotelBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.UserDao"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Napredna pretraga</title>
        
<!--===============================================================================================-->	
        <script type="text/javascript" charset="utf8" src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/jquery/bootstrap_glavni_tabele.css">
        <!--Iskljucena zbog nemogucnosti pokretanja stilizovanog DataTable ako se ukljuci-->
        <!--<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">-->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================--
<!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/jquery/DataTables/css/dataTables.bootstrap.min.css">
    </head>
    <body>
        <%
            UserDao userDao=new UserDao();
            ArrayList<HotelBean> hoteli=userDao.userHoteliInfo();
            ArrayList<String> Gradovi=userDao.userHoteliGradSort(hoteli);
            ArrayList<String> Mesto=userDao.userHoteliMestoSort(hoteli);
            ArrayList<String> Ime=userDao.userHoteliImeSort(hoteli);
        %>
        
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="Home.jsp" class="navbar-brand"><i class="zmdi zmdi-arrow-left zmdi-hc-lg"></i> <i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
            </div>
            <span class="navbar-text">Pretraga po:</span>
            <a style="padding-left: 5px; text-decoration: none;" class="btn btn-link" type="button" data-toggle="collapse" href="#navbarToggle" aria-controls="navbarToggle" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-angle-double-down fa-2x"></i> <span>Grad,Mesto</span>
            </a> 
            <a style="padding-left: 5px; text-decoration: none;" class="btn btn-link" type="button" data-toggle="collapse" href="#navbarToggle2" aria-controls="navbarToggle" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-angle-double-down fa-2x"></i> <span>Naziv,Ocena</span>
            </a>
        </nav>
        <div class="row">
            <div class="col-sm-3">
                <div class="collapse" id="navbarToggle" style="padding:0 5px 5px 15px;">
                    <form name="forma" action="NaprednaPretragaServlet" method="post">
                        <input type="hidden" name="pretraga" value="mesto">
                        <table frame="hsides" style="background-color: #ededed">
                            <tr>
                                <th style="text-align: center;">Grad <i class="fa fa-building-o"></i></th>
                                <th style="text-align: center;">Mesto <i class="fa fa-building"></i></th>
                            </tr>
                            <tr>
                                <td style="padding-bottom: 5px; padding-right: 5px; padding-left: 5px;">
                                    <input list="gradovi" name="gradovi">
                                    <datalist id="gradovi">
                                        <% for (String elem : Gradovi) { %>
                                        <option><%=elem%></option>
                                        <% }%>
                                    </datalist>
                                </td>
                                <td style="padding-bottom: 5px; padding-right: 5px;">
                                    <input list="mesto" name="mestoList">
                                    <datalist id="mesto">
                                        <%for (String elem : Mesto) {%>
                                        <option value="<%=elem%>"></option>
                                        <%}%>
                                    </datalist>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" style="padding-bottom: 5px;">
                                    <button class="btn btn-default" type="submit">Potvrdi</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>  
            </div>
                    <div class="col-sm-3">
                        <div class="collapse" id="navbarToggle2" style="padding: 0 5px 5px 15px;">
                            <form name="forma2" action="NaprednaPretragaServlet" method="post">
                                <input type="hidden" name="pretraga" value="ocena">
                            <table frame="hsides" style="background-color: #ededed;">
                                <tr>
                                    <th style="text-align: center;">Naziv <i class="fa fa-hotel"></i></th>
                                    <th style="text-align: center;">Broj zvezdica <i class="fa fa-star"></i></th>
                                    <th style="text-align: center;">Gugl ocena <i class="fa fa-google"></i></th>
                                </tr>
                                <tr>
                                    <td style="padding: 0 5px 10px 5px;">
                                        <select name="nameHotel">
                                        <% for(String elem: Ime){%>
                                        <option value="<%=elem%>"><%=elem%></option>
                                        <%}%>
                                        </select>
                                    </td>
                                    <td style="padding: 0 5px 10px 0">
                                        <select name="brojZvezdica">
                                        <option value="nista">(-Izaberite jednu-)</option>
                                        <option value="1">&star;</option>
                                        <option value="2">
                                            <%for(int i=0;i<2;i++){%>
                                                &star;
                                            <%}%>
                                        </option>
                                        <option value="3">
                                            <%for(int i=0;i<3;i++){%>
                                                &star;
                                            <%}%>
                                        </option>
                                        <option value="4">
                                            <%for(int i=0;i<4;i++){%>
                                                &star;
                                            <%}%>
                                        </option>
                                        <option value="5">
                                            <%for(int i=0;i<5;i++){%>
                                                &star;
                                            <%}%>
                                        </option>
                                        </select>
                                    </td>
                                    <td style="padding: 0 5px 10px 0">
                                        <select name="guglOcena">
                                        <option value="nista">(-Izaberite jednu-)</option>
                                        <option value="1">0&ShortRightArrow;1</option>
                                        <option value="2">1&ShortRightArrow;2</option>
                                        <option value="3">2&ShortRightArrow;3</option>
                                        <option value="4">3&ShortRightArrow;4</option>
                                        <option value="5">4&ShortRightArrow;5</option>
                                        <option value="6">5&ShortRightArrow;6</option>
                                        <option value="7">6&ShortRightArrow;7</option>
                                        <option value="8">7&ShortRightArrow;8</option>
                                        <option value="9">8&ShortRightArrow;9</option>
                                        <option value="10">9&ShortRightArrow;10</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center" style="padding-bottom: 5px;">
                                        <button class="btn btn-default" type="submit">Potvrdi</button>
                                    </td>
                                </tr>
                            </table>
                            </form>
                        </div>
                    </div>
        </div>
                                            <%=request.getAttribute("1")%>
                                            <%=request.getAttribute("2")%>
                 
                                
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
        <!--Iskljucena zbog nemogucnosti pokretanja stilizovanog DataTable ako se ukljuci-->
	<!--<script src="vendor/bootstrap/js/bootstrap.min.js"></script>-->
        <script src="vendor/jquery/bootstrap_glavni_tabele.js"></script>
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
