<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
<%
String employeeid=request.getParameter("employeeid");
String modulenumber=request.getParameter("modulenumber");
String workstatus=request.getParameter("workstatus");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="update  employeemodule set  employee_work_status='"+workstatus+"'where employee_id="+employeeid+" and module_number='"+modulenumber+"'";
int result=st.executeUpdate(sql);

%>