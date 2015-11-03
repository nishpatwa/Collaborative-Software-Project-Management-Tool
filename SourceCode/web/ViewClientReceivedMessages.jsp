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
  </head>
  <body>
  
  <div id="wrap">
	<%@ include file="webpart/header.jsp" %>
	<style type="text/css">
	#accordionMessage .accordion-heading .accordion-toggle  { padding: 2px 15px; } 
	.unread { font-weight: bold; } 
	</style>
	  <div class="container-fluid">
		<div class="row-fluid" style="padding-top: 25px;">
		  <div class="span3">
			<%@ include file="webpart/leftbarclientmenu.jsp" %>
		  </div>
		  <div class="span9">
			<div class="page-header">
                <h1><img src="img/inbox.jpg" height="70px" width="70px"></img>
                  <small>Inbox</small>
                </h1>
              </div><%
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
              Statement st=con.createStatement();
			  String password=(String)session.getAttribute("clientpassword");
			  String sql="select login_id from login where password='"+password+"'";
			  ResultSet rs=st.executeQuery(sql);
			  int loginid=0;
			  while(rs.next())
			  {
				loginid=rs.getInt("login_id");
			  }
			  String sql1="select messagedetail.*,login.name from messagedetail INNER JOIN login ON messagedetail.sender_id=login.login_id where messagedetail.receiver_id="+loginid+"";
			  ResultSet rs1=st.executeQuery(sql1);
			  
              %>
              <div class="accordion" id="accordionMessage">
			  <% while (rs1.next()) { %>
			  
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <div id="msg<%=rs1.getString("message_id")%>" class="accordion-toggle clearfix <%=rs1.getString("read_flag")%>" data-toggle="collapse" data-parent="#accordionMessage" href="#message<%=rs1.getString("message_id")%>">
					<div class="span3"><%=rs1.getString("name")%></div>
					<div class="span6"><%=rs1.getString("subject")%></div>
					<div class="span2"><%=rs1.getDate("send_date")%></div>
					
				  </div>
				</div>
				<div id="message<%=rs1.getString("message_id")%>" class="accordion-body collapse">
				  <div class="accordion-inner">
					Message:&nbsp;<%=rs1.getString("message")%>
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
							$('#pmcnt2').html($('.unread').length);
							
						}
					});
					
				}
			});
		});
	</script>
</body>
</html>
