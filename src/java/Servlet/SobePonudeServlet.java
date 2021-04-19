/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.HoteliDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author OEM
 */
public class SobePonudeServlet extends HttpServlet {

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
            out.println("<title>Servlet SobePonudeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SobePonudeServlet at " + request.getContextPath() + "</h1>");
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
        HoteliDao hoteliDao=new HoteliDao();
        HttpSession sesija=request.getSession(false);
        request.setAttribute("idHotel", request.getParameter("id"));
        request.setAttribute("type", request.getParameter("type"));
        request.setAttribute("searchWord", request.getParameter("word"));
        request.setAttribute("listaSobaPonuda", hoteliDao.prikaziPonudeSobe(Integer.parseInt(request.getParameter("id"))));
        request.setAttribute("listaRezervacija", hoteliDao.userRezervacije(Integer.parseInt(sesija.getAttribute("userID").toString())));
        request.getRequestDispatcher("/PonudaHotelSobe.jsp").forward(request, response);
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
        int idPonude=Integer.parseInt(request.getParameter("idPonude"));
        int idHotel=Integer.parseInt(request.getParameter("idHotel"));
        String rezDate=request.getParameter("datumRegistracije");
        String odlazakDate=request.getParameter("datumOdlaska");
        int brSoba=Integer.parseInt(request.getParameter("brSoba"));
        
        HttpSession sesija=request.getSession(false);
        HoteliDao hoteliDao=new HoteliDao();
        hoteliDao.userDodavanjeRezervacije(Integer.parseInt(sesija.getAttribute("userID").toString()), idPonude,rezDate,odlazakDate);
        hoteliDao.OduzimanjeIzZalihe2(idPonude,brSoba);
        
        request.setAttribute("idHotel", idHotel);
        request.setAttribute("listaSobaPonuda",  hoteliDao.prikaziPonudeSobe(idHotel));
        request.setAttribute("listaRezervacija", hoteliDao.userRezervacije(Integer.parseInt(sesija.getAttribute("userID").toString())));
       
        request.setAttribute("SuccMsg", "Uspesno dodata nova rezervacija");
        request.getRequestDispatcher("/PonudaHotelSobe.jsp").forward(request, response);
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
