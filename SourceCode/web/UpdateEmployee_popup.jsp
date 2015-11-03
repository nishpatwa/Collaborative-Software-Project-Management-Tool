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
  <script src="js/jquery.js"> </script> 
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
      <small>Update the Employee-Info Here</small>
    </h1>
  </div>
  
	<br/>
	<form id="form1" class="form-horizontal" method="get" action="UpdateEmployee.jsp" onsubmit="validate()">
	<% while(rs1.next()){%>
	<input type="hidden" name="employee_id" value='<%=rs1.getInt("employee_id")%>'>
	
	<div class="control-group">
      <label class="control-label" for="empname">Employee Name</label>
      <div class="controls">
        <input type="text" name="empname" id="empname" value='<%=rs1.getString("employee_name")%>' />
      </div>
    </div>
	<div class="control-group">
                <label class="control-label" for="gender">Gender</label>
                <div class="controls">
                  <input type="radio" name="gender" id="gender" <%= (rs1.getString("gender").equals("Male") ? "checked" : "") %> value="Male"/>&nbsp;Male&nbsp;&nbsp; 
				  <input type="radio" name="gender" id="gender" <%= (rs1.getString("gender").equals("Female") ? "checked" : "")%>    value="Female"/>&nbsp;Female
                </div>
              </div>
	
	<div class="control-group">
      <label class="control-label" for="des">Address</label>
      <div class="controls">
        <textarea name="address" id="address" rows="5" cols="20"><%=rs1.getString("address")%></textarea>
      </div>
    </div>
	<input type="hidden" name="oldemail" value='<%=rs1.getString("email")%>'>
	<div class="control-group">
      <label class="control-label" for="ename">Email</label>
      <div class="controls">
        <input type="text" name="ename" id="ename" value=<%=rs1.getString("email")%> />
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="phname">Contact No</label>
      <div class="controls">
        <input type="text" name="phname" id="phname" value='<%=rs1.getString("contact_no")%>' />
      </div>
    </div>
    
			  
	<%}%>
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
</body>	
</html>