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
String employeeid=request.getParameter("employeeid");
String sql1="select * from employeedetail where employee_id="+employeeid+"";
ResultSet rs1=st1.executeQuery(sql1);
%>
	<div class="page-header">
                <h1>
                  <small> Detail View Of Employee</small>
                </h1>
              </div>
	
	<table class="table table-bordered table-striped">
	
	
	<tr><th>FIELDS</th><th>VALUES</th></tr>
	
	<% while(rs1.next()){%>
	
	<tr><td>EMPLOYEE_ID:</td><td><%=rs1.getInt("employee_id")%></td></tr>
	<tr><td>EMPLOYEE_NAME:</td><td><%=rs1.getString("employee_name")%></td></tr>
	<tr><td>GENDER:</td><td><%=rs1.getString("gender")%></td></tr>
	<tr><td>ADDRESS:</td><td><%=rs1.getString("address")%></td></tr>
	<tr><td>EMAIL:</td><td><%=rs1.getString("email")%></td></tr>
	<tr><td>CONTACT_NO:</td><td><%=rs1.getString("contact_no")%></td></tr>
	<tr><td>EMPLOYEE_TYPE:</td><td><%=rs1.getString("employee_type")%></td></tr>
	
	<%}%>
</table>
</body>
</html>
