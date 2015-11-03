<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.io.*"%>

<%
String empname=request.getParameter("empname");
String gender=request.getParameter("gender");
String address=request.getParameter("address");
String email=request.getParameter("email");
String phname=request.getParameter("phname");
String etype=request.getParameter("etype");
String user=request.getParameter("usertype");
String password=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="insert into employeedetail(employee_name,gender,address,email,contact_no,employee_type) values('"+empname+"','"+gender+"','"+address+"','"+email+"','"+phname+"','"+etype+"');";
int result=st.executeUpdate(sql);
String sql1="insert into login(email,password,name,user_type) values('"+email+"','"+password+"','"+empname+"','"+etype+"');";
int result1=st.executeUpdate(sql1);
response.sendRedirect("ViewEmployee.jsp");
%>
