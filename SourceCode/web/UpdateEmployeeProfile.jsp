<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%
String employeeid=request.getParameter("employee_id");
String oldemployeename=request.getParameter("oldemployeename");
String empname=request.getParameter("empname");
String gender=request.getParameter("gender");
String address=request.getParameter("address");
String ename=request.getParameter("ename");
String phname=request.getParameter("phname");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="update  employeedetail set  employee_name='"+empname+"',gender='"+gender+"',address='"+address+"',email='"+ename+"',contact_no='"+phname+"' where employee_id="+employeeid+" ";
int result=st.executeUpdate(sql);
String sql1="update  login set  name='"+empname+"',email='"+ename+"' where name='"+oldemployeename+"' ";
int result1=st.executeUpdate(sql1);

st.close();
con.close();
response.sendRedirect("ViewEmployeeProfile.jsp");
%>
