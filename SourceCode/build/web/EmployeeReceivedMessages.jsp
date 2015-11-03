<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.ResultSet"%>


<html>
  <head>
    <title>PMS</title>
	
	
	<%@ include file="webpart/headsection.jsp" %>
	<style type="text/css">
	#accordionMessage .accordion-heading .accordion-toggle  { padding: 2px 15px; } 
	.unread { font-weight: bold; } 
	</style>
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
                <h1><img src="img/inbox.jpg" height="70px" width="70px"></img>
                  <small>Inbox</small>
                </h1>
              </div><%
              String sql4="select login_id from login where password='"+password+"'";
			  ResultSet rs4=st.executeQuery(sql4);
			  int loginid=0;
			  while(rs4.next())
			  {
				loginid=rs4.getInt("login_id");
			  }
			  String sql5="select messagedetail.*,login.name from messagedetail INNER JOIN login ON messagedetail.sender_id=login.login_id where messagedetail.receiver_id="+loginid+"";
			  ResultSet rs5=st.executeQuery(sql5);
			  
              %>
              <div class="accordion" id="accordionMessage">
			  <% while (rs5.next()) { %>
			  
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <div id="msg<%=rs5.getString("message_id")%>" class="accordion-toggle clearfix <%=rs5.getString("read_flag")%>" data-toggle="collapse" data-parent="#accordionMessage" href="#message<%=rs5.getString("message_id")%>">
					<div class="span3"><%=rs5.getString("name")%></div>
					<div class="span6"><%=rs5.getString("subject")%></div>
					<div class="span2"><%=rs5.getDate("send_date")%></div>
					
				  </div>
				</div>
				<div id="message<%=rs5.getString("message_id")%>" class="accordion-body collapse">
				  <div class="accordion-inner">
					Message:&nbsp;<%=rs5.getString("message")%>
				  </div>
				</div>
			  </div>
			<% } %>
			</div>
		  </div>
		</div>
	  </div>
	  <div id="push"></div>
	</div>
	<%@ include file="webpart/footer.jsp" %>
	<script>
		$(document).ready(function() {
			$('.unread').on('click', function () {
				var $this = $(this);
				if ($this.hasClass('unread')) {
					$.ajax({
						url: "UpdateFlag.jsp?id=" + $this.attr('id').replace('msg', ''),
						complete: function() {
							$this.removeClass('unread');
							$('#pmcnt1').html($('.unread').length);
							
						}
					});
					
				}
			});
		});
	</script>
</body>
</html>
