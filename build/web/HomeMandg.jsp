<%-- 
    Document   : HomeMandz
    Created on : Apr 28, 2019, 1:22:11 AM
    Author     : OEM
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="JavaBean.HotelSobeMenzBean"%>
<%@page import="JavaBean.TipSobeBean"%>
<%@page import="JavaBean.HotelBean"%>
<%@page import="javax.mail.Session"%>
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
        <title>Pocetna strana menadzer</title>
        
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
            MenadzerDao mendzInfo=new MenadzerDao();
            ArrayList<MenadzerBean> menadzerInfo=mendzInfo.MenzExportData(Integer.parseInt(sesija.getAttribute("userID").toString()));
            ArrayList<HotelBean> hotelMendz=mendzInfo.HotelExportDataMenz(Integer.parseInt(sesija.getAttribute("userID").toString()));
            ArrayList<TipSobeBean> tipsobe=mendzInfo.TipSobeExportDataMenz();
            ArrayList<HotelSobeMenzBean> menzsobe=mendzInfo.ManzHotelSobeExport(Integer.parseInt(sesija.getAttribute("userID").toString()));
        %>
        
        <nav class="navbar navbar-expand-lg navbar-light justify-content-between" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="HomeMandg.jsp"><i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
            <button class="navbar-toggler" type="button" data-togle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                
            </button>
            <div class="collapse navbar-collapse" id="navbarSuportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="HomeMandg.jsp"><i class="zmdi zmdi-home zmdi-hc-fw"></i> Pocetna<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Menadzerske usluge</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item btn btn-link" data-toggle="modal" data-target="#HotelInformacije" style="cursor: default;"><i class="zmdi zmdi-hotel"></i> Informacije o hotelu</a>
                            <a class="dropdown-item btn btn-link" data-toggle="modal" data-target="#SobaDodavanje" style="cursor: default;"><i class="zmdi zmdi-border-style"></i> Ponude smestaja</a>
                            <a class="dropdown-item btn btn-link" data-toggle="modal" data-target="#TipSobe" style="cursor: default;"><i class="zmdi zmdi-border-color"></i> Tipovi soba</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Informacije o menadzeru</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink2">
                            <a class="dropdown-item btn btn-link" type="button" data-toggle="modal" data-target="#MenadzerProfil"><i class="zmdi zmdi-account" style="cursor: default;"> Profil</i></a>
                        </div>
                    </li>
                </ul>
            </div>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a title="odjava" class="nav-link" href="LogoutServlet"><i class="zmdi zmdi-sign-in zmdi-hc-2x"></i></a>
                        </li>
                    </ul>
            
        </nav>
        <div id="MenadzerProfil" class="modal fade" role="dialog" aria-labellebdy="modal-title">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Informacije o menadzeru:</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                <td style="padding-right: 10px;">
                                <% for (MenadzerBean elem : menadzerInfo) {%>
                                <ul>
                                    <li>
                                        <p><i class="zmdi zmdi-account zmdi-hc-border zmdi-hc-fw"></i> <%=elem.getImePrezime()%></p>
                                    </li>
                                    <li>
                                        <p><i class="zmdi zmdi-calendar-note zmdi-hc-border zmdi-hc-fw"></i> <%=elem.getGodinaRodjenja()%></p>
                                    </li>
                                    <li>
                                        <p><i class="zmdi zmdi-hotel zmdi-hc-border zmdi-hc-fw"></i> <%=elem.getImeHotel()%></p>
                                    </li>
                                    <li>
                                        <p><i class="zmdi zmdi-book zmdi-hc-border zmdi-hc-fw"></i> <%=elem.getAdresa()%></p>
                                    </li>
                                    <li>
                                        <p><i class="zmdi zmdi-home zmdi-hc-border zmdi-hc-fw"></i> <%=elem.getPrebivaliste()%></p>
                                    </li>
                                    <li>
                                        <p><i class="zmdi zmdi-phone-in-talk zmdi-hc-border zmdi-hc-fw"></i> <%=elem.getTelefon()%></p>
                                    </li>
                                    <li>
                                        <p><i class="zmdi zmdi-book-photo zmdi-hc-border zmdi-hc-fw"></i> <%=elem.getStrucnaSprema()%></p>
                                    </li>
                                    <li>
                                        <p><i class="zmdi zmdi-book zmdi-hc-border zmdi-hc-fw"></i> <%=elem.getSkola()%></p>
                                    </li>
                                </ul>
                                </td>
                                <td style="padding: 0 0 0 10px">
                                    <img src="images/<%=elem.getSlika()%>" data-altImage="images/no-image.jpg" onerror="this.src=$(this).attr('data-altImage')" width="300px"/>
                                </td>
                            </tr>
                            <% }%>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" href="" class="btn btn-outline-secondary" onclick="window.location.href='PostaviSliku.jsp'">Postavi sliku</button>
                        <button type="button" href="" class="btn btn-outline-success" onclick="window.location.href='IzmenaPodatakaMang.jsp'">Izmeni podatke</button>
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="HotelInformacije" class="modal fade" role="dialog" aria-labellebdy="modal-title">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Informacije o hotelu:</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <% for (HotelBean elem : hotelMendz) {%> 
                        <div class="row">
                            <div class="col-sm-6">
                            <ul>
                                <li><span><i class="zmdi zmdi-hotel zmdi-hc-border zmdi-hc-fw"></i></span><span style="color: #009999; font-weight: bold; text-decoration: underline; font-family: cursive"> Ime hotela:</span> <%=elem.getIme()%></li>
                                <li><span><i class="zmdi zmdi-chart zmdi-hc-border zmdi-hc-fw"></i></span><span style="color: #009999; font-weight: bold; text-decoration: underline; font-family: cursive"> Ime lanca hotela:</span> <%=elem.getImeLanca()%></li>
                                <li><span><i class="zmdi zmdi-label zmdi-hc-border zmdi-hc-fw"></i></span><span style="color: #009999; font-weight: bold; text-decoration: underline; font-family: cursive"> Adresa hotela:</span> <%=elem.getAdresa()%></li>
                                <li><span><i class="zmdi zmdi-landscape zmdi-hc-border zmdi-hc-fw"></i></span><span style="color: #009999; font-weight: bold; text-decoration: underline; font-family: cursive"> Mesto:</span> <%=elem.getMesto()%></li>
                                <li><span><i class="zmdi zmdi-city zmdi-hc-border zmdi-hc-fw"></i></span><span style="color: #009999; font-weight: bold; text-decoration: underline; font-family: cursive"> Grad:</span> <%=elem.getGrad()%></li>
                                <li><span><i class="zmdi zmdi-map zmdi-hc-border zmdi-hc-fw"></i></span><span style="color: #009999; font-weight: bold; text-decoration: underline; font-family: cursive"> Drzava:</span> <%=elem.getDrzava()%></li>
                                <li><span><i class="zmdi zmdi-mail-send zmdi-hc-border zmdi-hc-fw"></i></span><span style="color: #009999; font-weight: bold; text-decoration: underline; font-family: cursive"> Imejl adresa:</span> <%=elem.getImejl()%></li>
                                <li><span><i class="zmdi zmdi-phone-in-talk zmdi-hc-border zmdi-hc-fw"></i></span><span style="color: #009999; font-weight: bold; text-decoration: underline; font-family: cursive"> Telefon hotela:</span> <%=elem.getTelefon()%></li>
                                <li><span><i class="zmdi zmdi-pages zmdi-hc-border zmdi-hc-fw"></i></span><span style="color: #009999; font-weight: bold; text-decoration: underline; font-family: cursive"> Veb stranica hotela:</span> <a class="moje2" href="<%=elem.getVebStranica()%>"><%=elem.getVebStranica()%></a></li>
                            </ul>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/<%=elem.getSlika()%>" data-altImage="images/no-image.jpg" onerror="this.src=$(this).attr('data-altImage')" width="300px"> 
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" onclick="window.location.href('IzmeniSlikuHotel.jsp')">Izmeni sliku</button>
                        <button type="button" class="btn btn-outline-success" onclick="window.location.href='IzmenPodatakaHotelMeng.jsp'">Izmeni podatke</button>
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="SobaDodavanje" class="modal fade" role="dialog" aria-labellebdy="modal-title">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Ponude smestaja:</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">  
                        <table>
                            <% for(HotelSobeMenzBean elem: menzsobe){%>
                                <%
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
                                    SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
                                    Date parseDate=dateFormat.parse(elem.getDatumPostavljanja());
                                    String date=sdf.format(parseDate);
                                %>
                                    <tr>
                                        <td style="padding-bottom: 1.5px;"><span style="border-width: 2px;border-style: double;padding-right: 5px; padding-left: 2px;background-color: #e3e0e0;"><i class="zmdi zmdi-key"></i><span style="font-weight: bold; font-style: italic; font-family: fantasy">Sifra:</span></span> <i class="fa fa-arrow-right"></i></td> <td style="padding-left: 1.5px;padding-right: 10px;" align="center"><%=elem.getIdPonude()%></td>
                                        <td style="padding-bottom: 1.5px;"><span style="border-width: 2px;border-style: double;padding-right: 5px; padding-left: 2px;background-color:  #e3e0e0;"><i class="fa fa-calendar"></i><span style="font-weight: bold;font-style: italic;font-family: fantasy">Datum postavljanja:</span></span> <i class="fa fa-arrow-right"></i></td> <td style="padding-left: 1.5px;padding-right: 10px;" align="center"><%=date%></td>
                                        <td style="padding-bottom: 1.5px;"><span style="border-width: 2px;border-style: double;padding-right: 5px; padding-left: 2px;background-color: #e3e0e0;"><i class="fa fa-hotel"></i><span style="font-weight: bold;font-style: italic; font-family: fantasy">Tip:</span></span> <i class="fa fa-arrow-right"></i></td> <td style="padding-left: 1.5px;padding-right: 10px;" align="left"><%=elem.getTipSobe()%></td>
                                        <td align="center" style="padding-bottom: 1.5px;"><span style="padding-left: 5px;"><a href="SmestajDetaljnijeServlet?idPonuda=<%=elem.getIdPonude()%>" title="detaljnije"><i class="fa fa-edit fa-2x" style="color: black;"></i></a></span></td>
                                        <td align="center" style="padding-bottom: 1.5px;"><span style="padding-left: 5px;"><a href="IzmeniSlikuServlet?idPonuda=<%=elem.getIdPonude()%>&type=mang" title="pregled slika"><i class="fa fa-image fa-2x" style="color: blue;"></i></a></span></td>
                                        <td align="center" style="padding-bottom: 1.5px;padding-left: 2.5px;"><span style="padding-left: 5px;"><a href="ObrisiSmestajServlet?idPonuda=<%=elem.getIdPonude()%>" title="brisanje" class="brisanjeSmestaj"><i class="fa fa-trash fa-2x moje5"></i></a></span></td>
                                    </tr>
                                                        <script type="text/javascript" charset="ut8" src="vendor/jquery/jquery.confirm.min.js"></script>
                                                        <script>
                                                            $(document).ready(function(){
                                                            $('.brisanjeSmestaj').confirm({
                                                                text: "Da li zelite da obrisete smestaj?",
                                                                title: "Brisanje smestaja",
                                                                confirm: function(button){
                                                                    window.location.href="ObrisiSmestajServlet?idPonuda="+<%=elem.getIdPonude()%>;
                                                                },
                                                                cancel: function(button){

                                                                },
                                                                confirmButton: "Da",
                                                                cancelButton: "Ne",
                                                                post: true,
                                                                confirmButtonClass: "btn-danger",
                                                                cancelButtonClass: "btn-default",
                                                                dialogClass: "modal-dialog modal-sm"
                                                            }); 
                                                            });
                                                        </script>
                           <% }%>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-success" onclick="window.location.href='DodavanjeNovogSmestaja.jsp'">Dodaj novi</button>
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="TipSobe" class="modal fade" role="dialog" aria-labellebdy="modal-title">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Tipovi soba:</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <table>
                            <%for (TipSobeBean elem : tipsobe) {%>
                            <tr>
                                <td style="padding-bottom: 1.5px;"><span style="border-width: 2px;border-style: double;background-color: #e3e0e0; padding-right: 2px;"><i class="zmdi zmdi-key"></i><span style="font-weight: bold; font-style: italic; font-family: fantasy">Sifra:</span></span> <i class="fa fa-arrow-right"></i></td> <td style="padding-left: 1.5px;padding-right: 10px;" align="center"><%=elem.getIdSoba()%></td>
                                <td style="padding-bottom: 1.5px;"><span style="border-width: 2px;border-style: double;background-color:  #e3e0e0;padding-right: 2px;"><i class="fa fa-creative-commons"></i><span style="font-weight: bold;font-style: italic;font-family: fantasy">Oznaka:</span></span> <i class="fa fa-arrow-right"></i></td> <td style="padding-left: 1.5px;padding-right: 10px;" align="center"><%=elem.getOznakaSobe()%></td>
                                <td style="padding-bottom: 1.5px;"><span style="border-width: 2px;border-style: double;background-color: #e3e0e0;padding-right: 2px;"><i class="fa fa-hotel"></i><span style="font-weight: bold;font-style: italic; font-family: fantasy">Tip:</span></span> <i class="fa fa-arrow-right"></i></td> <td style="padding-left: 1.5px;padding-right: 10px;" align="left"><%=elem.getTipSobe()%></td>
                                <td align="center" style="padding-bottom: 1.5px;"><span><a href="IzmeniTipSobeServlet?idSoba=<%=elem.getIdSoba()%>" title="izmena podataka"><i class="fa fa-edit" style="color: black;"></i></a></span></td>
                            </tr>
                            <% }%>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-success" onclick="window.location.href='DodavanjeNovogTipaSobe.jsp'">Dodaj novi</button>
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                    </div>
                </div>
            </div>
        </div>
                        <div id="ModalSucc" class="modal fade" role="dialog" aria-labellebdy="modal-title">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4>Poruka o uspehu</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <h3><%=request.getAttribute("SuccMsg")%></h3>
                                        <i class="fa fa-check-circle fa-4x" style="color:green;padding-left: 40%;"></i>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="window.location.href('HomeMandg.jsp')">Zatvori</button>
                                    </div>
                                </div>
                            </div>
                        </div>      
                            <%if(request.getAttribute("SuccMsg")!=null){%>
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
