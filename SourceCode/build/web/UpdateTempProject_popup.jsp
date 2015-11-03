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
	<form id="form1" class="form-horizontal" method="get" action="UpdateTempProject.jsp" onsubmit="validate()">
	<% while(rs1.next()){%>
	<input type="hidden" name="project_id" value='<%=rs1.getInt("project_id")%>'>
	<div class="control-group">
      <label class="control-label" for="ProjName">Project Name</label>
      <div class="controls">
        <input type="text" name="ProjName" id="ProjName" value='<%=rs1.getString("project_name")%>' />
      </div>
    </div>
	
	
	<div class="control-group">
      <label class="control-label" for="des">Description</label>
      <div class="controls">
        <textarea name="des" id="des" rows="5" cols="20"><%=rs1.getString("description")%></textarea>
      </div>
    </div>
	<div class="control-group">
      <label class="control-label" for="datepick2">Expected Start Date</label>
      <div class="controls">
        <input type="text" name="datepick2" id="datepick2" value=<%=rs1.getString("expected_start_date")%> />
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="datepick3">Expected End Date</label>
      <div class="controls">
        <input type="text" name="datepick3" id="datepick3" value='<%=rs1.getString("expected_end_date")%>' />
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="ecost">Expected Cost</label>
      <div class="controls">
        <input type="text" name="ecost" id="ecost" value=<%=rs1.getString("expected_cost")%> />
      </div>
    </div>
	    <div class="control-group">
                <label class="control-label" for="pmd">Payment Mode</label>
                <div class="controls">
                  <select name="pmd" id="pmd">
				  <option>Select Payment Mode</option>
				  <option <%= (rs1.getString("payment_mode") .equals( "Cash") ? "selected" : "") %>>Cash</option>
				  <option <%= (rs1.getString("payment_mode") .equals( "Cheque") ? "selected" : "") %>>Cheque</option>
				  <option <%= (rs1.getString("payment_mode") .equals( "Credit Card") ? "selected" : "") %>>Credit Card</option>
				  <option <%= (rs1.getString("payment_mode") .equals( "Debit Card") ? "selected" : "") %>>Debit Card</option>
				  <option <%= (rs1.getString("payment_mode") .equals( "Net Banking") ? "selected" : "") %>>Net Banking</option>
				  </select>
                </div>
              </div>
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