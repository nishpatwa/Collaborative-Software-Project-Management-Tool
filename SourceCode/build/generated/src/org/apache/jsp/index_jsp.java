package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.*;
import java.text.*;
import javax.servlet.ServletException;
import java.sql.ResultSet;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.*;
import java.text.*;
import java.sql.ResultSet;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(4);
    _jspx_dependants.add("/webpart/headsection.jsp");
    _jspx_dependants.add("/webpart/header.jsp");
    _jspx_dependants.add("/webpart/leftbarmenu.jsp");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <title>PMS</title>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t");
      out.write("    <title>PMS</title>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("    <!-- Bootstrap -->\r\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\" />\r\n");
      out.write("    <link href=\"css/custom.css\" rel=\"stylesheet\" media=\"screen\" />\r\n");
      out.write("\r\n");
      out.write("  </head>\r\n");
      out.write("  <body>\r\n");
      out.write("  \r\n");
      out.write("  <div id=\"wrap\">\r\n");
      out.write("\t");
      out.write("<header class=\"jumbotron subhead\" id=\"overview\">\r\n");
      out.write("\t<div class=\"container-fluid\">\r\n");
      out.write("\t\t<h1>Teamwork</h1>\r\n");
      out.write("\t\t<p class=\"lead\">the Project Management Tool</p>\r\n");
      out.write("\t\t<a class=\"btn\" href=\"login.jsp\" style=\"position: absolute; right: 5%; top: 15%; z-index: 1;\">Logout</a>\r\n");
      out.write("\t</div>\r\n");
      out.write("</header>");
      out.write("\r\n");
      out.write("\t  <div class=\"container-fluid\">\r\n");
      out.write("\t\t<div class=\"row-fluid\" style=\"padding-top: 25px;\">\r\n");
      out.write("\t\t  <div class=\"span3\">\r\n");
      out.write("\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"accordion\" id=\"accordion2\" data-spy=\"affix\" data-offset-top=\"180\">\r\n");
      out.write("\t\t\t  <div class=\"accordion-group\">\r\n");
      out.write("\t\t\t\t<div class=\"accordion-heading\">\r\n");
      out.write("\t\t\t\t  <a class=\"accordion-toggle\" href=\"index.jsp\"><i class=\"icon-home\"></i>&nbsp;Home</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t  </div>\r\n");
      out.write("\t\t\t  <div class=\"accordion-group\">\r\n");
      out.write("\t\t\t\t<div class=\"accordion-heading\">\r\n");
      out.write("\t\t\t\t  <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion2\" href=\"#collapseOne\"><i class=\"icon-briefcase\"></i>&nbsp;Project\r\n");
      out.write("\t\t\t\t  Management</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"collapseOne\" class=\"accordion-body collapse\">\r\n");
      out.write("\t\t\t\t  <div class=\"accordion-inner\">\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-list\">\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"ViewProject.jsp\"><i class=\"icon-arrow-right\"></i>&nbsp;View All Projects</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"AddProject.jsp\"><i class=\"icon-plus\"></i>&nbsp;Add New Project</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"PendingAproovals1.jsp\"><i class=\"icon-lock\"></i>&nbsp;Pending Approvals</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t  </div>\r\n");
      out.write("\t\t\t  <div class=\"accordion-group\">\r\n");
      out.write("\t\t\t\t<div class=\"accordion-heading\">\r\n");
      out.write("\t\t\t\t  <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion2\" href=\"#collapseTwo\"><i class=\"icon-user\"></i>&nbsp;Employee\r\n");
      out.write("\t\t\t\t  Management</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"collapseTwo\" class=\"accordion-body collapse\">\r\n");
      out.write("\t\t\t\t  <div class=\"accordion-inner\">\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-list\">\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"ViewEmployee.jsp\"><i class=\"icon-arrow-right\"></i>&nbsp;View All Employees</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"AddEmployee.jsp\"><i class=\"icon-plus\"></i>&nbsp;Add New Employee</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t  </div>\r\n");
      out.write("\t\t\t  <div class=\"accordion-group\">\r\n");
      out.write("\t\t\t\t<div class=\"accordion-heading\">\r\n");
      out.write("\t\t\t\t  <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion2\" href=\"#collapseThree\"><i class=\"icon-globe\"></i>&nbsp;Client\r\n");
      out.write("\t\t\t\t  Management</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"collapseThree\" class=\"accordion-body collapse\">\r\n");
      out.write("\t\t\t\t  <div class=\"accordion-inner\">\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-list\">\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"ViewClient.jsp\"><i class=\"icon-arrow-right\"></i>&nbsp;View All Clients</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"AddClient.jsp\"><i class=\"icon-plus\"></i>&nbsp;Add New Client</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t  </div>\r\n");
      out.write("\t\t\t  <div class=\"accordion-group\">\r\n");
      out.write("\t\t\t\t<div class=\"accordion-heading\">\r\n");
      out.write("\t\t\t\t  <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion2\" href=\"#collapseFour\"><i class=\"icon-tasks\"></i>&nbsp;Module\r\n");
      out.write("\t\t\t\t  Management</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"collapseFour\" class=\"accordion-body collapse\">\r\n");
      out.write("\t\t\t\t  <div class=\"accordion-inner\">\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-list\">\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"ViewModule.jsp\"><i class=\"icon-arrow-right\"></i>&nbsp;View All Modules</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t  \r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t  </div>\r\n");
      out.write("\t\t\t  <div class=\"accordion-group\">\r\n");
      out.write("\t\t\t\t<div class=\"accordion-heading\">\r\n");
      out.write("\t\t\t\t  <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion2\" href=\"#collapseFive\"><i class=\"icon-comment\"></i>&nbsp;Notification From Employees\r\n");
      out.write("\t\t\t\t  ");

					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con11=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
					Statement st11=con11.createStatement();
					String password3=(String)session.getAttribute("adminpassword");
					String sql11="select login_id from login where password='"+password3+"'";
					ResultSet rs11=st11.executeQuery(sql11);
					int loginid3=0;
					while(rs11.next())
					{
							loginid3=rs11.getInt("login_id");
					}
					String sql12="select count(1) as cnt from notification INNER JOIN login ON notification.login_id=login.login_id INNER JOIN moduledetail ON notification.module_number = moduledetail.module_number INNER JOIN projectdetail ON moduledetail.project_id = projectdetail.project_id where notification.expiry_date > NOW() and notification.login_id!="+loginid3+"";
					ResultSet rs12=st11.executeQuery(sql12);
					rs12.next();
				  
      out.write("\r\n");
      out.write("\t\t\t\t\t<span  class=\"badge badge-info pull-right\">");
      out.print(rs12.getInt("cnt"));
      out.write("</span>\r\n");
      out.write("\t\t\t\t  </a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"collapseFive\" class=\"accordion-body collapse\">\r\n");
      out.write("\t\t\t\t  <div class=\"accordion-inner\">\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-list\">\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"ViewSentNotifications.jsp\"><i class=\"icon-arrow-right\"></i>&nbsp;View Sent Notifications\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"AddNotification.jsp\"><i class=\"icon-plus\"></i>&nbsp;Add Notification</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"ViewReceivedNotifications.jsp\"><i class=\"icon-arrow-right\"></i>&nbsp;View Received Notifications\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t  </div>\r\n");
      out.write("\t\t\t  <div class=\"accordion-group\">\r\n");
      out.write("\t\t\t\t<div class=\"accordion-heading\">\r\n");
      out.write("\t\t\t\t  <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion2\" href=\"#collapseSix\"><i class=\"icon-envelope\"></i>&nbsp;Personal Message\r\n");
      out.write("\t\t\t\t  ");

					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con10=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
					Statement st10=con10.createStatement();
					String password2=(String)session.getAttribute("adminpassword");
					String sql9="select login_id from login where password='"+password2+"'";
					ResultSet rs9=st10.executeQuery(sql9);
					int loginid2=0;
					while(rs9.next())
					{
						loginid2=rs9.getInt("login_id");
					}
					String sql10="select count(1) as cnt from messagedetail where receiver_id="+loginid2+"  and read_flag='unread'"  ;
					ResultSet rs10=st10.executeQuery(sql10);
					rs10.next();
					
				  
      out.write("\r\n");
      out.write("\t\t\t\t  <span id=\"pmcnt\" class=\"badge badge-important pull-right\">");
      out.print(rs10.getInt("cnt"));
      out.write("</span>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"collapseSix\" class=\"accordion-body collapse\">\r\n");
      out.write("\t\t\t\t  <div class=\"accordion-inner\">\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-list\">\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"ViewSentMessages.jsp\"><i class=\"icon-arrow-right\"></i>&nbsp;View Sent Messages\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"AddNewMessage.jsp\"><i class=\"icon-plus\"></i>&nbsp;Compose Message</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t  <li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"ViewReceivedMessages.jsp\"><i class=\"icon-arrow-right\"></i>&nbsp;View Receieved Messages\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t  </li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t  </div>\r\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <div class=\"span9\">\r\n");
      out.write("\t\t\t<div class=\"page-header\">\r\n");
      out.write("                <h1>\r\n");
      out.write("\t\t\t\t<img height=\"70px\" width=\"70px\" src=\"img/Home.jpg\"></img>\r\n");
      out.write("                  <small>List of Recent Projects</small>\r\n");
      out.write("                </h1>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("              </div>");

              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
              Statement st=con.createStatement();
			  String status="pending";
              String sql="SELECT projectdetail . * , employeedetail.employee_name, clientdetail.client_name FROM  `projectdetail` INNER JOIN  `employeedetail` ON projectdetail.project_manager_id = employeedetail.employee_id INNER JOIN  `clientdetail` ON projectdetail.client_id = clientdetail.client_id  where project_status!='"+status+"'";
              ResultSet rs=st.executeQuery(sql);

              
      out.write("\r\n");
      out.write("              <table class=\"table table-bordered table-striped\">\r\n");
      out.write("                <tr >\r\n");
      out.write("                  <th>\r\n");
      out.write("                    Project Name\r\n");
      out.write("                  </th>\r\n");
      out.write("\t\t\t\t  <th>\r\n");
      out.write("                    Project Manager\r\n");
      out.write("                  </th>\r\n");
      out.write("\t\t\t\t  <th>\r\n");
      out.write("                    Description\r\n");
      out.write("                  </th>\r\n");
      out.write("\t\t\t\t  <th>\r\n");
      out.write("                    Client Name\r\n");
      out.write("                  </th>\r\n");
      out.write("\t\t\t\t  <th>\r\n");
      out.write("                   Project Start Date\r\n");
      out.write("                  </th>\r\n");
      out.write("\t\t\t\t  <th>\r\n");
      out.write("                   Project End Date\r\n");
      out.write("                  </th>\r\n");
      out.write("                  <th>\r\n");
      out.write("                    Status\r\n");
      out.write("                  </th>\r\n");
      out.write("                  \r\n");
      out.write("                  </tr>\r\n");
      out.write("                ");

                        while(rs.next()){
                
      out.write("\r\n");
      out.write("                <tr >\r\n");
      out.write("                  <td>\r\n");
      out.write("                      ");
      out.print(rs.getString("project_name"));
      out.write("\r\n");
      out.write("                  </td>\r\n");
      out.write("                 \r\n");
      out.write("\t\t\t\t  <td>\r\n");
      out.write("                      ");
      out.print(rs.getString("employee_name"));
      out.write("\r\n");
      out.write("                  </td>\r\n");
      out.write("\t\t\t\t  <td>\r\n");
      out.write("                      ");
      out.print(rs.getString("description"));
      out.write("\r\n");
      out.write("                  </td>\r\n");
      out.write("\t\t\t\t   <td>\r\n");
      out.write("                      ");
      out.print(rs.getString("client_name"));
      out.write("\r\n");
      out.write("                  </td>\r\n");
      out.write("                  <td>\r\n");
      out.write("                      ");
      out.print(rs.getString("final_start_date"));
      out.write("\r\n");
      out.write("                  </td>\r\n");
      out.write("                  <td>\r\n");
      out.write("                      ");
      out.print(rs.getString("final_end_date"));
      out.write("\r\n");
      out.write("                  </td>\r\n");
      out.write("                  <td>\r\n");
      out.write("                      ");
      out.print(rs.getString("project_status"));
      out.write("\r\n");
      out.write("                  </td>\r\n");
      out.write("                  \r\n");
      out.write("                  \r\n");
      out.write("                </tr>");
}
      out.write("\r\n");
      out.write("              </table>\r\n");
      out.write("\t\t  </div>\r\n");
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
