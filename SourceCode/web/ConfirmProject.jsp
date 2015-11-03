<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
<%
String projectid=request.getParameter("projectid");
String status=request.getParameter("status");
String finalstart=request.getParameter("datepick2");
String finalend=request.getParameter("datepick3");
String finalcost=request.getParameter("fcost");
String projectmanagerid=request.getParameter("pmn");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="update projectdetail set project_manager_id="+projectmanagerid+",final_start_date='"+finalstart+"',final_end_date='"+finalend+"',final_cost='"+finalcost+"',project_status='"+status+"' where project_id="+projectid+"";
int result=st.executeUpdate(sql);
	
response.sendRedirect("ViewProject.jsp");
%>
