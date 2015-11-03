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
    <title>PMS</title>
	
	
	<%@ include file="webpart/headsection.jsp" %>
	<link href="css/select2.css" rel="stylesheet" />
  </head>
  <body>
  
  <div id="wrap">
	<%@ include file="webpart/header.jsp" %>
	  <div class="container-fluid">
		<div class="row-fluid" style="padding-top: 25px;">
		  <div class="span3">
			 <%	String password=(String)session.getAttribute("employeepassword");
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
				Statement st=con.createStatement();
				String sql="select name from login where password='"+password+"'";
				ResultSet rs=st.executeQuery(sql);
				String name="";
				while(rs.next())
				{
					name=rs.getString("name");
				}
				String sql1="select employee_id from employeedetail where employee_name='"+name+"'";
				ResultSet rs1=st.executeQuery(sql1);
				int empid=0;
				while(rs1.next())
				{
					empid=rs1.getInt("employee_id");
				}
				String sql2="select project_manager_id from projectdetail where project_manager_id="+empid+"";
				ResultSet rs2=st.executeQuery(sql2);
				int projectmanagerid=0;
				while(rs2.next())
				{
					projectmanagerid=rs2.getInt("project_manager_id");
				}
				String sql3="select employee_name from employeedetail where employee_id="+projectmanagerid+"";
				ResultSet rs3=st.executeQuery(sql3);
				String empname="";
				while(rs3.next())
				{
					empname=rs3.getString("employee_name");
				}
				if(empname.equals(name))
				{ %>
					<%@ include file="webpart/leftbarmanagermenu.jsp" %>
				
			<%}
				else{%>	
				<%@ include file="webpart/leftbaremployeemenu.jsp" %>
				
				<%}%>
		 
		  </div>
		  <div class="span9">
			<div class="page-header">
              <h1><img src="img/edit.jpg" height="70px" width="70px"></img>
                <small> Change Module And Project Status </small>
              </h1>
            </div>
			<form id="form1" method="get" class="form-horizontal" action="ChangeModuleProjectStatusDetails.jsp">
              
			  
			   <%
						String sql4="select project_id from projectdetail where project_manager_id="+projectmanagerid+"";
						ResultSet rs4=st.executeQuery(sql4);
						int projectid=0;
						while(rs4.next())
						{
							projectid=rs4.getInt("project_id");
						}
						String sql5="select * from moduledetail where project_id="+projectid+"";
						ResultSet rs5=st.executeQuery(sql5);
							
			   %>
			   
			   <input type="hidden" name="projectid" value='<%=projectid%>'>
			   <div class="control-group">
                <label class="control-label" for="modulenumber">Select Module Here</label>
                <div class="controls" >
				<select name="modulenumber" id="modulenumber">
				<option>Select Module</option>
				<%while(rs5.next()){%>
				<option value='<%=rs5.getString("module_number")%>'><%=rs5.getString("module_name")%></option>
				<%}%>
				</select>
                </div>
              </div>
			   
			  <div class="control-group">
                <label class="control-label" for="modulestatus">Change Module Status</label>
                <div class="controls" >
				<select name="modulestatus" id="modulestatus">
				<option>Change Status</option>
				<option value="Not Started">Not Started</option>
				<option value="Running">Running</option>
				<option value="Completed">Completed</option>
				</select>
                </div>
              </div>
			  
			  <div class="control-group">
                <label class="control-label" for="projectstatus">Change Project Status</label>
                <div class="controls" >
				<select name="projectstatus" id="projectstatus">
				<option>Change Status</option>
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
		  </div>
		</div>
	  </div>
	  <div id="push"></div>
	</div>
	<%@ include file="webpart/footer.jsp" %>
	<script src="js/select2.min.js"></script>
	<script>$(document).ready(function() {
		
		$('select').addClass('span4').select2();
	});</script>

</body>
</html>
