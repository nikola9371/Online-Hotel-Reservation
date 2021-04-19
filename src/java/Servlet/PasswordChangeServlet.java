/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.LoginDao;
import JavaBean.LoginBean;
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
public class PasswordChangeServlet extends HttpServlet {

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
            out.println("<title>Servlet PasswordChangeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PasswordChangeServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession sesija=request.getSession(false);
        
        
        String staraLozinka=request.getParameter("oldPassword");
        String novaLozinka=request.getParameter("newPassword");
        String novaLozinkaOpet=request.getParameter("newPasswordRepeat");
        
        LoginDao loginDao=new LoginDao();
        
     if(staraLozinka!=null && staraLozinka.length()>0 || novaLozinka!=null && novaLozinka.length()>0 || novaLozinkaOpet!=null && novaLozinkaOpet.length()>0){
         if(!staraLozinka.equals(novaLozinka)){
             if(novaLozinka.equals(novaLozinkaOpet)){
                 if(loginDao.userPasswordVerification(Integer.parseInt(sesija.getAttribute("userID").toString()), staraLozinka).equals("Uspesno")){
                     if(loginDao.userPasswordChange(Integer.parseInt(sesija.getAttribute("userID").toString()), staraLozinka, novaLozinka).equals("Uspesno")){
                            request.setAttribute("succMessage", "Uspesno promenjena lozinka");
                            request.getRequestDispatcher("/PromenaLozinke.jsp").forward(request, response);
                        }
                 }else{
                    request.setAttribute("errMessage",(loginDao.userPasswordVerification(Integer.parseInt(sesija.getAttribute("userID").toString()), staraLozinka)));
                    request.getRequestDispatcher("/PromenaLozinke.jsp").forward(request, response);
                }
             } else{
                request.setAttribute("errMessage", "Nove sifre se ne podudaraju!");
                request.getRequestDispatcher("/PromenaLozinke.jsp").forward(request, response);
            }
         }else{
                request.setAttribute("errMessage", "Nova i stara lozinka ne smeju biti iste!");
                request.getRequestDispatcher("/PromenaLozinke.jsp").forward(request, response);
            }
     }else{
            request.setAttribute("errMessage","Polja ne smeju biti prazna!");
            request.getRequestDispatcher("/PromenaLozinke.jsp").forward(request, response);
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
