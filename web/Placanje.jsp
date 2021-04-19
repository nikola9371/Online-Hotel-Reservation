<%-- 
    Document   : Placanje
    Created on : May 30, 2019, 1:50:55 AM
    Author     : OEM
--%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Random"%>
<%@page import="Classes.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JavaBean.RacunBean"%>
<%@page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1">
        <title>Placanje rezervacija</title>
        
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
            Random rand=new Random();
            float suma=0;
            int bodovi=0;
            HttpSession sesija=request.getSession(false);
            UserDao userDao=new UserDao();
            ArrayList<RacunBean> racun=userDao.userRacunExport(Integer.parseInt(sesija.getAttribute("userID").toString()));
        %>
        <div class="container" style="padding-top: 10px; padding-bottom: 10px;">
            <%if(racun.size()>0){%>
            <h4>Racun broj: <%=hashCode()+racun.get(0).getIdRez()%></h4>
            <hr>
                    <div class="row">
                        <div class="col-sm text-primary">Hotel</div>
                        <div class="col-sm text-primary">Datum dolaska</div>
                        <div class="col-sm text-primary">Datum odlaska</div>
                        <div class="col-sm text-primary">Cena</div>
                        <div class="col-sm text-primary">Cena(Bodovi)</div>
                    </div>
                    <%for (RacunBean elem : racun) {%>
                    <% 
                        suma=suma+elem.getCena();
                        bodovi=bodovi+elem.getCenaP();
                    %>
                    <div class="row">
                        <div class="col-sm"><%=elem.getImeHotela()%></div>
                        <div class="col-sm"><%=elem.getDatumRezervacije()%></div>
                        <div class="col-sm"><%=elem.getDatumIsteka()%></div>
                        <div class="col-sm"><%=elem.getCena()%>din.</div>
                        <div class="col-sm"><%=elem.getCenaP()%>bodova</div>
                    </div>
                    <%}%>
            <%}else{%>
                <div class="row">
                    <h4>Trenutno nemate nijednu rezervaciju</h4>
                </div>
            <%}%>
            <hr>
                <p><b>Ukupno:</b> <%=suma%>din.[<%=bodovi%>bodova]</p>
            <div class="row">
                <div class="col-sm-4"> 
                    <%if(racun.size()>0){%>
                            <button class="btn btn-success" data-toggle="modal" data-target="#Placanje">Plati</button>
                    <%}else{%>
                            <button class="btn btn-success" disabled="true">Plati</button>
                    <%}%>
                            <button class="btn btn-danger" onclick="window.location.href('HoteliPonudeServlet')">Ponisti</button>
                </div>
            </div>
        </div>
                            <div id="Placanje" class="modal fade" role="dialog" data-backdrop="static">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4>Placanje</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form action="PlacanjeServlet" method="post">
                                                <div class="form-group">
                                                    <div class="cols-sm-10">
                                                        <input type="hidden" name="userID" value="<%=sesija.getAttribute("userID")%>">
                                                        <label class="cols-sm-2 control-label">Kreditna kartica</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="zmdi zmdi-card"></i></span>
                                                            <select name="tip" class="form-control">
                                                                <option value="visa">VISA</option>
                                                                <option value="MasterCard">MasterCard</option>
                                                                <option value="AmericanExpress">American Express</option>
                                                            </select>
                                                        </div>
                                                        <label class="cols-sm-2 control-label">Broj kreditne kartice</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                            <input name="kreditnaKartica" id="CreditCardInput" class="form-control" placeholder="XXXX-XXXX-XXXX-XXXX">
                                                        </div>
                                                        <label class="cols-sm-2 control-label">D.Izdaje i D.Isteka</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                            <input name="datumIzdaje" type="date" style="width: 40%" class="form-control" min="<%=LocalDate.now()%>" value="<%=LocalDate.now()%>">
                                                            <span class="input-group-addon"><i class="fa fa-calendar-check-o"></i></span>
                                                            <input name="datumIstteka" type="date" style="width: 40%" class="form-control" min="<%=LocalDate.now().plusDays(1)%>" value="<%=LocalDate.now().plusDays(1)%>">
                                                        </div>
                                                        <hr>
                                                        <div class="form-group">
                                                            <button class="btn btn-primary btn-lg btn-block login-button">Rezervisi</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                                        <form action="PlacanjeBodoviServlet" method="post">
                                                            <input type="hidden" name="brBodova" value="<%=bodovi%>">
                                                            <input type="hidden" name="userID" value="<%=sesija.getAttribute("userID")%>">
                                                            <hr style="margin-top: 15px;">
                                                            <div class="form-group">
                                                                    <label class="cols-sm-2 control-label">Ili Platite N-bodovima</label>
                                                                <%if(userDao.userBodoviExport(Integer.parseInt(sesija.getAttribute("userID").toString()))>=bodovi){%>
                                                                    <button class="btn btn-warning btn-lg btn-block login-button submit">Plati - <span class="badge badge-warning"><%=bodovi%> bodova</span></button>
                                                                <%}else{%>
                                                                    <button class="btn btn-warning btn-lg btn-block login-button submit" disabled="true" title="Nemate dovoljno bodova.[<%=bodovi%> bodova na vasem racunu]">Plati - <%=bodovi%> bodova</button>
                                                                <%}%>
                                                            </div>
                                                        </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-danger" data-dismiss="modal" onclick="window.location.href('Placanje.jsp')">Zatvori</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
            <div id="ModalErr" class="modal fade" role="dialog" aria-labellebdy="modal-title" data-backdrop="static">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Greska</h4>
                            <button type="button" class="error close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <h3><%=request.getAttribute("errMessage")%></h3>
                            <i class="fa fa-warning fa-4x" style="color:red;padding-left: 40%;"></i>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="error btn btn-outline-primary" data-dismiss="modal">Zatvori</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ModalSucc" class="modal fade" role="dialog" aria-labellebdy="modal-title" data-backdrop="static">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Poruka o uspehu</h4>
                            <button type="button" class="close" data-dismiss="modal" onclick="window.location.href('Placanje.jsp')">&times;</button>
                        </div>
                        <div class="modal-body">
                            <h3><%=request.getAttribute("succMessage")%></h3>
                            <i class="fa fa-check-circle fa-4x" style="color:green;padding-left: 40%;"></i>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="window.location.href('Placanje.jsp')">Zatvori</button>
                        </div>
                    </div>
                </div>
            </div>
          <%if(request.getAttribute("errMessage")!=null){%>
        <script>
            $(window).on('load',function(){
                $('#ModalErr').modal('show');
            }) ;
        </script>
        <%}else if(request.getAttribute("succMessage")!=null){%>
         <script>
             $(window).on('load',function(){
                 $('#ModalSucc').modal('show');
             }) ;
         </script>
        <%}%>
        <script>
            $('.error').on('click',function(){
               $('#Placanje').modal('show'); 
            });
        </script>
    </body>
</html>
