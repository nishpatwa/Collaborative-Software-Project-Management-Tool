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
int id=Integer.parseInt(request.getParameter("id"));
String sql1="delete  from messagedetail where message_id="+id+"";
int result=st1.executeUpdate(sql1);
response.sendRedirect("ViewEmployeeSentMessages.jsp");
%>
