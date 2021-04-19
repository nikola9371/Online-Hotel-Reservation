/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.LoginDao;
import Classes.Mailer;
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
public class ZaboravljenaLozinka2Servlet extends HttpServlet {

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
            out.println("<title>Servlet ZaboravljenaLozinka2Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ZaboravljenaLozinka2Servlet at " + request.getContextPath() + "</h1>");
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
        Mailer mail=new Mailer();
        LoginDao ld=new LoginDao();
        
        if(request.getParameter("newPass").length()>0&&request.getParameter("newPass")!=null){
            if(ld.userPasswordChange2(Integer.parseInt(request.getParameter("userID")), request.getParameter("newPass"))>0){
                mail.MailRecoveryMail(request.getParameter("imejl"));
                request.setAttribute("succMessage", "Lozinka je uspesno promenjena, proverite Vas imejl");
                request.getRequestDispatcher("/ZaboravljenaLozinka2.jsp").forward(request, response);
            }else{
                request.setAttribute("errMessage", "Lozinka nije promenjena!");
                request.getRequestDispatcher("/ZaboravljenaLozinka2.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("errMessage", "Polje ne sme biti prazno!");
            request.getRequestDispatcher("/ZaboravljenaLozinka2.jsp").forward(request, response);
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
