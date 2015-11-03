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

public final class AddModule_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(3);
    _jspx_dependants.add("/webpart/headsection.jsp");
    _jspx_dependants.add("/webpart/header.jsp");
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
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>\r\n");
      out.write("ADD THE MODULE\r\n");
      out.write("</title>\r\n");
      out.write("    <title>PMS</title>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("    <!-- Bootstrap -->\r\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\" />\r\n");
      out.write("    <link href=\"css/custom.css\" rel=\"stylesheet\" media=\"screen\" />\r\n");
      out.write("\r\n");
      out.write("<link href=\"css/custom-theme/jquery-ui-1.9.2.custom.css\" rel=\"stylesheet\" media=\"screen\" />\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("function showEmployee(sender)\r\n");
      out.write("{\r\n");
      out.write("\tvar p = $(sender).parent(), index = p.parent().get(0).rowIndex, $ddlEmp = p.next().find('select');\r\n");
      out.write("\tif (sender.selectedIndex === 0) {\r\n");
      out.write("\t\t$ddlEmp.html('<option>Select Employee</option>');\r\n");
      out.write("\t}\r\n");
      out.write("\telse {\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl: \"GetEmployee.jsp?q=\" + sender.value,\r\n");
      out.write("\t\t\tsuccess: function(data, textStatus, jqXHR) {\r\n");
      out.write("\t\t\t\t$ddlEmp.html(data).find('#employeename').attr('name', 'employeename' + index);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function addRow(sender)\r\n");
      out.write("{\r\n");
      out.write("\tvar senderTr = $(sender).closest('tr'), \r\n");
      out.write("\t\tindex = senderTr.get(0).rowIndex, \r\n");
      out.write("\t\tcln = senderTr.prev('tr').clone();\r\n");
      out.write("\t\r\n");
      out.write("\tcln.find('#employeetype').attr('name', 'employeetype' + index);\r\n");
      out.write("\tcln.find('#employeeName').attr('name', 'employeename' + index).prop('selectedIndex', 0);\r\n");
      out.write("\tcln.find('#status').attr('name', 'status' + index);\r\n");
      out.write("\t\r\n");
      out.write("\tcln.insertBefore(senderTr);\r\n");
      out.write("}\r\n");
      out.write("function deleteRow(sender)\r\n");
      out.write("{\t\r\n");
      out.write("\tvar tbl = $('#tblEmployee');\r\n");
      out.write("\tif (tbl.find('tr').length > 3 && confirm('Are you sure?')) {\r\n");
      out.write("\t\t$(sender).closest('tr').remove();\r\n");
      out.write("\t\t// reassign names\r\n");
      out.write("\t\ttbl.find('tr').each(function(index) {\r\n");
      out.write("\t\t\t$(this).find('#employeetype').attr('name', 'employeetype' + index);\r\n");
      out.write("\t\t\t$(this).find('#employeeName').attr('name', 'employeeName' + index);\r\n");
      out.write("\t\t\t$(this).find('#status').attr('name', 'status' + index);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function validate()\r\n");
      out.write("{\r\n");
      out.write("\tdocument.getElementById(\"counter\").value=$('#tblEmployee').find('tr').length - 2;\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"wrap\">\r\n");
      out.write("      ");
      out.write("<header class=\"jumbotron subhead\" id=\"overview\">\r\n");
      out.write("\t<div class=\"container-fluid\">\r\n");
      out.write("\t\t<h1>COLLABORATE</h1>\r\n");
      out.write("\t\t<p class=\"lead\">THE PROJECT MANAGEMENT TOOL</p>\r\n");
      out.write("\t\t<a class=\"btn\" href=\"login.jsp\" style=\"position: absolute; right: 5%; top: 15%; z-index: 1;\">Logout</a>\r\n");
      out.write("\t</div>\r\n");
      out.write("</header>");
      out.write("\r\n");
      out.write("      <div class=\"container-fluid\">\r\n");
      out.write("        <div class=\"row-fluid\" style=\"padding-top: 25px;\">\r\n");
      out.write("          <div class=\"span3\">\r\n");
      out.write("            ");
	String password=(String)session.getAttribute("employeepassword");
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
				Statement st=con.createStatement();
				String sql="select name from login where password='"+password+"'";
				ResultSet rs=st.executeQuery(sql);
				String name="";
				while(rs.next())
				{
					name=rs.getString("name");
				}
				String sql1="select employee_id from employeedetail where employee_name='"+name+"'";
				ResultSet rs1=st.executeQuery(sql1);
				int empid=0;
				while(rs1.next())
				{
					empid=rs1.getInt("employee_id");
				}
				String sql2="select project_manager_id from projectdetail where project_manager_id="+empid+"";
				ResultSet rs2=st.executeQuery(sql2);
				int projectmanagerid=0;
				while(rs2.next())
				{
					projectmanagerid=rs2.getInt("project_manager_id");
				}
				String sql3="select employee_name from employeedetail where employee_id="+projectmanagerid+"";
				ResultSet rs3=st.executeQuery(sql3);
				String empname="";
				while(rs3.next())
				{
					empname=rs3.getString("employee_name");
				}
				if(empname.equals(name))
				{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t");
}
				else{
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t");
}
      out.write("\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"span9\">\r\n");
      out.write("            <div class=\"page-header\">\r\n");
      out.write("              <h1><img src=\"img/module.jpg\" height=\"70px\" width=\"70px\"></img>\r\n");
      out.write("                <small>Fill following detail to ADD the Module</small>\r\n");
      out.write("              </h1>\r\n");
      out.write("            </div>\r\n");
      out.write("            <form id=\"form1\" method=\"get\" class=\"form-horizontal\" onsubmit=\"validate()\" action=\"AddModuleDetails.jsp\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"counter\" id=\"counter\">\t\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"control-group\">\r\n");
      out.write("                <label class=\"control-label\" for=\"modulename\">Module Name</label>\r\n");
      out.write("                <div class=\"controls\">\r\n");
      out.write("                  <input type=\"text\" class=\"mandatory\" name=\"modulename\" id=\"modulename\" value=\"\" />\r\n");
      out.write("                </div>\r\n");
      out.write("              </div>\r\n");

String sql4="select project_id,final_start_date,final_end_date from projectdetail where project_manager_id="+projectmanagerid+"";
ResultSet rs4=st.executeQuery(sql4);
Date minDate;
Date maxDate;
int minyear=0;
int minmonth=0;
int mindate=0;
int maxyear=0;
int maxmonth=0;
int maxdate=0;
while(rs4.next()){


      out.write("\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"projectid\" value='");
      out.print(rs4.getInt("project_id"));
      out.write("'>\r\n");
      out.write("\t\t\t");

				 minDate=rs4.getDate("final_start_date");
				 maxDate=rs4.getDate("final_end_date");
				 minyear=minDate.getYear();
				 minmonth=minDate.getMonth();
				 mindate=minDate.getDate();
				 maxyear=maxDate.getYear();
				 maxmonth=maxDate.getMonth();
				 maxdate=maxDate.getDate();
			}
      out.write("\r\n");
      out.write("\t\t\t  <div class=\"control-group\">\r\n");
      out.write("                <label class=\"control-label\" for=\"datepick2\">Module Start Date</label>\r\n");
      out.write("                <div class=\"controls\">\r\n");
      out.write("                  <input type=\"text\" class=\"mandatory\" name=\"datepick2\" id=\"datepick2\" value=\"\"/>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("              </div>\r\n");
      out.write("\t\t\t  <div class=\"control-group\">\r\n");
      out.write("                <label class=\"control-label\" for=\"datepick3\">Module End Date</label>\r\n");
      out.write("                <div class=\"controls\">\r\n");
      out.write("                  <input type=\"text\" class=\"mandatory\" name=\"datepick3\" id=\"datepick3\" value=\"\"/>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("              </div>\r\n");
      out.write("              <div class=\"control-group\">\r\n");
      out.write("                <label class=\"control-label\" for=\"compname\">Module Status</label>\r\n");
      out.write("                <div class=\"controls\">\r\n");
      out.write("                  <select name=\"modulestatus\" class=\"mandatory\" id=\"modulestatus\" class=\"span4\">\r\n");
      out.write("\t\t\t\t  <option>Select The Module Status</option>\r\n");
      out.write("\t\t\t\t  <option value=\"Not Started\">Not Started</option>\r\n");
      out.write("\t\t\t\t  <option value=\"Running\">Running</option>\r\n");
      out.write("\t\t\t\t  <option value=\"Completed\">Completed</option></select>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
      out.write("              </div>\r\n");
      out.write("              \r\n");
      out.write("\t\t\t\t<div class=\"page-header\">\r\n");
      out.write("              <h2>\r\n");
      out.write("                <small> ADD Employee in current Module</small>\r\n");
      out.write("              </h2>\r\n");
      out.write("            </div>\r\n");
      out.write("                  <table id=\"tblEmployee\" class=\"table table-bordered table-striped\">\r\n");
      out.write("                <tr >\r\n");
      out.write("\t\t\t\t<th>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t</th>\r\n");
      out.write("                  <th>\r\n");
      out.write("                    Employee Type\r\n");
      out.write("                  </th>\r\n");
      out.write("                  <th>\r\n");
      out.write("                    Employee Name\r\n");
      out.write("                  </th>\r\n");
      out.write("\t\t\t\t  <th>\r\n");
      out.write("                    Employee Work Status\r\n");
      out.write("                  </th>\r\n");
      out.write("\t\t     \r\n");
      out.write("                  </tr>\r\n");
      out.write("\t\t\t\t  \r\n");
      out.write("\t\t\t\t  <tr>\r\n");
      out.write("<td><i class=\"icon-trash\" onclick=\"deleteRow(this)\"></td>\r\n");
      out.write("<td><select class=\"mandatory\" name=\"employeetype1\" id=\"employeetype\" onchange=\"showEmployee(this)\"><option>Select Type</option><option value=\"Analyst\">Analyst</option><option value=\"Designer\">Designer</option><option value=\"Developer\">Developer</option><option value=\"Tester\">Tester</option></td>\r\n");
      out.write("<td><select class=\"mandatory\" name=\"employeename1\" id=\"employeename\" ><option>Select Employee</option></select></td>\r\n");
      out.write("<td><select class=\"mandatory\" name=\"status1\" id=\"status\"><option>Select Work Status</option><option value=\"Not Started\">Not Started</option><option value=\"Running\">Running</option><option value=\"Completed\">Completed</option></select></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr><td><i class=\"icon-plus\" onclick=\"addRow(this);\" /></td><td></td><td></td><td></td></tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t \r\n");
      out.write("              </table>  \r\n");
      out.write("\t\t\t<div class=\"control-group\">\r\n");
      out.write("                <div class=\"controls\">\r\n");
      out.write("                  <input type=\"submit\" class=\"btn btn-primary\" value=\"SUBMIT\" />\r\n");
      out.write("                </div>\r\n");
      out.write("              </div>\r\n");
      out.write("            </form>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"push\"></div>\r\n");
      out.write("    </div>");
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
      out.write("\t<script src=\"js/jquery-ui.js\"></script>\r\n");
      out.write("\t\r\n");
      out.write("\t<script>$(document).ready(function() {\r\n");
      out.write("\t\t$('#datepick2, #datepick3').datepicker({ dateFormat: 'yy-m-d', minDate: (new Date(");
      out.print(minyear);
      out.write(" + 1900, ");
      out.print(minmonth);
      out.write(" , ");
      out.print(mindate);
      out.write(")), maxDate: (new Date(");
      out.print(maxyear );
      out.write(" + 1900, ");
      out.print( maxmonth);
      out.write(" , ");
      out.print( maxdate);
      out.write(")) });\r\n");
      out.write("\t});</script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
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
