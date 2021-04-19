<%-- 
    Document   : Home
    Created on : Mar 11, 2019, 2:59:30 PM
    Author     : OEM
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Classes.UserDao"%>
<%@page import="JavaBean.IstorijaKupovineBean"%>
<%@page import="org.json.JSONArray"%>
<%@page import="Classes.HoteliDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="JavaBean.RezervacijeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Pocetna strana korisnik</title>
        
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
        <link href="vendor/autocomplete.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession sesija=request.getSession(false);
            HoteliDao hoteliDao=new HoteliDao();
            UserDao userdao=new UserDao();
            ArrayList<RezervacijeBean> rezervacije=hoteliDao.userRezervacije(Integer.parseInt(sesija.getAttribute("userID").toString()));
            JSONArray jsArray=hoteliDao.ImenaHotela();
            ArrayList<IstorijaKupovineBean> istorijaKupovine=userdao.userIstorijaPlacanjaExport(Integer.parseInt(sesija.getAttribute("userID").toString()));
        %>
        
            <script src="vendor/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
            <script src="vendor/bootstrap/js/popper.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
                                                            
        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
            <a class="navbar-brand" href="Home.jsp"><i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
            <button class="navbar-toggler" type="button" data-togle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                
            </button>
            <div class="collapse navbar-collapse" id="navbarSuportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Home.jsp"><i class="zmdi zmdi-home zmdi-hc-border zmdi-hc-fw" style="background: #b5defc;"></i> Pocetna<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="HoteliPonudeServlet"><i class="zmdi zmdi-filter-list zmdi-hc-border zmdi-hc-fw" style="background: #b5defc;"></i>Hotel ponuda</a>
                    </li>
                    <!--<li class="nav-item" >
                        <a class="nav-link" href="NaprednaPretraga.jsp"><i class="zmdi zmdi-select-all zmdi-hc-border zmdi-hc-fw" style="background: #b5defc;"></i>Napredna pretraga</a>
                    </li>-->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="zmdi zmdi-account-box zmdi-hc-border zmdi-hc-fw" style="background: #b5defc;"></i> Korisnicke usluge</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalIstorijaKupovine"><i class="zmdi zmdi-shopping-basket zmdi-hc-fw"></i><i class="zmdi zmdi-book zmdi-hc-fw"></i> Istorija kupovine</a>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalRezervacija"><i class="zmdi zmdi-bookmark zmdi-hc-fw"></i> Rezervacije</a>
                            <a class="dropdown-item" href="Placanje.jsp"><i class="zmdi zmdi-money-box zmdi-hc-fw"></i><i class="zmdi zmdi-arrow-out zmdi-hc-fw"></i> Placanje</a>
                            <a class="dropdown-item" href="Profil.jsp"><i class="zmdi zmdi-account zmdi-hc-fw"></i> Profil</a>
                        </div>
                    </li>
                </ul>
            
            <form class="form-inline my-2 my-lg-0" style="margin-right: 10px;" action="PretragaServlet" method="post" autocomplete="off">
                <div class="autocomplete">
                    <input id="myInput" name="SearchWord" class="form-control mr-sm-2" type="search" placeholder="&#xf002; Pretrazi" aria-label="Search" style="font-family: Arial, FontAwesome"/>
                </div>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Pretrazi</button>
            </form>
                <script>
                    function autocomplete(inp, arr) {
                        /*the autocomplete function takes two arguments,
                        the text field element and an array of possible autocompleted values:*/
                        var currentFocus;
                        /*execute a function when someone writes in the text field:*/
                        inp.addEventListener("input", function(e) {
                            var a, b, i, val = this.value;
                            /*close any already open lists of autocompleted values*/
                            closeAllLists();
                            if (!val) { return false;}
                            currentFocus = -1;
                            /*create a DIV element that will contain the items (values):*/
                            a = document.createElement("DIV");
                            a.setAttribute("id", this.id + "autocomplete-list");
                            a.setAttribute("class", "autocomplete-items");
                            /*append the DIV element as a child of the autocomplete container:*/
                            this.parentNode.appendChild(a);
                            /*for each item in the array...*/
                            for (i = 0; i < arr.length; i++) {
                              /*check if the item starts with the same letters as the text field value:*/
                              if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                                /*create a DIV element for each matching element:*/
                                b = document.createElement("DIV");
                                /*make the matching letters bold:*/
                                b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                                b.innerHTML += arr[i].substr(val.length);
                                /*insert a input field that will hold the current array item's value:*/
                                b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                                /*execute a function when someone clicks on the item value (DIV element):*/
                                b.addEventListener("click", function(e) {
                                    /*insert the value for the autocomplete text field:*/
                                    inp.value = this.getElementsByTagName("input")[0].value;
                                    /*close the list of autocompleted values,
                                    (or any other open lists of autocompleted values:*/
                                    closeAllLists();
                                });
                                a.appendChild(b);
                              }
                            }
                        });
                        /*execute a function presses a key on the keyboard:*/
                        inp.addEventListener("keydown", function(e) {
                            var x = document.getElementById(this.id + "autocomplete-list");
                            if (x) x = x.getElementsByTagName("div");
                            if (e.keyCode == 40) {
                              /*If the arrow DOWN key is pressed,
                              increase the currentFocus variable:*/
                              currentFocus++;
                              /*and and make the current item more visible:*/
                              addActive(x);
                            } else if (e.keyCode == 38) { //up
                              /*If the arrow UP key is pressed,
                              decrease the currentFocus variable:*/
                              currentFocus--;
                              /*and and make the current item more visible:*/
                              addActive(x);
                            } else if (e.keyCode == 13) {
                              /*If the ENTER key is pressed, prevent the form from being submitted,*/
                              e.preventDefault();
                              if (currentFocus > -1) {
                                /*and simulate a click on the "active" item:*/
                                if (x) x[currentFocus].click();
                              }
                            }
                        });
                        function addActive(x) {
                          /*a function to classify an item as "active":*/
                          if (!x) return false;
                          /*start by removing the "active" class on all items:*/
                          removeActive(x);
                          if (currentFocus >= x.length) currentFocus = 0;
                          if (currentFocus < 0) currentFocus = (x.length - 1);
                          /*add class "autocomplete-active":*/
                          x[currentFocus].classList.add("autocomplete-active");
                        }
                        function removeActive(x) {
                          /*a function to remove the "active" class from all autocomplete items:*/
                          for (var i = 0; i < x.length; i++) {
                            x[i].classList.remove("autocomplete-active");
                          }
                        }
                        function closeAllLists(elmnt) {
                          /*close all autocomplete lists in the document,
                          except the one passed as an argument:*/
                          var x = document.getElementsByClassName("autocomplete-items");
                          for (var i = 0; i < x.length; i++) {
                            if (elmnt != x[i] && elmnt != inp) {
                              x[i].parentNode.removeChild(x[i]);
                            }
                          }
                        }
                        /*execute a function when someone clicks in the document:*/
                        document.addEventListener("click", function (e) {
                            closeAllLists(e.target);
                        });
                      }
                      /*An array containing all the country names in the world:*/
                      var countries =<%=jsArray%>;

                      /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
                      autocomplete(document.getElementById("myInput"), countries);    
                </script>
            </div>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a title="odjava" class="nav-link" href="LogoutServlet"><i class="zmdi zmdi-sign-in zmdi-hc-2x"></i></a>
                        </li>
                    </ul>
        </nav>

                
        <div id="carouselmain" class="carousel slide carousel-fade" data-ride="carousel" data-interval="10000" data-pause="hover">
            <ol class="carousel-indicators">
                <li data-target="#carouselmain" data-slide-to="0" class="active"></li>
                <li data-target="#carouselmain" data-slide-to="1"></li>
                <li data-target="#carouselmain" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/Slider1.jpg" alt="First slide" >
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Zlatiborska planina</h5>
                        <p style="color: white;">Zlatibor ukras na 1.000 metara visine</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/Slider2.jpg" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Stara planina</h5>
                        <p style="color: white;">Pogled sa vrha Stare planine</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/Slider3.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Planina Kopaonik</h5>
                        <p style="color: white;">Vrhovi Kopaonik skijaskog centra</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselmain" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Prethodni</span>
            </a>
            <a class="carousel-control-next" href="#carouselmain" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Sledeci</span>
            </a>
        </div>
            <div id="modalRezervacija" class="modal fade" role="dialog" arialabellebdy="modal-title">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Pregled rezervacija:</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <% if(rezervacije.size()==0){%>
                                            <h5>Trenutno nemate nijednu rezervaciju</h5>
                                            
                                        <%}else{ %>
                                            <ul style="list-style: none;">
                                              <%   for (RezervacijeBean elem : rezervacije) {
                                                  
                                                    LocalDate now=LocalDate.now();
                                                    LocalDate dateBefore=LocalDate.parse(elem.getDatumRezervacije());
                                                    LocalDate dateAfter=LocalDate.parse(elem.getDatumIstekaRezervacije());
                                                long daysbetweennow=ChronoUnit.DAYS.between(now, dateAfter);%>
                                                <li><h6><b>Hotel:</b><u><%=elem.getImeHotela()%></u> <b>Datum rezervacije:</b><u><%=elem.getDatumRezervacije()%></u> 
                                                     <% if(daysbetweennow>0){%>
                                                     <b>Istice za:</b><u><%=daysbetweennow%> dana</u>
                                                     <a href="#" class="btn btn-link brisanje-rezervacije" style="color: red;" title="obrisi" id="brisanje-rezervacija"><i class="fa fa-trash"></i></a>
                                                     <%}else{%>
                                                     <span class="text-danger">Istekla rezervacija!</span>
                                                     <a href="#" class="btn btn-link" title="rezervisi ponovo"><i class="zmdi zmdi-calendar"></i></a>
                                                     <a href="#" class="btn btn-link brisanje-rezervacije" style="color: red;" title="obrisi" id="brisanje-rezervacija"><i class="fa fa-trash"></i></a>
                                        <%} %>
                                                    </h6></li>
                                                    <script type="text/javascript" charset="ut8" src="vendor/jquery/jquery.confirm.min.js"></script>
                                                    <script>
                                                        $(document).ready(function (){
                                                        $('.brisanje-rezervacije').confirm({
                                                           text: "Da li zelite da obrisete rezervaciju?",
                                                           title: "Brisanje rezervacije",
                                                           confirm: function(button){
                                                               window.location.href="BrisanjeRezervacijeServlet?idRez="+<%=elem.getIdRez()%>+"&page=home";
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
                                        <%}%>
                                              </ul>
                                        <%}%>
                                    </div>
                                    <%if(rezervacije.size()==0){%>
                                        <div class="modal-footer">
                                            <button class="btn btn-default" style="cursor: pointer;" disabled="">Placanje</button>
                                        </div>
                                    <%}else{%>
                                        <div class="modal-footer">
                                            <button class="btn btn-default" style="cursor: pointer;" onclick="window.location.href('Placanje.jsp')">Placanje</button>
                                        </div>
                                    <%}%>
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
                        <div id="ModalSucc" class="modal fade" role="dialog" aria-labellebdy="modal-title" data-backdrop="static">
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
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="window.location.href('Home.jsp')">Zatvori</button>
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
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
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
