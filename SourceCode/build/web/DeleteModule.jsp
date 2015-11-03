<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.ResultSet"%>


<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st1=con1.createStatement();
String moduleid=request.getParameter("moduleid");
String sql1="delete  from moduledetail where module_number='"+moduleid+"'";
int result1=st1.executeUpdate(sql1);
String sql2="delete  from employeemodule where module_number='"+moduleid+"'";
int result2=st1.executeUpdate(sql2);
response.sendRedirect("ViewModule1.jsp");
%>
