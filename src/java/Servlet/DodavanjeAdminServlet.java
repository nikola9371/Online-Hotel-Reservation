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
public class DodavanjeAdminServlet extends HttpServlet {

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
            out.println("<title>Servlet DodavanjeAdminServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DodavanjeAdminServlet at " + request.getContextPath() + "</h1>");
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
        if(request.getParameter("type")!=null&&request.getParameter("type").equals("admin")){
                    String ImeHotel=request.getParameter("ImeHotel");
                    int idLanac=Integer.parseInt(request.getParameter("imeLanac"));
                    String Adresa=request.getParameter("Adresa");
                    String Mesto=request.getParameter("Mesto");
                    String Grad=request.getParameter("Grad");
                    int idDrzava=Integer.parseInt(request.getParameter("imeDrzava"));
                    String Imejl=request.getParameter("Imejl");
                    String Telefon=request.getParameter("Telefon");
                    String VebStranica=request.getParameter("VebStranica");
                    
                    AdminDao admindao=new AdminDao();

            if(ImeHotel!=null&&ImeHotel.length()>0&&request.getParameter("imeLanac")!=null&&request.getParameter("imeLanac").length()>0&&Adresa!=null&&Adresa.length()>0&&Mesto!=null&&Mesto.length()>0&&Grad!=null&&Grad.length()>0&&request.getParameter("imeDrzava")!=null&&request.getParameter("imeDrzava").length()>0&&Imejl!=null&&Imejl.length()>0&&Telefon!=null&&Telefon.length()>0&&VebStranica!=null&&VebStranica.length()>0){
                if(admindao.EmailRegex(Imejl).equals("Uspesno")){
                    if(admindao.TelephoneRegex(Telefon).equals("Uspesno")){
                        if(admindao.UrlRegex(VebStranica).equals("Uspesno")){
                            if(admindao.HotelAdd(ImeHotel, Adresa, Mesto, Grad, Telefon, Imejl, VebStranica, idLanac, idDrzava)>0){
                                request.setAttribute("succMessage", "Uspesno je dodat novi hotel");
                                request.getRequestDispatcher("/DodajNoviHotel.jsp").forward(request, response);
                            }else{
                                request.setAttribute("errMessage", "Hotel nije dodat!");
                                request.getRequestDispatcher("/DodajNoviHotel.jsp").forward(request, response);
                            }
                        }else{
                            request.setAttribute("errMessage", admindao.UrlRegex(VebStranica));
                            request.getRequestDispatcher("/DodajNoviHotel.jsp").forward(request, response);
                        }
                    }else{
                        request.setAttribute("errMessage", admindao.TelephoneRegex(Telefon));
                        request.getRequestDispatcher("/DodajNoviHotel.jsp").forward(request, response);
                    }
                }else{
                    request.setAttribute("errMessage", admindao.EmailRegex(Imejl));
                    request.getRequestDispatcher("/DodajNoviHotel.jsp").forward(request, response);
                }
            }
            else{
                request.setAttribute("errMessage", "Polja ne smeju biti prazna!");
                request.getRequestDispatcher("/DodajNoviHotel.jsp").forward(request, response);
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
