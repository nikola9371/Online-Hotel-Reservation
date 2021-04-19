/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.AdminDao;
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
public class BrisanjeServlet extends HttpServlet {

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
            out.println("<title>Servlet BrisanjeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BrisanjeServlet at " + request.getContextPath() + "</h1>");
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
        if(request.getParameter("type")!=null){
            if(request.getParameter("type").equals("adminHotel")){
                int idHotel=Integer.parseInt(request.getParameter("idHotel"));
                
                AdminDao admindao=new AdminDao();
                
                if(admindao.DeleteHotel(idHotel)>0){
                    request.setAttribute("SuccMsg", "Uspesno je obrisan hotel");
                    request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
                }
                else{
                    request.setAttribute("ErrMsg", "Nije moguce obrisati hotel,izbrisite sobe");
                    request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
                }
            }
            else if(request.getParameter("type").equals("adminMang")){
                int idManz=Integer.parseInt(request.getParameter("idManz"));
                
                AdminDao admindao=new AdminDao();
                
                if(admindao.MendzDeleteData(idManz)>0){
                    request.setAttribute("SuccMsg", "Uspesno obrisan menadzer");
                    request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
                }
            }else if(request.getParameter("type").equals("adminNalog")){
                AdminDao admindao=new AdminDao();
                int idUser=Integer.parseInt(request.getParameter("idUser"));
                if(request.getParameter("accType")!=null){
                    if(request.getParameter("accType").equals("user")){
                        if(admindao.DeleteManagerUser(idUser)>0){
                            request.setAttribute("SuccMsg", "Uspesno je obrisan nalog");
                            request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
                        }
                    }else if(request.getParameter("accType").equals("menadzer")){
                        if(admindao.DeleteManagerUser(idUser)>0){
                            request.setAttribute("SuccMsg", "Uspesno je obrisan nalog");
                            request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
                        }
                    }else if(request.getParameter("accType").equals("admin")){
                        if(admindao.DeleteAdminUser(idUser)>0){
                            request.setAttribute("SuccMsg", "Uspesno je obrisan nalog");
                            request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
                        }
                    }
                }
            }else if(request.getParameter("type").equals("adminPonuda")){
                AdminDao admindao=new AdminDao();
                int idPonude=Integer.parseInt(request.getParameter("idPonude"));
                int idHotel=Integer.parseInt(request.getParameter("idHotel"));
                if(admindao.DeletePonude(idPonude)>0){
                    request.setAttribute("SuccMsg", "Uspesno obrisana ponuda");
                    request.setAttribute("type","admin");
                    request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
                }
            }
        }
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
        processRequest(request, response);
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
