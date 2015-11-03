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
String projectid=request.getParameter("projectid");
String sql1="select * from projectdetail where project_id="+projectid+"";
ResultSet rs1=st1.executeQuery(sql1);
%>
	<div class="page-header">
    <h1>
      <small>Update the Project-Info Here</small>
    </h1>
  </div>
  
	<br/>
	<form id="form1" class="form-horizontal" method="get" action="UpdateProject.jsp" onsubmit="validate()">
	<% while(rs1.next()){%>
	<input type="hidden" name="project_id" value='<%=rs1.getInt("project_id")%>'>
	<div class="control-group">
      <label class="control-label" for="ProjName">Project Name</label>
      <div class="controls">
        <input type="text" name="ProjName" id="ProjName" value='<%=rs1.getString("project_name")%>' />
      </div>
    </div>
	<%	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="select * from employeedetail";
ResultSet rs=st.executeQuery(sql);
%>
	<div class="control-group">
      <label class="control-label" for="pmn">Project Manager</label>
      <div class="controls">
		<select name="pmn" id="pmn">
		
		<%while(rs.next()){%>
		<option value='<%=rs.getInt("employee_id")%>'><%=rs.getString("employee_name")%></option>
		<%}%>
		</select>
        </div>
    </div>
	<div class="control-group">
      <label class="control-label" for="des">Description</label>
      <div class="controls">
        <textarea name="des" id="des" rows="5" cols="20"><%=rs1.getString("description")%></textarea>
      </div>
    </div>
	<div class="control-group">
      <label class="control-label" for="datepick2">Final Start Date</label>
      <div class="controls">
        <input type="text" name="datepick2" id="datepick2" value=<%=rs1.getString("final_start_date")%> />
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="datepick3">Final End Date</label>
      <div class="controls">
        <input type="text" name="datepick3" id="datepick3" value='<%=rs1.getString("final_end_date")%>' />
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="fcost">Final Cost</label>
      <div class="controls">
        <input type="text" name="fcost" id="fcost" value=<%=rs1.getString("final_cost")%> />
      </div>
    </div>
	<div class="control-group">
      <label class="control-label" for="pmd">Payment Mode</label>
      <div class="controls">
        <input type="text" name="pmd" id="pmd" value=<%=rs1.getString("payment_mode")%> />
      </div>
    </div>
	<div class="control-group">
      <label class="control-label" for="status">Status</label>
      <div class="controls">
        <select name="status" id="status">
		
		<option <%= (rs1.getString("project_status") .equals( "Not Started") ? "selected" : "") %>>Not Started</option>
		<option <%= (rs1.getString("project_status") .equals( "Running") ? "selected" : "") %>>Running</option>
		<option <%= (rs1.getString("project_status") .equals( "Completed") ? "selected" : "") %>>Completed</option>
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