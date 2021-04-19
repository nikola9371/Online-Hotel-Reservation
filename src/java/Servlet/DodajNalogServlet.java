/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author OEM
 */
public class DodajNalogServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DodajNalogServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DodajNalogServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                if(request.getParameter("type")!=null){
            if(request.getParameter("type").equals("adminNalog")){
                String ImePrezime=request.getParameter("Fullname");
                String KIme=request.getParameter("userName");
                String Imejl=request.getParameter("email");
                String Sifra=request.getParameter("password");
                String SifraPonovo=request.getParameter("confirm");
                String TipNaloga=request.getParameter("tipNaloga");
                
                AdminDao admindao=new AdminDao();
                
                if(ImePrezime!=null&&ImePrezime.length()>0&&KIme!=null&&KIme.length()>0&&Imejl!=null&&Imejl.length()>0&&Sifra!=null&&Sifra.length()>0&&SifraPonovo!=null&&SifraPonovo.length()>0){
                    if(Sifra.equals(SifraPonovo)){
                        if(admindao.EmailRegex(Imejl).equals("Uspesno")){
                            if(admindao.InsertNalog(ImePrezime, KIme, Sifra, TipNaloga, Imejl)>0){
                                request.setAttribute("succMessage", "Uspesno dodat novi nalog");
                                request.getRequestDispatcher("/DodajNalog.jsp").forward(request, response);
                            }
                        }else{
                            request.setAttribute("succMessage", admindao.EmailRegex(Imejl));
                            request.getRequestDispatcher("/DodajNalog.jsp").forward(request, response);
                        }
                    }else{
                        request.setAttribute("errMessage", "Sifre se ne podudaraju!");
                        request.getRequestDispatcher("/DodajNalog.jsp").forward(request, response);
                    }
                }else{
                    request.setAttribute("errMessage", "Sva polja moraju biti popunjena!");
                    request.getRequestDispatcher("/DodajNalog.jsp").forward(request, response);
                }
            }else if(request.getParameter("type").equals("adminMangDodela")){
                
                AdminDao admindao=new AdminDao();
                
                String FullName=request.getParameter("Fullname");
                String prebivaliste=request.getParameter("prebivaliste");
                String dRodj=request.getParameter("datumRodj");
                String adresa=request.getParameter("adresa");
                int idStrucnaSprema=Integer.parseInt(request.getParameter("strucnaSprema"));
                String telefon=request.getParameter("telefon");
                int idHotel=Integer.parseInt(request.getParameter("hoteli"));
                int idUser=Integer.parseInt(request.getParameter("menadzeri"));
                String skola=request.getParameter("skola");
                
                if(FullName!=null&&FullName.length()>0&&prebivaliste!=null&&prebivaliste.length()>0&&adresa!=null&&adresa.length()>0&&telefon!=null&&telefon.length()>0){
                    if(admindao.TelephoneRegex(telefon).equals("Uspesno")){
                        if(admindao.DodelaMang(idUser, idHotel, FullName, dRodj, prebivaliste, adresa, telefon, idStrucnaSprema, skola)>0){
                            request.setAttribute("succMessage", "Uspesno je dodeljen menadzer");
                            request.getRequestDispatcher("/DodelaMang.jsp").forward(request, response);
                        }
                    }else{
                        request.setAttribute("errMessage", "Telefon nije ispravnog formata!");
                        request.getRequestDispatcher("/DodelaMang.jsp").forward(request, response);
                    }
                }else{
                    request.setAttribute("errMessage", "Polja ne smeju biti prazna!");
                    request.getRequestDispatcher("/DodelaMang.jsp").forward(request, response);
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
