<%@page import="java.sql.Connection"%><%@page import="java.sql.DriverManager"%><%@page import="java.sql.Statement"%><%@page import="java.sql.SQLException"%><%@page import="java.util.*"%><%@page import="java.text.*"%><%@page import="javax.servlet.ServletException"%><%@page import="java.sql.ResultSet"%>
<html>
  <head>
    <meta name="generator"
    content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
    <%@ include file="webpart/headsection.jsp" %>
    <link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />
	
    <title></title>
  </head>
  <body><%
  String projectid=request.getParameter("projectid");
  %>
  <div class="page-header">
    <h1>
      <small>FILL OR UPDATE FOLLOWING INFO TO CONFORM THE PROJECT</small>
    </h1>
  </div>
  <form id="form1" class="form-horizontal" method="get" action="ConfirmProject.jsp" onsubmit="validate()">
    <input type="hidden" name="projectid" value='<%=request.getParameter("projectid")%>' />
    <%      Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
    Statement st1=con1.createStatement();
    String sql1="select * from projectdetail where project_id="+projectid+" ";
    ResultSet rs1=st1.executeQuery(sql1);
    %>
	<%while(rs1.next()){%>
	<div class="control-group">
      <label class="control-label" for="datepick2">Final Start Date</label>
      <div class="controls">
        <input type="text" name="datepick2" id="datepick2" value='<%=rs1.getString("expected_start_date")%>' />
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="datepick3">Final End Date</label>
      <div class="controls">
        <input type="text" name="datepick3" id="datepick3" value='<%=rs1.getString("expected_end_date")%>' />
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="fcost">Final Cost</label>
      <div class="controls">
        <input type="text" name="fcost" id="fcost" value='<%=rs1.getString("expected_cost")%>' />
      </div><%}%>
    </div><%      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
    Statement st=con.createStatement();
    String sql="select * from employeedetail";
    ResultSet rs=st.executeQuery(sql);
    %>
    <div class="control-group">
      <label class="control-label" for="pmn">Project Manager</label>
      <div class="controls">
        <select name="pmn" id="pmn">
		<option>Select Project Manager </option>
          <%while(rs.next()){%>
          <option value='<%=rs.getInt("employee_id")%>'>
            <%=rs.getString("employee_name")%>
          </option><%}%>
        </select>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="status">Project Status</label>
      <div class="controls">
        <select name="status" id="status">
		<option>Select Project Status</option>		
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

</script></body>
</html>
