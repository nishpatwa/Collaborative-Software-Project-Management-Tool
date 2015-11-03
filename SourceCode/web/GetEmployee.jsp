<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
<%
String employeetype=request.getParameter("q");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="select employee_name from employeedetail where employee_type='"+employeetype+"'";
ResultSet rs=st.executeQuery(sql);
String employee=" ";
StringBuffer sb=new StringBuffer("");
sb.append("<option>");
sb.append("Select Employee");
sb.append("</option>");
while(rs.next())
{
	sb.append("<option>");
	sb.append(rs.getString("employee_name"));
	sb.append("</option>");
}
employee=sb.toString();
out.println(employee);
%>