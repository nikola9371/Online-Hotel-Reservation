/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.AdminDao;
import Classes.MenadzerDao;
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
public class IzmeniPodaciAdminServlet extends HttpServlet {

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
            out.println("<title>Servlet IzmeniPodaciAdminServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IzmeniPodaciAdminServlet at " + request.getContextPath() + "</h1>");
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
        if(request.getParameter("type")!=null){
            if(request.getParameter("type").equals("mandz")){
                request.setAttribute("type", request.getParameter("type"));
                request.setAttribute("idMeng", request.getParameter("idManz"));
                request.getRequestDispatcher("/IzmenaPodaciMendzAdmin.jsp").forward(request, response);
            }
        }
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
        if(request.getParameter("type")!=null&&request.getParameter("type").equals("admin")){
            int idMenz=Integer.parseInt(request.getParameter("idMang"));
            String Adresa=request.getParameter("Adresa");
            String gRodjenja=request.getParameter("gRodjenja");
            String imePrezime=request.getParameter("ImePrezime");
            String skola=request.getParameter("skola");
            int StrucnaSprema=Integer.parseInt(request.getParameter("StrucnaSprema"));
            String telefon=request.getParameter("telefon");
            int Hotel=Integer.parseInt(request.getParameter("imeHotel"));
            
            if(Adresa!=null&&Adresa.length()>0&&imePrezime!=null&&imePrezime.length()>0&&skola!=null&&skola.length()>0&&telefon!=null&&telefon.length()>0){
                AdminDao admindao=new AdminDao();
                if(admindao.TelephoneRegex(telefon).equals("Uspesno")){
                    if(admindao.MendzUpdateData(imePrezime, gRodjenja, imePrezime, Adresa, telefon, StrucnaSprema, skola, Hotel,idMenz)>0){
                        request.setAttribute("succMessage", "Uspesno su promenjeni podaci");
                        request.setAttribute("idMeng", idMenz);
                        request.getRequestDispatcher("/IzmenaPodaciMendzAdmin.jsp").forward(request, response);
                    }else{
                        request.setAttribute("errMessage", "Nisu izvrsene izmene!");
                        request.setAttribute("idMeng", idMenz);
                        request.getRequestDispatcher("/IzmenaPodaciMendzAdmin.jsp").forward(request, response);
                    }
                }else{
                        request.setAttribute("errMessage", "Telefon nije ispravnog formata!");
                        request.setAttribute("idMeng", idMenz);
                        request.getRequestDispatcher("/IzmenaPodaciMendzAdmin.jsp").forward(request, response);
                }
            }else{
                request.setAttribute("errMessage", "Polja ne smeju biti prazna!");
                request.setAttribute("idMeng", idMenz);
                request.getRequestDispatcher("/IzmenaPodaciMendzAdmin.jsp").forward(request, response);
            }
        }
        else if(request.getParameter("type")!=null&&request.getParameter("type").equals("mang")){
            int idMang=Integer.parseInt(request.getParameter("idMang"));
            String ImePrezime=request.getParameter("ImePrezime");
            String datumRodjenja=request.getParameter("DatumRodjenja");
            String prebivaliste=request.getParameter("Prebivaliste");
            String adresa=request.getParameter("Adresa");
            String telefon=request.getParameter("Telefon");
            int StrucnaSprema=Integer.parseInt(request.getParameter("StrucnaSprema"));
            String ImeSkole=request.getParameter("ImeSkole");
            
            if(ImePrezime!=null&&ImePrezime.length()>0&&prebivaliste!=null&&prebivaliste.length()>0&&adresa!=null&&adresa.length()>0&&ImeSkole!=null&&ImeSkole.length()>0){
                AdminDao admindao=new AdminDao();
                MenadzerDao mendzdao=new MenadzerDao();
                if(admindao.TelephoneRegex(telefon).equals("Uspesno")){
                    if(mendzdao.MendzUpdateData(ImePrezime, datumRodjenja, prebivaliste, adresa, telefon, StrucnaSprema, ImeSkole, idMang)>0){
                        request.setAttribute("succMessage", "Podaci su uspesno izmenjeni");
                        request.getRequestDispatcher("/IzmenaPodatakaMang.jsp").forward(request, response);
                    }
                    else{
                        request.setAttribute("errMessage", "Podaci nisu izmenjeni!");
                        request.getRequestDispatcher("/IzmenaPodatakaMang.jsp").forward(request, response);
                    }
                }else{
                    request.setAttribute("errMessage", "Telefon nije ispravnog formata!");
                    request.getRequestDispatcher("/IzmenaPodatakaMang.jsp").forward(request, response);
                }
            }else{
                request.setAttribute("errMessage", "Polja ne smeju biti prazna!");
                request.getRequestDispatcher("/IzmenaPodatakaMang.jsp").forward(request, response);
            }
            
        }
        else{
            request.setAttribute("errMessage", "ne moze");
            request.getRequestDispatcher("/IzmenaPodatakaMang.jsp").forward(request, response);
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
