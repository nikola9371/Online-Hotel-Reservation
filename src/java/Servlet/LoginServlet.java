/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.HoteliDao;
import JavaBean.LoginBean;
import Classes.LoginDao;
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
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        String userName=request.getParameter("username");
        String password=request.getParameter("password");    
        
        LoginBean loginbean=new LoginBean();
        
        loginbean.setUserName(userName);
        loginbean.setPassword(password);
        
        
        LoginDao loginDao=new LoginDao();
        String userValidate=loginDao.authenticateUser(loginbean);
        String userTypeExport=loginDao.userInfoExtractAccountType(loginbean);
        int userID=loginDao.userIDReturn(userName);
        
        
        if(userValidate.equals("Uspesno")){
            HttpSession sesija=request.getSession();
            HoteliDao hoteliDao=new HoteliDao();
            sesija.setAttribute("userID", userID);
            sesija.setAttribute("username", userName);
            sesija.setAttribute("password", password);
            sesija.setAttribute("usertype", userTypeExport);
            sesija.setMaxInactiveInterval(0);

            if(request.getParameter("remember-me")!=null){
                sesija.setAttribute("isLoggedIn", "Jeste");
            }
            
            if(userTypeExport.equals("user")){
                request.getRequestDispatcher("/Home.jsp").forward(request, response);
            }
            else if(userTypeExport.equals("admin")){
                request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
            }
            else if(userTypeExport.equals("menadzer")){
                request.getRequestDispatcher("/HomeMandg.jsp").forward(request, response);
            }
            
        }
        else{
            request.setAttribute("errMessage", userValidate);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
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
