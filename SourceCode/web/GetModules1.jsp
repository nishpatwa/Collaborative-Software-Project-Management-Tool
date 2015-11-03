<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
<%
String projectid=request.getParameter("q");
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

String sql2="select moduledetail.module_name,moduledetail.module_number from moduledetail INNER JOIN employeemodule ON moduledetail.module_number=employeemodule.module_number where project_id='"+projectid+"' and employeemodule.employee_id="+empid+"";
ResultSet rs2=st.executeQuery(sql2);
String modulebox=" ";
StringBuffer sb=new StringBuffer("");

sb.append("<option>");
sb.append("Select Module");
sb.append("</option>");
while(rs2.next())
{
	sb.append("<option value='" + rs2.getString("module_number") + "'>");
	sb.append(rs2.getString("module_name"));
	sb.append("</option>");
}
sb.append("</select>");
modulebox=sb.toString();
out.println(modulebox);
%>