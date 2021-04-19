/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.LoginDao;
import Classes.UserDao;
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
public class UplataServlet extends HttpServlet {

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
            out.println("<title>Servlet UplataServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UplataServlet at " + request.getContextPath() + "</h1>");
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
        String uplata=request.getParameter("iznosUplata");
        String brKartice=request.getParameter("brojKartice");
        UserDao userDao=new UserDao();
        LoginDao loginDao=new LoginDao();
        HttpSession sesija=request.getSession(false);
        
       if(uplata!=null && uplata.length()>0){
           if(userDao.userCreditDigitsRegex(brKartice).equals("Uspesno")){
            if(loginDao.userSumValidation(uplata).equals("Uspesno")){
                userDao.userStanjeUpdate(Integer.parseInt(sesija.getAttribute("userID").toString()),Float.parseFloat(uplata));
                request.setAttribute("succMessage", userDao.userStanjeUpdate(Integer.parseInt(sesija.getAttribute("userID").toString()),Float.parseFloat(uplata)));
                request.getRequestDispatcher("/Uplata.jsp").forward(request, response);
            }
            else{
                request.setAttribute("errMessage", loginDao.userSumValidation(uplata));
                request.getRequestDispatcher("/Uplata.jsp").forward(request, response);
            }
           }else{
               request.setAttribute("errMessage", "Format broja kartice nije dobar!");
               request.getRequestDispatcher("/Uplata.jsp").forward(request, response);
           }
       }else{
           request.setAttribute("errMessage", "Polje unosa sume ne sme biti prazno!");
           request.getRequestDispatcher("/Uplata.jsp").forward(request, response);
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
