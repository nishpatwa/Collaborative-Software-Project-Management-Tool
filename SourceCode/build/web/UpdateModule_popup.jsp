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
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st1=con1.createStatement();
String moduleid=request.getParameter("moduleid");
String sql1="select * from moduledetail where module_number='"+moduleid+"'";
ResultSet rs1=st1.executeQuery(sql1);
%>
	<div class="page-header">
    <h1>
      <small>Update the Task-Info Here</small>
    </h1>
  </div>
  
	<br/>
	<form id="form1" class="form-horizontal" method="get" action="UpdateModule.jsp" onsubmit="validate()">
	
	<% while(rs1.next()){%>
	<input type="hidden" name="modulenum" value='<%=request.getParameter("moduleid")%>'>
	<div class="control-group">
      <label class="control-label" for="module">Task Name</label>
      <div class="controls">
        <input type="text" name="module" id="module" value='<%=rs1.getString("module_name")%>' />
      </div>
    </div>
	
	
	<div class="control-group">
      <label class="control-label" for="datepick2">Task Start Date</label>
      <div class="controls">
        <input type="text" name="datepick2" id="datepick2" value=<%=rs1.getString("module_start_date")%> />
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="datepick3">Task End Date</label>
      <div class="controls">
        <input type="text" name="datepick3" id="datepick3" value='<%=rs1.getString("module_end_date")%>' />
      </div>
    </div>
    
	
	<div class="control-group">
      <label class="control-label" for="modulestatus">Task Status</label>
      <div class="controls">
          <%Statement st_status=con1.createStatement();
//String moduleid_status=request.getParameter("moduleid");
String sql_status="select employee_work_status from employeemodule where module_number='"+moduleid+"'";
ResultSet rs_status=st_status.executeQuery(sql_status);
          
          rs_status.next();
          %>

        <select name="modulestatus" id="modulestatus">
		<option <%= (rs_status.getString("employee_work_status") .equals( "Not started") ? "selected" : "") %>>Not Started</option>
		<option <%= (rs_status.getString("employee_work_status") .equals( "In Progress") ? "selected" : "") %>>In Progress</option>
                <option <%= (rs_status.getString("employee_work_status") .equals( "Under Review") ? "selected" : "") %>>Under Review</option>
		<option <%= (rs_status.getString("employee_work_status") .equals( "Completed") ? "selected" : "") %>>Completed</option>
		</select>
		</div>
    </div>
	<%}%>
		<div class="control-group">
                <div class="controls">
                  <input type="submit" class="btn btn-primary" value="SUBMIT" />
                </div>
              </div>
	</form>
	<script src="js/jquery.js"></script> 
  <script src="js/jquery-ui.js"></script> 
  
  <script>
$(document).ready(function() {
	$('#datepick2, #datepick3').datepicker({ dateFormat: 'yy-m-d' });
	
});
function validate()
{
    parent.jQuery.fancybox.close();
}

</script>
</body>	
</html>