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
String clientid=request.getParameter("clientid");
String sql1="select * from clientdetail where client_id="+clientid+"";
ResultSet rs1=st1.executeQuery(sql1);
%>
	<div class="page-header">
                <h1>
                  <small> Detail View Of Client</small>
                </h1>
              </div>
	
	<table class="table table-bordered table-striped">
	
	
	<tr><th>FIELDS</th><th>VALUES</th></tr>
	<% while(rs1.next()){%>
	
	<tr><td>CLIENT_ID:</td><td><%=rs1.getInt("client_id")%></td></tr>
	<tr><td>CLIENT_NAME:</td><td><%=rs1.getString("client_name")%></td></tr>
	<tr><td>COMPANY_NAME:</td><td><%=rs1.getString("company_name")%></td></tr>
	<tr><td>COMPANY_ADDRESS:</td><td><%=rs1.getString("company_address")%></td></tr>
	<tr><td>DESCRIPTION:</td><td><%=rs1.getString("description")%></td></tr>
	<tr><td>DOMAIN:</td><td><%=rs1.getString("domain")%></td></tr>
	<tr><td>EMAIL:</td><td><%=rs1.getString("email")%></td></tr>
	<tr><td>CONTACT:</td><td><%=rs1.getString("contact_no")%></td></tr>
	
	<%}%>
	
</table>
</body>
</html>
