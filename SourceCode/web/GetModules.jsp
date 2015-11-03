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
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="select module_name,module_number from moduledetail where project_id='"+projectid+"'";
ResultSet rs=st.executeQuery(sql);
String modulebox=" ";
StringBuffer sb=new StringBuffer("");
sb.append("<option>");
sb.append("Select Module");
sb.append("</option>");
while(rs.next())
{
	sb.append("<option value='" + rs.getString("module_number") + "'>");
	sb.append(rs.getString("module_name"));
	sb.append("</option>");
}
modulebox=sb.toString();
out.println(modulebox);
%>