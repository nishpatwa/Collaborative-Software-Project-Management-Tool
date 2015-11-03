<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
<%
String projectid=request.getParameter("project_id");
String ProjName=request.getParameter("ProjName");
String des=request.getParameter("des");
String esd=request.getParameter("datepick2"); 
String eed=request.getParameter("datepick3"); 
String ecost=request.getParameter("ecost");
String pmd=request.getParameter("pmd");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st2=con.createStatement();
String sql="update projectdetail set project_name='"+ProjName+"',description='"+des+"',expected_start_date='"+esd+"',expected_end_date='"+eed+"',expected_cost='"+ecost+"',Payment_mode='"+pmd+"' where project_id="+projectid+"";
int result=st2.executeUpdate(sql);
st2.close();
con.close();
response.sendRedirect("PendingAproovals1.jsp");

%>