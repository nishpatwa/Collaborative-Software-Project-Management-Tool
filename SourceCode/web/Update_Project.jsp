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
String status=request.getParameter("status");
String projectid=request.getParameter("projectid");
String moduleid=request.getParameter("moduleid");
System.out.println(moduleid);
String sql1="UPDATE EMPLOYEEMODULE SET EMPLOYEE_WORK_STATUS = '"+status+"' WHERE project_id = '"+projectid+"' and module_number = '"+moduleid+"'";
int result1=st1.executeUpdate(sql1);
response.sendRedirect("EmployeeProfile.jsp");
%>
