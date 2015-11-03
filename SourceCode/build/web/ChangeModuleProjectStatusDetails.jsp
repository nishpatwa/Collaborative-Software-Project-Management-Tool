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
	String modulenumber=request.getParameter("modulenumber");
	String projectstatus=request.getParameter("projectstatus");
	String modulestatus=request.getParameter("modulestatus");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
	Statement st=con.createStatement();
	String sql="update projectdetail set project_status='"+projectstatus+"' where project_id='"+projectid+"'";
	int result=st.executeUpdate(sql);
	
	String sql1="update moduledetail set module_status='"+modulestatus+"' where module_number='"+modulenumber+"'";
	int result1=st.executeUpdate(sql1);
		
	response.sendRedirect("EmployeeProfile.jsp");
%>