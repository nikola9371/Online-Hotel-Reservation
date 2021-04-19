/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

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
public class NaprednaPretragaServlet extends HttpServlet {

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
            out.println("<title>Servlet NaprednaPretragaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NaprednaPretragaServlet at " + request.getContextPath() + "</h1>");
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
        String tip=request.getParameter("pretraga");
        if(tip!=null){
            if(tip.equals("mesto")){
                String grad=request.getParameter("gradovi");
                String mesto=request.getParameter("mestoList");
                String recPretrage="";
                
                if(grad!=null){
                    if(mesto==null){
                        recPretrage=recPretrage+"where Grad='"+grad+"'";
                    }else{
                        recPretrage=recPretrage+"where Grad='"+grad+"' and Mesto='"+mesto+"'";
                    }
                }else if(mesto!=null){
                    if(grad==null){
                        recPretrage=recPretrage+"where Mesto='"+mesto+"'";
                    }
                }
                request.setAttribute("1", recPretrage);
                request.getRequestDispatcher("/NaprednaPretraga.jsp").forward(request, response);
            }else if(tip.equals("ocena")){
                String imeHotel=request.getParameter("nameHotel");
                String brZvezdica=request.getParameter("brojZvezdica");
                String guglOcena=request.getParameter("guglOcena");
                String recPretrage="";
                
                if(imeHotel!=null&&brZvezdica==null&&guglOcena==null){
                    recPretrage=" where Ime='"+imeHotel+"'";
                }else if(imeHotel!=null&&brZvezdica!=null&&guglOcena==null){
                    recPretrage=" where Ime='"+imeHotel+"' and brZvezdice='"+brZvezdica+"'";
                }else if(imeHotel!=null&&brZvezdica==null&&guglOcena!=null){
                    recPretrage=" where Ime='"+imeHotel+"' and guglOcena='"+guglOcena+"'";
                }else if(imeHotel==null&&brZvezdica!=null&&guglOcena!=null){
                    recPretrage=" where brZvezdice='"+brZvezdica+"' and guglOcena='"+guglOcena+"'";
                }else if(imeHotel==null&&brZvezdica==null&&guglOcena!=null){
                    recPretrage=" where guglOcena='"+guglOcena+"'";
                }
                request.setAttribute("2", recPretrage);
                request.getRequestDispatcher("/NaprednaPretraga.jsp").forward(request, response);
            }
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
