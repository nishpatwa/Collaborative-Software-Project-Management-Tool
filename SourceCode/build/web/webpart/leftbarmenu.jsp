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
				  <a class="accordion-toggle" href="index.jsp"><i class="icon-home"></i>&nbsp;Home</a>
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				 
				</div>
				<div id="collapseOne" class="accordion-body collapse">
				  <div class="accordion-inner">
					
				  </div>
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo"><i class="icon-user"></i>&nbsp;Employee
				  Management</a>
				</div>
				<div id="collapseTwo" class="accordion-body collapse">
				  <div class="accordion-inner">
					<ul class="nav nav-list">
					  <li>
						<a href="ViewEmployee.jsp"><i class="icon-arrow-right"></i>&nbsp;View All Employees</a>
					  </li>
					  <li>
						<a href="AddEmployee.jsp"><i class="icon-plus"></i>&nbsp;Add New Employee</a>
					  </li>
					</ul>
				  </div>
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				 
				</div>
				<div id="collapseThree" class="accordion-body collapse">
			
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				  
				</div>
				<div id="collapseFour" class="accordion-body collapse">
				
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				 
				</div>
				<div id="collapseFive" class="accordion-body collapse">
				  <div class="accordion-inner">
					<ul class="nav nav-list">
					
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
					String password2=(String)session.getAttribute("adminpassword");
					String sql9="select login_id from login where password='"+password2+"'";
					ResultSet rs9=st10.executeQuery(sql9);
					int loginid2=0;
					while(rs9.next())
					{
						loginid2=rs9.getInt("login_id");
					}
					String sql10="select count(1) as cnt from messagedetail where receiver_id="+loginid2+"  and read_flag='unread'"  ;
					ResultSet rs10=st10.executeQuery(sql10);
					rs10.next();
					
				  %>
				  <span id="pmcnt" class="badge badge-important pull-right"><%=rs10.getInt("cnt")%></span>
				</a>
				</div>
				<div id="collapseSix" class="accordion-body collapse">
				  <div class="accordion-inner">
					<ul class="nav nav-list">
					  <li>
						<a href="ViewSentMessages.jsp"><i class="icon-arrow-right"></i>&nbsp;View Sent Messages
						
						</a>
					  </li>
					  <li>
						<a href="AddNewMessage.jsp"><i class="icon-plus"></i>&nbsp;Compose Message</a>
					  </li>
					  <li>
						<a href="ViewReceivedMessages.jsp"><i class="icon-arrow-right"></i>&nbsp;View Receieved Messages
						
						</a>
					  </li>
					</ul>
				  </div>
				</div>
			  </div>
</div>