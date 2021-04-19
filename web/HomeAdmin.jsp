<%-- 
    Document   : HomeAdmin
    Created on : Apr 28, 2019, 1:22:25 AM
    Author     : OEM
--%>

<%@page import="JavaBean.IstorijaKupovineBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Classes.AdminDao"%>
<%@page import="JavaBean.ListUsersBean"%>
<%@page import="JavaBean.RacunBean"%>
<%@page import="Classes.UserDao"%>
<%@page import="JavaBean.MenadzerBean"%>
<%@page import="Classes.MenadzerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JavaBean.HotelBean"%>
<%@page import="Classes.HoteliDao"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Pocetna strana administrator</title>
        
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
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <link href="vendor/minemenus.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession sesija=request.getSession(false);
            HoteliDao hotelidao=new HoteliDao();
            MenadzerDao menzdao=new MenadzerDao();
            AdminDao admindao=new AdminDao();
            UserDao userdao=new UserDao();
            ArrayList<HotelBean> listaHotela=hotelidao.prikaziPonude();
            ArrayList<MenadzerBean> listaMendz=menzdao.MenzExportDataAll();
            ArrayList<RacunBean> rezervacijeAll=userdao.userRacunExportAll();
            ArrayList<ListUsersBean> usersAll=userdao.userDataExportAll(Integer.parseInt(sesija.getAttribute("userID").toString()));
            ArrayList<IstorijaKupovineBean> istorijaKupovine=admindao.userIstorijaPlacanjaExport();
        %>
        
        <script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        
        <nav class="navbar navbar-expand-lg navbar-light justify-content-between" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="HomeAdmin.jsp"><i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
            <button class="navbar-toggler" type="button" data-togle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                
            </button>
            <div class="collapse navbar-collapse" id="navbarSuportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="HomeAdmin.jsp"><i class="zmdi zmdi-home zmdi-hc-fw"></i> Pocetna<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Usluge administratora</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item btn btn-link" data-toggle="modal" data-target="#modalHoteliInfo" style="cursor: default;"><i class="fa fa-hotel"></i> Informacije o hotelima</a>
                            <a class="dropdown-item btn btn-link" data-toggle="modal" data-target="#modalMenadzInfo" style="cursor: default;"><i class="zmdi zmdi-male"></i> Informacije o menadzerima</a>
                            <a class="dropdown-item btn btn-link" data-toggle="modal" data-target="#modalRezervacijeInfo" style="cursor: default;"><i class="fa fa-bookmark-o"></i> Informacije o rezervacijama</a>
                            <a class="dropdown-item btn btn-link" data-toggle="modal" data-target="#modalNaloziPregled" style="cursor: default;"><i class="fa fa-users"></i> Pregled svih naloga</a>
                            <a class="dropdown-item btn btn-link" data-toggle="modal" data-target="#modalIstorijaKupovine" style="cursor: default;"><i class="fa fa-money"></i><i class="fa fa-arrow-circle-up"></i> Istorija placanja</a>
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
        <div id="modalHoteliInfo" class="modal fade" role="dialog" data-backdrop="static">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Informacije o hotelima</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm text-primary">Id</div>
                            <div class="col-sm text-primary">Ime</div>
                            <div class="col-sm text-primary">Adresa</div>
                            <div class="col-sm text-primary">Grad</div>
                            <div class="col-sm text-warning">Detaljnije</div>
                        </div>
                        <%for(HotelBean elem:listaHotela){%>
                        <div class="row">
                            <div class="col-sm"><%=elem.getId()%></div>
                            <div class="col-sm"><%=elem.getIme()%></div>
                            <div class="col-sm"><%=elem.getAdresa()%></div>
                            <div class="col-sm"><%=elem.getGrad()%></div>
                            <div class="col-sm">
                                <a href="IzmeniHotelPodaciServlet?idHotel=<%=elem.getId()%>" role="button" class="btn btn-link btn-sm" title="detaljnije"><i class="fa fa-edit fa-2x"></i></a>
                                <a href="SobePonudeServlet?id=<%=elem.getId()%>&type=admin" role="button" class="btn btn-link btn-sm" title="ponude smestaji"><i class="fa fa-search fa-2x"></i></a>
                                <a href="#" role="button" class="btn btn-link btn-sm brisanjeHotel" title="brisanje hotela"><i class="fa fa-trash-o fa-2x brisanjeHotel moje5"></i></a>
                                <!--<a href="#" role="button" class="btn btn-link btn-sm" title="izmeni sliku"><i class="zmdi zmdi-image-o zmdi-hc-2x moje6"></i></a>-->
                            </div>
                        </div>
                       <hr>
                                        <script type="text/javascript" charset="ut8" src="vendor/jquery/jquery.confirm.min.js"></script>
                                                        <script>
    
                                                            $('.brisanjeHotel').confirm({
                                                                text: "Da li zelite da obrisete hotel?",
                                                                title: "Brisanje hotela",
                                                                confirm: function(button){
                                                                    window.location.href="BrisanjeServlet?idHotel="+<%=elem.getId()%>+"&type=adminHotel";
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
                                                       
                                                        </script>
                        <%}%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                        <button type="button" class="btn btn-outline-success" onclick="window.location.href('DodajNoviHotel.jsp')">Dodaj novi</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="modalMenadzInfo" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Informacije o menadzerima</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm text-primary">Ime/Prezime</div>
                                <div class="col-sm text-primary">G.Rodjenja</div>
                                <div class="col-sm text-primary">Prebivaliste</div>
                                <div class="col-sm text-primary">Adresa</div>
                                <div class="col-sm text-primary">Hotel</div>
                                <div class="col-sm text-warning">Detaljnije</div>
                            </div>
                            <%for(MenadzerBean elem:listaMendz){%>
                            <div class="row">
                                <div class="col-sm"><%=elem.getImePrezime()%></div>
                                <div class="col-sm"><%=elem.getGodinaRodjenja()%></div>
                                <div class="col-sm"><%=elem.getPrebivaliste()%></div>
                                <div class="col-sm"><%=elem.getAdresa()%></div>
                                <div class="col-sm"><%=elem.getImeHotel()%></div>
                                <div class="col-sm">
                                    <a href="IzmeniPodaciAdminServlet?idManz=<%=elem.getIdManz()%>&type=mandz" role="button" class="btn btn-link btn-sm" title="izmeni"><i class="fa fa-edit fa-2x"></i></a>
                                    <a href="" role="button" class="btn btn-link btn-sm brisanjeMenadzer" title="obrisi"><i class="fa fa-trash-o fa-2x moje5"></i></a>
                                </div>
                            </div>
                                                        <script>
                                                            $('.brisanjeMenadzer').confirm({
                                                                text: "Da li zelite da obrisete menadzera?",
                                                                title: "Brisanje menadzera",
                                                                confirm: function(button){
                                                                    window.location.href="BrisanjeServlet?idManz=<%=elem.getIdManz()%>&type=adminMang";
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
                                                        </script>
                            <%}%>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                            <button type="button" class="btn btn-outline-success" onclick="window.location.href('DodelaMeng.jsp')">Dodeli menadzera</button>
                        </div>
                    </div>
            </div>
            </div>
        <div id="modalRezervacijeInfo" class="modal fade"role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Informacije o rezervacijama</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm text-primary">D.Rezervacije</div>
                            <div class="col-sm text-primary">D.Isteka</div>
                            <div class="col-sm text-primary">Hotel</div>
                            <div class="col-sm text-primary">Korisnik</div>
                            <div class="col-sm text-warning"></div>
                        </div>
                            <%for(RacunBean elem:rezervacijeAll){%>
                            <div class="row">
                                <div class="col-sm"><%=elem.getDatumRezervacije()%></div>
                                <div class="col-sm"><%=elem.getDatumIsteka()%></div>
                                <div class="col-sm"><%=elem.getImeHotela()%></div>
                                <div class="col-sm"><%=elem.getImeKorisnik()%></div>
                                <div class="col-sm">
                                    <a href="" role="button" class="btn btn-link btn-sm brisanjeRezervacija" title="izbrisi"><i class="fa fa-trash-o fa-2x moje5"></i></a>
                                </div>
                            </div>
                                                        <script>
                                                            $('.brisanjeRezervacija').confirm({
                                                                text: "Da li zelite da obrisete rezervaciju?",
                                                                title: "Brisanje rezervacije",
                                                                confirm: function(button){
                                                                    window.location.href="BrisanjeRezervacijeServlet?idRez=<%=elem.getIdRez()%>&page=admin";
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
                                                        </script>
                            <%}%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="modalNaloziPregled" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Pregled naloga</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm text-primary">Id</div>
                            <div class="col-sm text-primary">Korisnicko ime</div>
                            <div class="col-sm text-primary">Tip</div>
                            <div class="col-sm text-primary">D.registracije</div>
                            <div class="col-sm text-primary">Imejl</div>
                            <div class="col-sm text-warning"></div>
                        </div>
                        <%for(ListUsersBean elem:usersAll){%>
                        <div class="row">
                            <div class="col-sm"><%=elem.getIdUser()%></div>
                            <div class="col-sm"><%=elem.getUserName()%></div>
                            <div class="col-sm"><%=elem.getAccType()%></div>
                            <div class="col-sm"><%=elem.getRegDate()%></div>
                            <div class="col-sm"><%=elem.getEmail()%></div>
                            <div class="col-sm">
                                <a href="IzmeniServlet?idUser=<%=elem.getIdUser()%>&type=adminNalog" class="btn btn-link btn-sm" role="button"><i class="fa fa-edit fa-2x"></i></a>
                                <a href="BrisanjeServlet?idUser=<%=elem.getIdUser()%>&accType=<%=elem.getAccType()%>&type=adminNalog" class="btn btn-link btn-sm brisanjeNalog" role="button"><i class="fa fa-trash-o fa-2x moje5"></i></a>
                            </div>
                        </div>
                        <hr>
                                                        <script>
                                                            $('.brisanjeNalog').confirm({
                                                                text: "Da li zelite da obrisete nalog?",
                                                                title: "Brisanje nalog",
                                                                confirm: function(button){
                                                                    window.location.href="BrisanjeServlet?idUser=<%=elem.getIdUser()%>&accType=<%=elem.getAccType()%>&type=adminNalog";
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
                                                        </script>
                        <%}%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                        <button type="button" class="btn btn-outline-success" onclick="window.location.href('DodajNalog.jsp')">Dodaj novi</button>
                    </div>
               </div>
            </div>
        </div>
                                <div id="modalIstorijaKupovine" class="modal fade" role="dialog">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4>Istorija kupovine</h4>
                                                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm text-primary">Id <i class="fa fa-key"></i></div>
                                                    <div class="col-sm text-primary">Datum uplate <i class="fa fa-calendar"></i></div>
                                                    <div class="col-sm text-primary">Korisnik <i class="fa fa-user-md"></i></div>
                                                    <div class="col-sm text-primary">Nacin placanja <i class="fa fa-credit-card-alt"></i></div>
                                                </div>
                                                <%for(IstorijaKupovineBean elem:istorijaKupovine){%>
                                                    <%
                                                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
                                                        SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
                                                        Date parseDate=dateFormat.parse(elem.getDatumUplate());
                                                        String date=sdf.format(parseDate);
                                                    %>
                                                <div class="row">
                                                    <div class="col-sm"><%=elem.getId()%></div>
                                                    <div class="col-sm"><%=date%></div>
                                                    <hr>
                                                    <div class="col-sm"><%=elem.getImeKorisnika()%></div>
                                                    <hr>
                                                    <div class="col-sm"><%=elem.getNacinPlacanja()%></div>    
                                                </div>
                                                <%}%>
                                            </div>
                                            <div class="modal-footer">
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
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="window.location.href('HomeAdmin.jsp')">Zatvori</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="ModalErr" class="modal fade" role="dialog" aria-labellebdy="modal-title">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4>Greska</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <h3><%=request.getAttribute("ErrMsg")%></h3>
                                        <i class="fa fa-exclamation-triangle fa-4x" style="color:red;padding-left: 40%;"></i>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="window.location.href('HomeAdmin.jsp')">Zatvori</button>
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
                        <%}else if(request.getAttribute("ErrMsg")!=null){%>
                        <script>
                              $(window).on('load',function (){
                                  $('#ModalErr').modal('show');
                              }) ;
                        </script>
                        <%}%>
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
