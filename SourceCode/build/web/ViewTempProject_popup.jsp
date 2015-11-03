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
</body>
</html>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st1=con1.createStatement();
String projectid=request.getParameter("projectid");
String sql1="select * from projectdetail where project_id="+projectid+"";
ResultSet rs1=st1.executeQuery(sql1);
%>
	<div class="page-header">
                <h1>
                  <small>Detail View Of Current Temp Porject</small>
                </h1>
              </div>
	
	<table class="table table-bordered table-striped">
	<tr><th>FIELDS</th><th>VALUES</th></tr>
	<% while(rs1.next()){%>
	
	<tr><td>PROJECT_ID</td><td><%=rs1.getInt("project_id")%></td></tr>
	<tr><td>PROJECT_NAME</td><td><%=rs1.getString("project_name")%></td></tr>
	<tr><td>DESCRIPTION</td><td><%=rs1.getString("description")%></td></tr>
	<tr><td>EXPECTED_START_DATE</td><td><%=rs1.getString("expected_start_date")%></td></tr>
	<tr><td>EXPECTED_END_DATE</td><td><%=rs1.getString("expected_end_date")%></td></tr>
	<tr><td>EXPECTED_COST</td><td><%=rs1.getString("expected_cost")%></td></tr>
	<tr><td>PAYMENT_MODE</td><td><%=rs1.getString("payment_mode")%></td></tr>
	<tr><td>PROJECT_STATUS</td><td><%=rs1.getString("project_status")%></td></tr>
	<%}%>
</table>
	</center>