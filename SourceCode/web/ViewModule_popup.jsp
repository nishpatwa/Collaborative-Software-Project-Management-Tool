<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<%@ include file="webpart/headsection.jsp" %>
<link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />

</head>
<body>


<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st1=con1.createStatement();
String modulenum=request.getParameter("moduleid");
String sql1="SELECT moduledetail . *,projectdetail.project_name FROM `moduledetail` INNER JOIN  `projectdetail` ON moduledetail.project_id = projectdetail.project_id  where module_number="+modulenum+"";
ResultSet rs1=st1.executeQuery(sql1);

%>
<div class="page-header">
                <h1>
                  <small> Detail View Of The Task</small>
                </h1>
              </div>
	
	<table class="table table-bordered table-striped">
	
	<tr><th>FIELDS</th><th>VALUES</th></tr>
	
	<% while(rs1.next()){%>
	
	
	<tr><td>TASK_NUMBER</td><td><%=rs1.getString("module_number")%></td></tr>
	<tr><td>PROJECT_NAME</td><td><%=rs1.getString("project_name")%></td></tr>
	<tr><td>TASK_START_DATE</td><td><%=rs1.getString("module_start_date")%></td></tr>
	<tr><td>TASK_END_DATE</td><td><%=rs1.getString("module_end_date")%></td></tr>
	
	<%}%>
</table><br/><br/>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st2=con2.createStatement();
String sql2="SELECT employeemodule . *,employeedetail.employee_name,employeedetail.employee_type FROM `employeemodule` INNER JOIN  `employeedetail` ON employeemodule.employee_id = employeedetail.employee_id    where module_number="+modulenum+"";
ResultSet rs2=st2.executeQuery(sql2);

%>

	<div class="page-header">
                <h1>
                  <small> Working Employee In Current Task</small>
                </h1>
              </div>

	<table class="table table-bordered table-striped">
	
		
	<tr><th>EMPLOYEE_TYPE</th><th>EMPLOYEE_NAME</th><th>WORK_STATUS</th></tr>
	<%while(rs2.next()){%>
	<tr><td><%=rs2.getString("employee_type")%></td><td><%=rs2.getString("employee_name")%></td><td><%=rs2.getString("employee_work_status")%></td></tr>
	<%}%>
	</table>
	</body>
	</html>