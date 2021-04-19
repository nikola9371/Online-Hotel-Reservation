/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.Mailer;
import Classes.UserDao;
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
public class PlacanjeBodoviServlet extends HttpServlet {

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
            out.println("<title>Servlet PlacanjeBodoviServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlacanjeBodoviServlet at " + request.getContextPath() + "</h1>");
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
        UserDao user=new UserDao();
        int bodovi=Integer.parseInt(request.getParameter("brBodova"));
        int userID=Integer.parseInt(request.getParameter("userID"));
        Mailer mail=new Mailer();
        if(user.userBodoviExport(userID)>=bodovi){
            if(user.userIstorijaPlacanje(userID,"bodovi")>0){
                if(user.userPlacanjeBodovima(userID, bodovi)>0){
                    if(user.userPlacanjeDeleteRecords(userID)>0){
                        mail.MailAppartmentPaid(user.userMailExport(userID));
                        request.setAttribute("succMessage", "Uspesno ste izvrsili uplatu bodovima");
                        request.getRequestDispatcher("/Placanje.jsp").forward(request, response);
                    }
                }
                else{
                    request.setAttribute("errMessage", "Nije uspelo placanja");
                    request.getRequestDispatcher("/Placanje.jsp").forward(request, response);
                }
            }
        }else{
            request.setAttribute("errMessage", "Nemate dovoljno bodova");
            request.getRequestDispatcher("/Placanje.jsp").forward(request, response);
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
