/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.LoginDao;
import Classes.Mailer;
import JavaBean.LoginBean;
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
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        String FullName=request.getParameter("FullName");
        String UserName=request.getParameter("UserName");
        String Password=request.getParameter("Password");
        String Email=request.getParameter("Email");
        String UserType=request.getParameter("UserType");
        
        
        
        LoginBean loginBean=new LoginBean();
        loginBean.setUserName(UserName);
        loginBean.setPassword(Password);
        loginBean.setUserType(UserType);
        loginBean.setFullName(FullName);
        loginBean.setEmail(Email);
        
        LoginDao loginDao=new LoginDao();
        loginDao.userInfoImport(loginBean);
        
        request.setAttribute("succMessage", "Uspesno napravljen novi nalog");
        request.getRequestDispatcher("/Confirm2.jsp").forward(request, response);
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
        String FullName=request.getParameter("Fullname");
        String userName=request.getParameter("userName");
        String accType="user";
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String passConfirm=request.getParameter("confirm");
        
        LoginBean loginbean=new LoginBean();
        
        loginbean.setFullName(FullName);
        loginbean.setUserName(userName);
        loginbean.setPassword(password);
        loginbean.setPasswordConfirm(passConfirm);
        loginbean.setEmail(email);
        loginbean.setUserType(accType);
        
        LoginDao loginDao=new LoginDao();
        String PassConfirmAuth=loginDao.confirmPasswords(loginbean);
        String EmailValidation=loginDao.userEmailvalidation(loginbean);
        String UsernameValidation=loginDao.userUsernameValidation(loginbean);
        String UserEmailValidation=loginDao.userEmailValidation(loginbean);
    if(UserEmailValidation.equals("Uspesno")){
      if(UsernameValidation.equals("Uspesno")){
        if(PassConfirmAuth.equals("Uspesno")){
            if(EmailValidation.equals("Uspesno")){
                if(FullName!=null && FullName.length()>0){
                    if(userName!=null && userName.length()>0){
            Mailer mailer=new Mailer();
            mailer.SendConfirmationMail(loginbean.getEmail(), loginbean.getFullName().replaceAll("\\s+","+"), loginbean.getUserName(), loginbean.getPassword(),loginbean.getUserType());
            
            request.setAttribute("succMessage", "Poslat vam je imejl. Pogledajte Vasu imejl postu. Potvrdite pravljenje novog naloga");
            request.getRequestDispatcher("/Confirm.jsp").forward(request, response);
                    }
                    else{
                        request.setAttribute("errMessage", "Prazno je polje sa korisnicnik imenom!");
                        request.getRequestDispatcher("/Registracija.jsp").forward(request, response);
                    }
                }
                else{
                    request.setAttribute("errMessage", "Prazno polje sa punim imenom korisnika!");
                    request.getRequestDispatcher("/Registracija.jsp").forward(request, response);
                }
            }
            else{
                request.setAttribute("errMessage", EmailValidation);
                request.getRequestDispatcher("/Registracija.jsp").forward(request, response);
            }
            
        }
        else{
            request.setAttribute("errMessage", PassConfirmAuth);
            request.getRequestDispatcher("/Registracija.jsp").forward(request, response);
        }
      }
      else{
            request.setAttribute("errMessage", UsernameValidation);
            request.getRequestDispatcher("/Registracija.jsp").forward(request, response);
      }
    }
    else{
            request.setAttribute("errMessage", UserEmailValidation);
            request.getRequestDispatcher("/Registracija.jsp").forward(request, response);
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
