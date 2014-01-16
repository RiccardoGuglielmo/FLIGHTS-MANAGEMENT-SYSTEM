package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class gestione_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jspf");
    _jspx_dependants.add("/nav.jspf");
  }

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>FLIGHTS MANAGEMENT SYSTEM</title>\n");
      out.write("        <link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <div id=\"container\">\n");
      out.write("            \n");
      out.write("            <header>\n");
      out.write("                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<h1><img src=\"aereo.png\" height=\"50\" width=\"80\">  FLIGHTS MANAGEMENT SYSTEM  <img src=\"aereo.png\" height=\"50\" width=\"80\"></img></h1>");
      out.write("\n");
      out.write("            </header>\n");
      out.write("\n");
      out.write("            <nav>\n");
      out.write("                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<a href=\"index.jsp\">Home</a>\n");
      out.write("<a href=\"voli.jsp\">Voli</a>\n");
      out.write("<a href=\"prenotazioni.jsp\">Prenotazioni</a>\n");
      out.write("<a href=\"checkin.jsp\">Check-in</a>\n");
      out.write("<a href=\"areagestori.jsp\">Area gestori</a>");
      out.write("\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <article>\n");
      out.write("                \n");
      out.write("                <div class=\"center\">\n");
      out.write("                    \n");
      out.write("                    Inserisci nuovo record per:\n");
      out.write("                    \n");
      out.write("                    Volo\n");
      out.write("                    \n");
      out.write("                    Tariffa\n");
      out.write("                    \n");
      out.write("                    Località\n");
      out.write("                    \n");
      out.write("                    Compagnia Aerea\n");
      out.write("                    \n");
      out.write("                    Velivolo\n");
      out.write("                    \n");
      out.write("                    Tipo Velivolo\n");
      out.write("                    \n");
      out.write("                    <table id=\"rl\">\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                Inserisci nuovo record per:\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <form method=\"post\" action=\"checkreg.jsp\">\n");
      out.write("                                    <input type=\"submit\" name=\"submit\" value=\"Volo\">\n");
      out.write("                                </form>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </article>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
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
