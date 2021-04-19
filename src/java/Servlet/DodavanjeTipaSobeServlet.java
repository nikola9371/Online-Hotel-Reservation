/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

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
public class DodavanjeTipaSobeServlet extends HttpServlet {

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
            out.println("<title>Servlet DodavanjeTipaSobeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DodavanjeTipaSobeServlet at " + request.getContextPath() + "</h1>");
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
        MenadzerDao menz=new MenadzerDao();
        
        if(request.getParameter("OznakaTipa").length()>0 && request.getParameter("OznakaTipa")!=null && request.getParameter("TipSobe").length()>0 &&request.getParameter("TipSobe")!=null){
            if(menz.TipSobeInsert(request.getParameter("OznakaTipa").toUpperCase(), request.getParameter("TipSobe"))>0){
              request.setAttribute("succMessage", "Uspesno unet novi tip sobe");
              request.getRequestDispatcher("/DodavanjeNovogTipaSobe.jsp").forward(request, response);
            }
            else{
                request.setAttribute("errMessage", "Unos nije moguc!");
                request.getRequestDispatcher("/DodavanjeNovogTipaSobe.jsp").forward(request, response);
            }
        }
        else{
            request.setAttribute("errMessage", "Polja ne smeju biti prazna!");
            request.getRequestDispatcher("/DodavanjeNovogTipaSobe.jsp").forward(request, response);
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
