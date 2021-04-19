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
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author OEM
 */
public class PlacanjeServlet extends HttpServlet {

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
            out.println("<title>Servlet PlacanjeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlacanjeServlet at " + request.getContextPath() + "</h1>");
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
        String kreditnaKartica=request.getParameter("kreditnaKartica");
        int userID=Integer.parseInt(request.getParameter("userID"));
        UserDao userdao=new UserDao();
        Mailer mail=new Mailer();
        
        if(kreditnaKartica!=null && kreditnaKartica.length()>0){
            if(userdao.userCreditDigitsRegex(kreditnaKartica).equals("Uspesno")){
                if(userdao.userPlacanjeDeleteRecords(userID)>0){
                    if(userdao.userDodelaBodova(userID)>0){
                        if(userdao.userIstorijaPlacanje(userID,"dinari")>0){
                            mail.MailAppartmentPaid(userdao.userMailExport(userID));
                            request.setAttribute("succMessage", "Uspesno placeno");
                            request.getRequestDispatcher("/Placanje.jsp").forward(request, response);
                        }
                    }
                }
                else{
                    request.setAttribute("errMessage", "Placanje nije izvrseno!");
                    request.getRequestDispatcher("/Placanje.jsp").forward(request, response);
                }
            }
            else{
                request.setAttribute("errMessage", userdao.userCreditDigitsRegex(kreditnaKartica));
                request.getRequestDispatcher("/Placanje.jsp").forward(request, response);
            }
        }
        else{
            request.setAttribute("errMessage", "Polje sa brojem kartice ne sme biti prazno!");
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
