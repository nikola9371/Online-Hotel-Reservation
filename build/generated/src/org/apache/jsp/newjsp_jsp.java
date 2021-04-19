package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Classes.AdminDao;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        <form method=\"post\" action=\"probniServlet\">\n");
      out.write("            <input type=\"text\" name=\"tekst\">\n");
      out.write("            <input type=\"submit\" value=\"ovde\">\n");
      out.write("        </form>\n");
      out.write("        <form  action=\"probniServlet\" method=\"get\">\n");
      out.write("            <input type=\"file\" name=\"slika\">\n");
      out.write("            <input type=\"submit\" value=\"ovde\">\n");
      out.write("        </form>\n");
      out.write("        ");
      out.print(request.getAttribute("tekst"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("tekst2"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("tekst3"));
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <p>Admin unos novog</p><br>\n");
      out.write("        ");
      out.print(request.getAttribute("1"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("2"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("3"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("4"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("5"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("6"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("7"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("8"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("9"));
      out.write("<br>\n");
      out.write("        ");
      out.print(request.getAttribute("10"));
      out.write("\n");
      out.write("        \n");
      out.write("        ");
Timestamp t=new Timestamp(System.currentTimeMillis());
        String t1=t.toString();
        
      out.write("\n");
      out.write("        ");
SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
        Date parseDate=dateFormat.parse(t1);
        String dateee="2019-06-25 01:39:44.007";
        String date=sdf.format(t);
        String date2=sdf.format(parseDate);
        
      out.write("\n");
      out.write("        \n");
      out.write("        <p>");
      out.print(t1);
      out.write("</p>\n");
      out.write("        <p>");
      out.print(date);
      out.write("</p>\n");
      out.write("        ");
      out.print(date2);
      out.write("\n");
      out.write("        ");
      out.print(parseDate);
      out.write("\n");
      out.write("        \n");
      out.write("        ");

            AdminDao admindao=new AdminDao();
            int idUser=admindao.LoginExport(2);
        
      out.write("\n");
      out.write("        <p>");
      out.print(idUser);
      out.write("</p>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
