<%-- 
    Document   : newjsp
    Created on : May 17, 2019, 12:42:08 AM
    Author     : OEM
--%>
<%@page import="JavaBean.RezervacijeBean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="JavaBean.HotelBean"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        
                                                <!--DATATABLE-->
        <!--===============================================================================================-->	
        <script src="vendor/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="vendor/DataTable_Bootstrapv4/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="vendor/DataTable_Bootstrapv4/DataTables-1.10.18/js/dataTables.bootstrap4.js" type="text/javascript"></script>
        <link href="vendor/DataTable_Bootstrapv4/DataTables-1.10.18/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <!--===============================================================================================-->
        
                                                <!--VARIOUS ICONS-->
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <title>Ponuda svih postojecih hotela</title>
    </head>
    <body>
        <%
            ArrayList<HotelBean> hotelPonude=(ArrayList<HotelBean>) request.getAttribute("listaHotela");
            ArrayList<RezervacijeBean> rezervacije=(ArrayList<RezervacijeBean>) request.getAttribute("listaRezervacija");
        %>
        <script>
            $(document).ready(function(){
                $('#example').dataTable({
                    "pagingType": "full_numbers",
                                "language":{
                                    "emptyTable": "Nema unosa",
                                    "info": "Prikazano, od _START_ do _END_ ,od ukupno _TOTAL_ rezultata",
                                    "infoEmpty": "Prikazuje od 0 do 0 od 0 rezultata",
                                    "lengthMenu": "Prikazi _MENU_ rezultata po strani",
                                    "search": "Pretraga",
                                    "loadingRecords": "Ucitava...",
                                    "zeroRecords": "Nema rezultata",
                                    "infoFiltered": "(Pronadjeno od _MAX_ unosa)",
                                    "paginate":{
                                        "first": "Prva",
                                        "last": "Poslednja",
                                        "next": "Sledeca",
                                        "previous": "Prethoda"
                                    }
                                  },
                                  "aria":{
                                      "sortAscending": ": activate to sort column ascending",
                                      "sortDescending": ": activate to sort column descending" 
                                  }
                });
            });
        </script>
        
        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
            <a class="navbar-brand" href="Home.jsp"><i class="zmdi zmdi-arrow-left zmdi-hc-lg"></i> <i class="zmdi zmdi-airplane"></i><span style="font-family: cursive; font-style: oblique">nHoteli</span></a>
            <button class="navbar-toggler" type="button" data-togle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                
            </button>
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
        </nav>
        
        <div class="container" style="padding-top: 15px;padding-bottom: 15px;">
        <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>Slika hotela <i class="zmdi zmdi-image"></i></th>
                <th>Ime <i class="fa fa-hotel"></i></th>
                <th>Drzava <i class="zmdi zmdi-map"></i></th>
                <th>Broj zvezdica <i class="zmdi zmdi-star"></i></th>
                <th>Gugl ocena <i class="zmdi zmdi-google"></i></th>
                <th>Kontrole <i class="zmdi zmdi-settings"></i></th>
            </tr>
        </thead>
        <tbody>
        <%
          for (HotelBean elem : hotelPonude) {
        %>
            <tr>
                <td align="center">
                    <a id="pop" href="" data-toggle="modal" data-target="#modalPop">
                        <img id="imageresource" style="width: 100px; height: 75px;" 
                             src="images/<%=elem.getSlika()%>" 
                             onerror="this.src=$(this).attr('data-altImage')"
                             data-imagesrc="<%=elem.getSlika()%>"
                             data-imagedescrt="<%=elem.getIme()%>"
                             data-toggle="modal"
                             data-target="#imagemodal">
                    </a>
                </td>
                <td><%=elem.getIme()%></td>
                <td><%=elem.getDrzava()%></td>
                <td>
                <% for(int i=0;i<elem.getBrZvezdica();i++){%>
                    <i class="zmdi zmdi-star"></i>
                <%}%>
                </td>
                <td><%=elem.getGuglOcena()%></td>
                <td>
                    <button style="cursor: pointer;" type="button" class="btn btn-link btn-sm" data-toggle="modal" data-target="#modalInfo" title="vise informacija"
                            data-title="<%=elem.getIme()%>" 
                            data-adresa="<%=elem.getAdresa()%>"
                            data-mesto="<%=elem.getMesto()%>"
                            data-grad="<%=elem.getGrad()%>"
                            data-telefon="<%=elem.getTelefon()%>"
                            data-imejl="<%=elem.getImejl()%>"
                            data-veb="<%=elem.getVebStranica()%>"
                            data-slika="<%=elem.getSlika()%>"
                            data-imelanca="<%=elem.getImeLanca()%>"
                            data-id="<%=elem.getId()%>">
                        <i class="fa fa-info-circle fa-2x"></i>
                    </button>
                        <a href="SobePonudeServlet?id=<%=elem.getId()%>" role="button" class="btn btn-link btn-sm" title="ponude soba"><i class="fa fa-search fa-2x"></i></a>
                </td>
            </tr>
        <%}%>
        </tbody>
        <tfoot>
            <tr>
                <th>Slika hotela</th>
                <th>Ime</th>
                <th>Drzava</th>
                <th>Broj zvezdica</th>
                <th>Gugl ocena</th>
                <th>Kontrole</th>
            </tr>
        </tfoot>
    </table>
        </div>
                	<script src="vendor/bootstrap/js/popper.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        <div class="modal fade" id="imagemodal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"></h4>
                    </div>
                    <div class="modal-body">
                        <img src="" id="imagepreview" style="width: 400px; height: 264px;padding-left: 15%;">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Zatvori</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="modalInfo" class="modal fade" role="dialog" aria-labellebdy="modal-title">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="modal-title"></h4>
                        <h6 class="modal-title modal-chain" id="modal-title"></h6>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body" id="modal-body">
                        <table>
                            <tr>
                                <td>
                                    <u><h5>Dodatne informacije:</h5></u>
                                    <p id="model-adresa"></p>
                                    <p id="model-mesto"></p>
                                    <p id="model-grad"></p>
                                    <p id="model-telefon"></p>
                                    <p id="model-imejl"></p>
                                    <p id="model-vebStrana"><i class="fa fa-at"></i> <a href="#" id="infoStrana" title="">HotelInfo</a></p>
                                </td>
                                    <td style="padding-left: 10%; padding-right: 5px;">
                                        <img id="modalSlikaProfil" src="#" data-altImage="images/no-image.jpg" onerror="this.src=$(this).attr('data-altImage')" style="width:400px;height: 264px;"/>
                                    </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <a id="sobaponude" class="btn btn-default" href="#"><i class="fa fa-search"></i> pretraga soba</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Zatvori</button>
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
                                                        $('.brisanje-rezervacije').confirm({
                                                           text: "Da li zelite da obrisete rezervaciju?",
                                                           title: "Brisanje rezervacije",
                                                           confirm: function(button){
                                                               window.location.href="BrisanjeRezervacijeServlet?idRez="+<%=elem.getIdRez()%>+"&page=PonudaHoteli";
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
        <script>
               $('#imagemodal').on('show.bs.modal',function(event){
                  var button=$(event.relatedTarget);
                  var slikasrc=button.data('imagesrc');
                  var title=button.data('imagedescrt');
                  var modal=$(this);
                  
                  modal.find('#imagepreview').attr('src','images/'+slikasrc);
                  modal.find('#myModalLabel').html(title);
               });
               $('#modalInfo').on('show.bs.modal',function(event){
                  var button=$(event.relatedTarget);
                  var title=button.data('title');
                  var adresa=button.data('adresa');
                  var mesto=button.data('mesto');
                  var grad=button.data('grad');
                  var telefon=button.data('telefon');
                  var imejl=button.data('imejl');
                  var vebStrana=button.data('veb');
                  var slika=button.data('slika');
                  var imelanca=button.data('imelanca');
                  var id=button.data('id');
                  var modal=$(this);
                                             
                  modal.find('.modal-title').text(title);
                  modal.find('.modal-chain').text(imelanca);
                  modal.find('.modal-body #model-adresa').html('<i class="fa fa-road"></i> '+adresa);
                  modal.find('.modal-body #model-mesto').html('<i class="fa fa-map-o"></i> '+mesto);
                  modal.find('.modal-body #model-grad').html('<i class="fa fa-street-view"></i> '+grad);
                  modal.find('.modal-body #model-telefon').html('<i class="zmdi zmdi-phone-in-talk zmdi-hc-fw"></i> '+telefon);
                  modal.find('.modal-body #model-imejl').html('<i class="zmdi zmdi-email zmdi-hc-fw"></i> '+imejl);
                  modal.find('.modal-body #model-vebStrana #infoStrana').attr('href',vebStrana);
                  modal.find('.modal-body #model-vebStrana #infoStrana').attr('title',vebStrana);
                  modal.find('.modal-body #modalSlikaProfil').attr('src','images/'+slika);
                  modal.find('.modal-footer #sobaponude').attr('href','SobePonudeServlet?id='+id);
 
               });
               </script>
               
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
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="window.location.href('HoteliPonudeServlet')">Zatvori</button>
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

    </body>
</html>
