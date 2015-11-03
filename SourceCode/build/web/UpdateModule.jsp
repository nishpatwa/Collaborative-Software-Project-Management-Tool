<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<title>
ADDING THE MODULE
</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String modulenum=request.getParameter("modulenum");
String modulename=request.getParameter("module");
String startdate=request.getParameter("datepick2");
String enddate=request.getParameter("datepick3");
String modulestatus=request.getParameter("modulestatus");

String sql="update moduledetail set module_name='"+modulename+"',module_start_date='"+startdate+"',module_end_date='"+enddate+"',module_status='"+modulestatus+"' where module_number='"+modulenum+"'";
int result=st.executeUpdate(sql);
String sql1="update employeemodule set employee_work_status='"+modulestatus+"' where module_number='"+modulenum+"'";
result=st.executeUpdate(sql1);

st.close();
con.close();
response.sendRedirect("ViewModule.jsp");
 
%>
</body>
</html>