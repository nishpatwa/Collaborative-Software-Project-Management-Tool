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
				  <a class="accordion-toggle" href="ClientProfile.jsp"><i class="icon-home"></i>&nbsp;Home</a>
				</div>
			  </div>
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" href="ViewClientDetail.jsp"><i class="icon-file"></i>&nbsp;View My Detail</a>
				</div>
			  </div>
			  
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseSix"><i class="icon-envelope"></i>&nbsp;Personal Message
				   <%
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con10=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
					Statement st10=con10.createStatement();
					String password2=(String)session.getAttribute("clientpassword");
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
				  <span id="pmcnt2" class="badge badge-important pull-right"><%=rs10.getInt("cnt")%></span>
				  </a>
				</div>
				<div id="collapseSix" class="accordion-body collapse">
				  <div class="accordion-inner">
					<ul class="nav nav-list">
					  <li>
						<a href="ViewClientSentMessages.jsp"><i class="icon-arrow-right"></i>&nbsp;View Sent Messages</a>
					  </li>
					  <li>
						<a href="ClientNewMessage.jsp"><i class="icon-plus"></i>&nbsp;Compose Message</a>
					  </li>
					  <li>
						<a href="ViewClientReceivedMessages.jsp"><i class="icon-arrow-right"></i>&nbsp;View Receieved Messages</a>
					  </li>
					</ul>
				  </div>
				</div>
			  </div>
</div>