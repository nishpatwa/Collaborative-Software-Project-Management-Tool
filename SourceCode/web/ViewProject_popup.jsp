<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
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
<%@ include file="webpart/headsection.jsp" %>
<link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />
</head>
<body>
<%
			  Class.forName("com.mysql.jdbc.Driver").newInstance();
			  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
              Statement st=con.createStatement();
			  int projectid1=Integer.parseInt(request.getParameter("projectid"));
              String sql="select * from projectdetail where project_id="+projectid1+"";
              ResultSet rs=st.executeQuery(sql);
			  int projectid=0;
			  String projectname="";
			  int projectmanagerid=0;
			  int clientid=0;
			  String finalstartdate="";
			  String finalenddate="";
			  String projectstatus="";
			  String finalcost="";
			  String description="";
			  String paymentmode="";
				while(rs.next())
				{
					projectid=rs.getInt("project_id");
					projectname=rs.getString("project_name");
					projectmanagerid=rs.getInt("project_manager_id");
					clientid=rs.getInt("client_id");
					description=rs.getString("description");
					finalstartdate=rs.getString("final_start_date");
					finalenddate=rs.getString("final_end_date");
					finalcost=rs.getString("final_cost");
					paymentmode=rs.getString("payment_mode");
					projectstatus=rs.getString("project_status");
				}
				String sql1="select client_name from clientdetail where client_id="+clientid+"";
				ResultSet rs1=st.executeQuery(sql1);
				String clientname="";
				while(rs1.next())
				{
					clientname=rs1.getString("client_name");
				}
				String sql2="select employee_name from employeedetail where employee_id="+projectmanagerid+"";
				ResultSet rs2=st.executeQuery(sql2);
				String projectmanager="";
				while(rs2.next())
				{
					projectmanager=rs2.getString("employee_name");
				}
				
%>
	<div class="page-header">
                <h1>
                  <small>Detail View of Project</small>
                </h1>
              </div>
	<table class="table table-bordered table-striped">
	<tr><th>FIELDS</th><th>VALUES</th></tr>
	
	<tr><td>PROJECT_ID</td><td><%=projectid%></td></tr>
	<tr><td>PROJECT_NAME</td><td><%=projectname%></td></tr>
	<tr><td>PROJECT_MANAGER</td><td><%=projectmanager%></td></tr>
	<tr><td>CLIENT_NAME</td><td><%=clientname%></td></tr>
	<tr><td>DESCRIPTION</td><td><%=description%></td></tr>
	<tr><td>FINAL_START_DATE</td><td><%=finalstartdate%></td></tr>
	<tr><td>FINAL_END_DATE</td><td><%=finalenddate%></td></tr>
	<tr><td>FINAL_COST</td><td><%=finalcost%></td></tr>
	<tr><td>PAYMENT_MODE</td><td><%=paymentmode%></td></tr>
	<tr><td>STATUS</td><td><%=projectstatus%></td></tr>
	
</table>
</body>
</html>
