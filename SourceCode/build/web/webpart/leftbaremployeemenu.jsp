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
				  <a class="accordion-toggle" href="ViewMyStatus.jsp"><i class="icon-edit"></i>&nbsp;Change My Work Status</a>
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
                               Statement stmt=con21.createStatement();
                                                                                   String sql_not = "SELECT COUNT(*) as cnt FROM EMPLOYEEMODULE where read_flag=0 and employee_id="+loginid25+"; ";
						ResultSet rs26=stmt.executeQuery(sql_not);
						rs26.next();	
                                               // session.setAttribute("norts",rs26.getInt("cnt"));                                   
 
		String readflag = request.getParameter("flag_read");		  
                int cnot;
                if(readflag!=null)
                                       {
                    cnot = Integer.parseInt(readflag);
                }
                               else{
                    cnot = rs26.getInt("cnt");
                               }

				  %>
				   <span  class="badge badge-info pull-right"><%=cnot%></span>
				 </a>
				</div>
				<div id="collapseFive" class="accordion-body collapse">
				  <div class="accordion-inner">
					<ul class="nav nav-list">
					 
					  <li>
						<a href="ViewMyStatus.jsp"><i class="icon-arrow-right"></i>&nbsp;View Received Notifications
						
						</a>
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
						<a href="ViewEmployeeSentMessages.jsp"><i class="icon-arrow-right"></i>&nbsp;View Sent Messages
						
						</a>
					  </li>
					  <li>
						<a href="EmployeeAddMessage.jsp"><i class="icon-plus"></i>&nbsp;Compose Message</a>
					  </li>
					  <li>
						<a href="EmployeeReceivedMessages.jsp"><i class="icon-arrow-right"></i>&nbsp;View Receieved Messages
						
						</a>
					  </li>
					</ul>
				  </div>
				</div>
			  </div>
</div>