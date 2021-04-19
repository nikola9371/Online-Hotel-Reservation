/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Classes.MenadzerDao;
import java.io.File;
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
public class IzmeniSlikuServlet extends HttpServlet {

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
            out.println("<title>Servlet IzmeniSlikuServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IzmeniSlikuServlet at " + request.getContextPath() + "</h1>");
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
        if(request.getParameter("type")!=null&&request.getParameter("type").equals("mang")){
            request.setAttribute("idPonuda", request.getParameter("idPonuda"));
            request.getRequestDispatcher("/SlikeSmestaj.jsp").forward(request, response);
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
                if(request.getParameter("type")!=null){
                    if(request.getParameter("type").equals("mang")){
                        int idMenz=Integer.parseInt(request.getParameter("idMenz"));
                        String slikaPath=request.getParameter("slika");
                        String staraSlika=request.getParameter("oldImageName");
                        MenadzerDao menz=new MenadzerDao();

                        File slika2=new File(slikaPath);
                        File slikaOld=new File("E:\\Java_Projects\\Projekat_Java\\web\\images\\"+staraSlika);

                        if(menz.ImageChange(idMenz,slika2.getName())>0){
                            if(slika2.renameTo(new File("E:\\Java_Projects\\Projekat_Java\\web\\images\\"+slika2.getName()))){
                                if(staraSlika!=null){
                                    if(slikaOld.delete()){
                                        request.setAttribute("succMessage", "Slika je uspesno promenjena");
                                        request.getRequestDispatcher("/PostaviSliku.jsp").forward(request, response);
                                    }else{
                                        request.setAttribute("errMessage", "Stara slika nije obrisana!");
                                        request.getRequestDispatcher("/PostaviSliku.jsp").forward(request, response);
                                    }
                                }else{
                                        request.setAttribute("succMessage", "Slika je uspesno promenjena");
                                        request.getRequestDispatcher("/PostaviSliku.jsp").forward(request, response);
                                }
                            }
                            else{
                                request.setAttribute("errMessage", "Slika nije postavljena!");
                                request.getRequestDispatcher("/PostaviSliku.jsp").forward(request, response);
                            }
                        }else{
                            request.setAttribute("errMessage", "Slika nije promenjena!");
                            request.getRequestDispatcher("/PostaviSliku.jsp").forward(request, response);
                        }
                    }else if(request.getParameter("type").equals("mangHotel")){

                        String slikaPath=request.getParameter("slika");
                        String staraSlika=request.getParameter("oldImageName");
                        int idHotel=Integer.parseInt(request.getParameter("idHotel"));
                        
                        MenadzerDao menz=new MenadzerDao();

                        File slika2=new File(slikaPath);
                        File slikaOld=new File("E:\\Java_Projects\\Projekat_Java\\web\\images\\"+staraSlika);
                        
                        if(menz.ImageChangeHotel(idHotel, slika2.getName())>0){
                            if(slika2.renameTo(new File("E:\\Java_Projects\\Projekat_Java\\web\\images\\"+slika2.getName()))){
                                if(staraSlika!=null){
                                    if(slikaOld.delete()){
                                        request.setAttribute("succMessage", "Slika je uspesno promenjena");
                                        request.getRequestDispatcher("/PostaviSliku.jsp").forward(request, response);
                                    }
                                }else{
                                        request.setAttribute("succMessage", "Slika je uspesno promenjena");
                                        request.getRequestDispatcher("/PostaviSliku.jsp").forward(request, response);
                                }
                            }
                        }
                    }else if(request.getParameter("type").equals("slikaSmestaj")){
                        int idPonuda=Integer.parseInt(request.getParameter("idPonuda"));
                        String slika=request.getParameter("slika");
                        
                        File slikaPath=new File(slika);
                        
                        MenadzerDao menz=new MenadzerDao();
                        
                        if(menz.ImageAddSmestaj(idPonuda, slikaPath.getName())>0){
                            if(slikaPath.renameTo(new File("E:\\Java_Projects\\Projekat_Java\\web\\images\\rooms\\"+slikaPath.getName()))){
                                request.setAttribute("idPonuda", idPonuda);
                                request.setAttribute("SuccMessage", "Uspesno je dodata slika");
                                request.getRequestDispatcher("/SlikeSmestaj.jsp").forward(request, response);
                            }
                        }
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
