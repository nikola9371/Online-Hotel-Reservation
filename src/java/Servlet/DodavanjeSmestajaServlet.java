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
public class DodavanjeSmestajaServlet extends HttpServlet {

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
            out.println("<title>Servlet DodavanjeSmestajaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DodavanjeSmestajaServlet at " + request.getContextPath() + "</h1>");
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
        
        if(request.getParameter("Cena").length()>0&&request.getParameter("Cena")!=null&&request.getParameter("CenaPoeni").length()>0&&request.getParameter("CenaPoeni")!=null&&request.getParameter("brPonuda").length()>0&&request.getParameter("brPonuda")!=null&&request.getParameter("Opis").length()>0&&request.getParameter("Opis")!=null){
            if(menz.SmestajInsert(Integer.parseInt(request.getParameter("TipSobe")),Float.parseFloat(request.getParameter("Cena")) , Integer.parseInt(request.getParameter("CenaPoeni")),Integer.parseInt(request.getParameter("brPonuda")), request.getParameter("Opis"), Integer.parseInt(request.getParameter("HotelId")))>0){
                request.setAttribute("succMessage", "Uspesno unet novi smestaj");
                request.getRequestDispatcher("/DodavanjeNovogSmestaja.jsp").forward(request, response);
            }
            else{
                request.setAttribute("errMessage", "Unos nije moguc!");
                request.getRequestDispatcher("/DodavanjeNovogSmestaja.jsp").forward(request, response);
            }
        }
        else{
            request.setAttribute("errMessage", "Polja ne smeju biti prazna!");
            request.getRequestDispatcher("/DodavanjeNovogSmestaja.jsp").forward(request, response);
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
