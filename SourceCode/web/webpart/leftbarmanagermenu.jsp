<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.ResultSet"%>
	
	<div class="accordion" id="accordion2" data-spy="affix" data-offset-top="180">
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" href="EmployeeProfile.jsp"><i class="icon-home"></i>&nbsp;Home</a>
				</div>
			  </div>
			  
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" href="ViewEmployeeProfile.jsp"><i class="icon-file"></i>&nbsp;View My Profile</a>
				</div>
			  </div>
            			  
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" href="AddClient.jsp"><i class="icon-file"></i>&nbsp;Add New Client</a>
				</div>
			  </div>
            			  
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" href="ViewClient.jsp"><i class="icon-file"></i>&nbsp;View All Clients</a>
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour"><i class="icon-tasks"></i>&nbsp;Project
				  Management</a>
				</div>
				<div id="collapseFour" class="accordion-body collapse">
				  <div class="accordion-inner">
					<ul class="nav nav-list">
					   <li>
						<a href="AddProject.jsp"><i class="icon-plus"></i>&nbsp;Add New Project</a>
					  </li>
                                          <li>
						<a href="AddModule.jsp"><i class="icon-plus"></i>&nbsp;Add New Task</a>
					  </li>
					
                                          <li>
						<a href="ViewModule1.jsp"><i class="icon-arrow-right"></i>&nbsp;View All Assigned Tasks</a>
					  </li>
					</ul>
				  </div>
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" href="ViewProjectManagerProjectDetails.jsp"><i class="icon-file"></i>&nbsp;View My Project Detail</a>
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" href="ViewMyStatus.jsp"><i class="icon-edit"></i>&nbsp;Change My Work Status</a>
				</div>
			  </div>
   
			  <div class="accordion-group">
				<div class="accordion-heading">
				 
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive"><i class="icon-comment"></i>&nbsp;Notification
				  <%
						String password3=(String)session.getAttribute("employeepassword");
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con21=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
				Statement st21=con21.createStatement();
				String sql21="select name from login where password='"+password3+"'";
				ResultSet rs21=st21.executeQuery(sql21);
				String name21="";
				while(rs21.next())
				{
					name21=rs21.getString("name");
				}
				String sql22="select employee_id from employeedetail where employee_name='"+name21+"'";
				ResultSet rs22=st21.executeQuery(sql22);
				int empid22=0;
				while(rs22.next())
				{
					empid22=rs22.getInt("employee_id");
				}
				String sql23="select project_manager_id from projectdetail where project_manager_id="+empid22+"";
				ResultSet rs23=st21.executeQuery(sql23);
				int projectmanagerid23=0;
				while(rs23.next())
				{
					projectmanagerid23=rs23.getInt("project_manager_id");
				}
				String sql24="select employee_name from employeedetail where employee_id="+projectmanagerid23+"";
				ResultSet rs24=st21.executeQuery(sql24);
				String empname24="";
				while(rs24.next())
				{
					empname24=rs24.getString("employee_name");
				}
				String sql25="select login_id from login where password='"+password3+"'";
				ResultSet rs25=st21.executeQuery(sql25);
				int loginid25=0;
				while(rs25.next())
				{
					loginid25=rs25.getInt("login_id");
				}
						String sql26= "SELECT  count(1) as cnt  from(select notification_id"
						+ "	FROM ( "
						+ "	SELECT notification. * , projectdetail.project_name, moduledetail.module_name, login.name "
						+ "	FROM employeemodule "
						+ "	INNER JOIN notification ON employeemodule.module_number = notification.module_number "
						+ "	AND notification.login_id != " + loginid25
						+ "	INNER JOIN login ON notification.login_id = login.login_id "
						+ "	INNER JOIN moduledetail ON employeemodule.module_number = moduledetail.module_number "
						+ "	INNER JOIN projectdetail ON moduledetail.project_id = projectdetail.project_id "
						+ "	WHERE notification.expiry_date > NOW() and employeemodule.employee_id = " + empid22
						+ "	UNION ALL "
						+ "	SELECT notification. * , projectdetail.project_name, moduledetail.module_name, login.name "
						+ "	FROM projectdetail "
						+ "	INNER JOIN moduledetail ON projectdetail.project_id = moduledetail.project_id "
						+ "	INNER JOIN notification ON moduledetail.module_number = notification.module_number "
						+ "	INNER JOIN login ON notification.login_id = login.login_id "
						+ "	WHERE notification.expiry_date > NOW() and notification.login_id != " + loginid25
						+ "	AND projectdetail.project_manager_id = " + projectmanagerid23
						+ "	)a "
						+" group by notification_id)b";
						ResultSet rs26=st21.executeQuery(sql26);
						rs26.next();	
				  %>
				   <span  class="badge badge-info pull-right"><%=rs26.getInt("cnt")%></span>
				</a>
				</div>
				<div id="collapseFive" class="accordion-body collapse">
				  <div class="accordion-inner">
					<ul class="nav nav-list">
	
					  <li>
						<a href="ViewEmployeeReceivedNotification.jsp"><i class="icon-arrow-right"></i>&nbsp;View Received Notifications</a>
					  </li>
					</ul>
				  </div>
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseSix"><i class="icon-envelope"></i>&nbsp;Personal Message
				  <%
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con10=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
					Statement st10=con10.createStatement();
					String password2=(String)session.getAttribute("employeepassword");
					String sql9="select login_id from login where password='"+password2+"'";
					ResultSet rs9=st10.executeQuery(sql9);
					int loginid3=0;
					while(rs9.next())
					{
						loginid3=rs9.getInt("login_id");
					}
					String sql10="select count(1) as cnt from messagedetail where receiver_id="+loginid3+"  and read_flag='unread'"  ;
					ResultSet rs10=st10.executeQuery(sql10);
					rs10.next();
					
				  %>
				  <span id="pmcnt1" class="badge badge-important pull-right"><%=rs10.getInt("cnt")%></span>
				  </a>
				</div>
				<div id="collapseSix" class="accordion-body collapse">
				  <div class="accordion-inner">
					<ul class="nav nav-list">
					  <li>
						<a href="ViewEmployeeSentMessages.jsp"><i class="icon-arrow-right"></i>&nbsp;View Sent Messages</a>
					  </li>
					  <li>
						<a href="EmployeeAddMessage.jsp"><i class="icon-plus"></i>&nbsp;Compose Message</a>
					  </li>
					  <li>
						<a href="EmployeeReceivedMessages.jsp"><i class="icon-arrow-right"></i>&nbsp;View Receieved Messages</a>
					  </li>
					</ul>
				  </div>
				</div>
			  </div>
</div>