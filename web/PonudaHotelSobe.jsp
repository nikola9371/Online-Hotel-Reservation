<%-- 
    Document   : PonudaHotelSobe
    Created on : May 17, 2019, 11:18:11 PM
    Author     : OEM
--%>
<%@page import="Classes.HoteliDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="JavaBean.RezervacijeBean"%>
<%@page import="JavaBean.SlikeSobaBean"%>
<%@page import="JavaBean.HotelSobeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Ponuda smestaj</title>
        
        <script src="vendor/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
                                                        <!--VARIOUS ICONS-->
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <link href="vendor/minemenus.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            ArrayList<HotelSobeBean> sobePonude=(ArrayList<HotelSobeBean>) request.getAttribute("listaSobaPonuda");
            ArrayList<RezervacijeBean> rezervacije=(ArrayList<RezervacijeBean>) request.getAttribute("listaRezervacija");
        %>
        
        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
            <%
                if(request.getAttribute("type")!=null&&request.getAttribute("searchWord")!=null){
                if(request.getAttribute("type").equals("pretraga")){
            %>
            <form id="Pretraga" method="post" action="PretragaServlet">
                <input type="hidden" name="SearchWord" value="<%=request.getAttribute("searchWord")%>">
            </form>
            <a class="navbar-brand" href="#" id="submitLink"><i class="zmdi zmdi-arrow-left zmdi-hc-lg"></i> <i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
            <script>
                $(window).ready(function(){
                    $('#submitLink').on('click',function(){
                       $('#Pretraga').submit(); 
                    });
                });
            </script>
            <%}}else if(request.getAttribute("type")!=null&&request.getAttribute("type").equals("admin")){%>
            <a class="navbar-brand" href="HomeAdmin.jsp"><i class="zmdi zmdi-arrow-left zmdi-hc-lg"></i> <i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
                <!--<ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link" href="">Dodaj sliku</a></li>
                </ul>-->
            <%}else{%>
                <a class="navbar-brand" href="HoteliPonudeServlet"><i class="zmdi zmdi-arrow-left zmdi-hc-lg"></i> <i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
            <%}%>
            <button class="navbar-toggler" type="button" data-togle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                
            </button>
            <%if(request.getAttribute("type")!=null&&request.getAttribute("type").equals("admin")){%>
                
                <%}else{%>
            <div class="collapse navbar-collapse" id="navbarSuportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="Profil.jsp" class="nav-link"><i class="zmdi zmdi-account zmdi-hc-fw"></i> <span style="font-size: 13px">Profil</span></a>
                    </li>
                    <li class="nav-item" >
                        <a href="" class="nav-link" data-toggle="modal" data-target="#modalRezervacija" title="pregled rezervacija">
                          <i class="zmdi zmdi-bookmark-outline zmdi-hc-fw"></i> <span style="font-size: 13px">Rezervacije</span>
                        </a>
                    </li>
                </ul>
            </div>   
                <%}%>
        </nav>

                                <!--Potrebni zbog pokretanja modala, iz nekog razloga trazi popper, ko zna zasto, samo on zna valjda -->
                   	<script src="vendor/bootstrap/js/popper.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" charset="ut8" src="vendor/jquery/jquery.confirm.min.js"></script>
        
        <div class="container">
           <div class="card-columns">
              <% for(HotelSobeBean elem:sobePonude){%> 
                <div class="card" style="width: 18rem;">
                            <% HoteliDao hoteli=new HoteliDao();
                                ArrayList<SlikeSobaBean> slikesobe=hoteli.slikesoba(elem.getIdPonude());%>
                                <% if(slikesobe.size()>0){%>
                        <div id="carouselExample<%=slikesobe.get(1).getIdSlike()%>" class="carousel slide" data-ride="carousel" data-interval="10500">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="images/rooms/<%=slikesobe.get(0).getIme()%>" width="100%" data-altImage="images/no-image.jpg" onerror="this.src=$(this).attr('data-altImage')">
                                </div>
                                    <%slikesobe.remove(0);%>
                                     <% for(SlikeSobaBean elem2:slikesobe){%>
                                 <div class="carousel-item">
                                     <img class="d-block w-100" src="images/rooms/<%=elem2.getIme()%>" width="100%" data-altImage="images/no-image.jpg" onerror="this.src=$(this).attr('data-altImage')">
                                 </div>
                                 <%}%>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExample<%=slikesobe.get(0).getIdSlike()%>" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                                <span class="sr-only">Prethodni</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExample<%=slikesobe.get(0).getIdSlike()%>" role="button" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                                <span class="sr-only">Sledeci</span>
                            </a>
                        </div>
                          <%}else{%>
                            <img src="images/no-image.jpg" width="100%"> 
                          <%}%>
                    <div class="card-body">
                        <h5 class="card-title">Lanac: <%=elem.getImeLanca()%></h5>
                        <%if(elem.getOpis().length()>60){
                            String skraceno=elem.getOpis().substring(0, 100);
                        %>
                        <p class="card-text"><%=skraceno%>.. <a href="" style="text-decoration: none;" data-target="#opisVise" data-toggle="modal" data-opis="<%=elem.getOpis()%>">vise</a></p>
                        <%}else{%>
                        <p class="card-text"><%=elem.getOpis()%></p>
                        <%}%>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><i class="fa fa-bed" title="Tip sobe"></i> <%=elem.getTip()%></li>
                        <li class="list-group-item"><i class="fa fa-money" title="Cena"></i> <%=elem.getCena()%>din. [<%=elem.getCenaUpoenima()%> bodova]</li>
                        <li class="list-group-item"><i class="fa fa-calendar-check-o" title="Datum postavljanja"></i> <%=elem.getdatum_postavljanja()%></li>
                    </ul>
                    <div class="card-body">
                        <%if(request.getAttribute("type")!=null&&request.getAttribute("type").equals("admin")){%>
                            <a href="#" class="card-link brisanje-ponuda" role="button" title="izbrisi ponudu"><i class="fa fa-trash-o fa-2x moje5"></i></a>
                        <% }else{
                            HttpSession sesija=request.getSession(false);
                            if(hoteli.ProveraDaLiJeRezervisano(Integer.parseInt(sesija.getAttribute("userID").toString()), elem.getIdPonude())=="Uspesno"){
                                if(hoteli.BrojZalihaOstalih(elem.getIdPonude())==0){
                        %>
                        <a href="#" class="card-link" role="button" title="nema vise ponuda" style="color:red;" disabled><i class="fa fa-lock fa-2x"></i></a>
                        <%}else{%>
                        <a href="#" class="card-link" role="button" title="dodaj rezervaciju" data-toggle="modal" data-target="#dodajRezervaciju" data-idponude="<%=elem.getIdPonude()%>"><i class="fa fa-cart-plus fa-2x"></i></a>
                        <%}}else{%>
                        <a href="#" class="card-link" role="button" style="color:green;" disabled><i class="fa fa-check fa-2x"></i></a>
                        <%}%>
                        <a href="#" class="card-link" role="button" title="pomoc" data-toggle="modal" data-target="#pomocUsluga"><i class="fa fa-question-circle-o fa-2x moje4"></i></a>
                        <%}%>
                    </div>
                </div>
                                                    <script>
                                                        $('.brisanje-ponuda').confirm({
                                                           text: "Da li zelite da obrisete ponudu?",
                                                           title: "Brisanje ponude",
                                                           confirm: function(button){
                                                               window.location.href="BrisanjeServlet?idPonude=<%=elem.getIdPonude()%>&type=adminPonuda&idHotel=<%=request.getAttribute("idHotel")%>";
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
        </div>
           <div id="dodajRezervaciju" class="modal fade" role="dialog">
               <div class="modal-dialog">
                   <div class="modal-content">
                        <div class="modal-header">
                            <h4>Dodavanje rezervacije</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form action="SobePonudeServlet" method="post" id="forma1">
                                <input type="hidden" name="idPonude" id="idPonude" value="">
                                <input type="hidden" name="idHotel" id="idHotel" value="<%=request.getAttribute("idHotel")%>">
                                <div class="form-group">
                                    <div class="cols-sm-10">
                                        <label class="cols-sm-2 control-label">Datum dolazka</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-sign-in"></i></span>
                                            <input class="form-control" type="date" name="datumRegistracije" min="<%=LocalDate.now()%>" max="<%=LocalDate.now().plusYears(1)%>" value="<%=LocalDate.now()%>">
                                        </div>
                                        <label class="cols-sm-2 control-label">Datum odlaska</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-sign-out"></i></span>
                                            <input class="form-control" type="date" name="datumOdlaska" min="<%=LocalDate.now().plusDays(1)%>" max="<%=LocalDate.now().plusYears(1)%>" value="<%=LocalDate.now().plusDays(1)%>">
                                        </div>
                                        <label class="cols-sm-2 control-label" style="margin-top: 3.5px;">Sobe</label>
                                        <div class="input-group" style="margin-top: 3px;">
                                            <span class="input-group-addon"><i class="fa fa-bed"></i></span>
                                            <select name="brSoba">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                    <button class="btn btn-primary login-button dugme-rezervacija" style="margin-left: 33%;cursor: pointer;">Potvrdi registraciju</button>
                            </form>
                        </div>
                        <div class="modal-footer">

                        </div>
                   </div>
               </div>
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
                                              <% for (RezervacijeBean elem : rezervacije) {
                                                  
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
                                                    
                                                    <script>
                                                        $('.brisanje-rezervacije').confirm({
                                                           text: "Da li zelite da obrisete rezervaciju?",
                                                           title: "Brisanje rezervacije",
                                                           confirm: function(button){
                                                               window.location.href="BrisanjeRezervacijeServlet?idRez="+<%=elem.getIdRez()%>+"&idHotel="+<%=request.getAttribute("idHotel")%>+"&page=PonudaHotelSobe";
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
                            <button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="window.location.href('SobePonudeServlet?id=<%=request.getAttribute("idHotel")%>')">Zatvori</button>
                        </div>
                    </div>
                </div>
            </div>
                            <div id="opisVise" class="modal fade" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4>Opis smestaja:</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p id="opisModal"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script>
                               $('#opisVise').on('show.bs.modal',function(event){
                                   var button=$(event.relatedTarget);
                                   var opis=button.data('opis');
                                   var modal=$(this);
                                   
                                   modal.find('#opisModal').html(opis);
                               }) ;
                               $('#dodajRezervaciju').on('show.bs.modal',function(event){
                                  var button=$(event.relatedTarget);
                                  var idponude=button.data('idponude');
                                  var modal=$(this);
                                  
                                  modal.find('#idPonude').val(idponude);
                               });                            
                               $('.dugme-rezervacija').confirm({
                                 text: "Da li zelite da rezervisete?",
                                 title: "Potvrda rezervacije",
                                 confirm: function(button){
                                    $("#forma1").submit();  
                                                          },
                                 cancel: function(button){
                                    $("#forma1").submit(function(e){
                                        e.preventDefault(); 
                                                                   });
                                                         },
                                 confirmButton: "Da",
                                 cancelButton: "Ne",
                                 post: true,
                                 confirmButtonClass: "btn-success",
                                 cancelButtonClass: "btn-danger",
                                 dialogClass: "modal-dialog modal-sm"
                                 });
                            </script>
            <%if(request.getAttribute("SuccMsg")!=null){%>
        <script>
            $(window).on('load',function(){
                $('#ModalSucc').modal('show');
            }) ;
        </script>
        <%}%>
    </body>
</html>
