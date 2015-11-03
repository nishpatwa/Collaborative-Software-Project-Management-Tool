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
int ProjectManagerid=Integer.parseInt(request.getParameter("pmn"));
String des=request.getParameter("des");
String fsd=request.getParameter("datepick2"); 
String fed=request.getParameter("datepick3"); 
String fcost=request.getParameter("ecost");
String pmd=request.getParameter("pmd");
String status=request.getParameter("status");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st2=con.createStatement();
String sql="update projectdetail set project_name='"+ProjName+"',project_manager_id="+ProjectManagerid+",description='"+des+"',final_start_date='"+fsd+"',final_end_date='"+fed+"',final_cost='"+fcost+"',Payment_mode='"+pmd+"',project_status='"+status+"' where project_id="+projectid+"";
int result=st2.executeUpdate(sql);
st2.close();
con.close();
response.sendRedirect("ViewProject.jsp");

%>