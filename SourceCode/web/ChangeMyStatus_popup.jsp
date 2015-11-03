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
     <link href="css/select2.css" rel="stylesheet" />
<link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />
  <script src="js/jquery.js"> </script> 
  
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String employeeid=request.getParameter("id");
String modulenum=request.getParameter("modulenum");

%>
	<div class="page-header">
    <h1>
      <small>Update the Status</small>
    </h1>
  </div>
  
	<br/>
	<form id="form1" class="form-horizontal" method="get" action="ChangeMyStatus.jsp" onsubmit="validate()">
	<input type="hidden" name="modulenumber" value='<%=modulenum%>'>
	<input type="hidden" name="employeeid" value='<%=employeeid%>'>
    <div class="control-group">
                <label class="control-label" for="workstatus">Work Status</label>
                <div class="controls">
                  <select name="workstatus" id="workstatus">
				  
				  <option value="Not Started">Not Started</option>
				  <option value="Running">Running</option>
				  <option value="Completed">Completed</option>
				  </select>
                </div>
              </div>
			  
	
		<div class="control-group">
                <div class="controls">
                  <input type="submit" class="btn btn-primary" value="SUBMIT" />
                </div>
              </div>
	</form>
<script>
function validate()
{
    parent.jQuery.fancybox.close();
}

</script>
<script src="js/select2.min.js"></script>
	<script>
		$(document).ready(function() {
	
			$('select').addClass('span4').select2();
	
	});</script>
</body>	
</html>