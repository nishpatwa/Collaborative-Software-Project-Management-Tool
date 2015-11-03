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
	<link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />
  <link href="css/select2.css" rel="stylesheet" />
	<link href="css/bootstrap-wysihtml5.css" rel="stylesheet" />
  </head>
  <script>

function showModule(str)
{
	
var xmlhttp;    
if (str=="")
  {
  document.getElementById("modulename").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("modulename").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","GetModules1.jsp?q="+str,true);
xmlhttp.send();
}


  </script>
  
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
		<%
			String sql4="select login_id from login where password='"+password+"'";
			ResultSet rs4=st.executeQuery(sql4);
			int loginid=0;
			while(rs4.next())
			{
				loginid=rs4.getInt("login_id");
			}	
			String sql5="select projectdetail.project_id,projectdetail.project_name from projectdetail INNER JOIN moduledetail ON projectdetail.project_id=moduledetail.project_id INNER JOIN employeemodule ON moduledetail.module_number=employeemodule.module_number where employeemodule.employee_id="+empid+" GROUP BY projectdetail.project_id,projectdetail.project_name";
			ResultSet rs5=st.executeQuery(sql5);
		%>
			<div class="page-header">
              <h1><img src="img/chat.jpg" height="70px" width="70px"></img>
                <small>Fill following detail to ADD the Notification</small>
              </h1>
            </div>
			<form id="form1" method="get" class="form-horizontal" action="AddEmployeeNotificationDetails.jsp">
			<input type="hidden" name="loginid" value='<%=loginid%>'>
              <div class="control-group">
                <label class="control-label" for="projectname">Select Project Name</label>
                <div class="controls">
                  <select name="projectname" id="projectname" onchange="showModule(this.value)">
				  <option>Select The Project</option>
				  <%while(rs5.next()){%>
				  <option value='<%=rs5.getInt("project_id")%>'><%=rs5.getString("project_name")%></option>
				  <%}%></select>
                </div>
              </div>
			  
			  <div class="control-group">
                <label class="control-label" for="modulename">Select Module Name</label>
                <div class="controls" >
				<select id="modulename" name="modulename">
					<option>Select Module</option>
				</select>
                </div>
              </div>
			  <div class="control-group">
                <label class="control-label" for="description">Add Description</label>
                <div class="controls" >
				<textarea name="description" id="description" span="class10"rows="7" cols="12"></textarea>
                </div>
              </div>
			  <div class="control-group">
                <label class="control-label" for="priority">Priority</label>
                <div class="controls" >
				<select name="priority" id="priority">
				<option>Select Notification Priority</option>
				<option value="High Priority">High Priority</option>
				<option value="Medium Priority">Medium Priority</option>
				<option value="Low Priority">Low Priority</option>
				</select>
                </div>
              </div>
			  <div class="control-group">
                <label class="control-label" for="datepick2">Expiry Date</label>
                <div class="controls">
				<div class="input-append">
                  <input type="text" name="datepick2" id="datepick2" readonly value="" />
				  <span class="add-on"><i class="icon-calendar"></i></span>
                </div>
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
	<script src="js/jquery-ui.js"></script>
	<script src="js/wysihtml5-0.3.0.js"></script>
	<script src="js/bootstrap-wysihtml5.js"></script>
	<script src="js/select2.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#description').wysihtml5();
			$('select').addClass('span4').select2();
		$('#datepick2').datepicker({ dateFormat: 'yy-m-d' });
	});</script>
	
</body>
</html>
