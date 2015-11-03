package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(2);
    _jspx_dependants.add("/webpart/headsection.jsp");
    _jspx_dependants.add("/webpart/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <title>PMS</title>\r\n");
      out.write("\t");
      out.write("    <title>PMS</title>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("    <!-- Bootstrap -->\r\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\" />\r\n");
      out.write("    <link href=\"css/custom.css\" rel=\"stylesheet\" media=\"screen\" />\r\n");
      out.write("\r\n");
      out.write("  </head>\r\n");
      out.write("  <body>\r\n");
      out.write("  <div id=\"wrap\">\r\n");
      out.write("\t<header class=\"jumbotron subhead\" id=\"overview\">\r\n");
      out.write("\t<div class=\"container-fluid\">\r\n");
      out.write("\t\t<h1>Teamwork</h1>\r\n");
      out.write("\t\t<p class=\"lead\">the Project Management Tool</p>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</header>\r\n");
      out.write("\t<div class=\"container-fluid\">\r\n");
      out.write("\t\t<div class=\"row-fluid\" style=\"padding-top: 3%;\">\r\n");
      out.write("\t\t\t<div class=\"span6 offset3\">\r\n");
      out.write("\t\t\t\t<div class=\"page-header\">\r\n");
      out.write("\t\t\t\t\t");

						String alert="";
						if(session.getAttribute("alert")!=null)
						{
							alert=(String)session.getAttribute("alert");
						}
						
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<h3>");
      out.print(alert);
      out.write("</h3><h1><small>Sign In</small></h1>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<form class=\"form-horizontal well\" method=\"get\" action=\"LoginDetail.jsp\">\r\n");
      out.write("\t\t\t\t\t<div class=\"control-group\">\r\n");
      out.write("\t\t\t\t\t<label class=\"control-label\" for=\"inputEmail\">Email</label>\r\n");
      out.write("\t\t\t\t\t<div class=\"controls\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-prepend\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"add-on\"><i class=\"icon-envelope\"></i></span>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"inputEmail\" name=\"inputEmail\" placeholder=\"Email\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t  <div class=\"control-group\">\r\n");
      out.write("\t\t\t\t\t<label class=\"control-label\" for=\"inputPassword\">Password</label>\r\n");
      out.write("\t\t\t\t\t<div class=\"controls\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-prepend\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"add-on\"><i class=\"icon-lock\"></i></span>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"password\" id=\"inputPassword\" name=\"inputPassword\" placeholder=\"Password\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t <div class=\"control-group\">\r\n");
      out.write("\t\t\t\t <label class=\"control-label\">\r\n");
      out.write("\t\t\t\t </label>\r\n");
      out.write("\t\t\t\t <div class=\"controls\">\r\n");
      out.write("\t\t\t\t <a href=\"ForgotPassword1.jsp\" style=\"text-decoration:none\" >Forgot Your Password?</a>\r\n");
      out.write("\t\t\t\t </div>\r\n");
      out.write("\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t  \r\n");
      out.write("\t\t\t\t  <div class=\"control-group\">\r\n");
      out.write("\t\t\t\t\t<div class=\"controls\">\r\n");
      out.write("\t\t\t\t\t  <button type=\"submit\" class=\"btn\">Log in</button>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t  </div>\r\n");
      out.write("\t  <div id=\"push\"></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t");
      out.write("  <footer id=\"footer\">\r\n");
      out.write("    <div class=\"muted text-center\">&copy; 2013, Shah Pvt. Ltd.</div>\r\n");
      out.write("  </footer>\r\n");
      out.write("  <script src=\"js/jquery.js\"></script> \r\n");
      out.write("  <script src=\"js/bootstrap.min.js\"></script> \r\n");
      out.write("  <script src=\"js/custom.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\t$(document).ready(function() {\r\n");
      out.write("\t\t$('form').on('submit', function() {\r\n");
      out.write("\t\t\treturn checkMandatoryFields();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("</script>");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
