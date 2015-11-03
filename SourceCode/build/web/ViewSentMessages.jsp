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
	</style>
  </head>
  <body>
  
  <div id="wrap">
	<%@ include file="webpart/header.jsp" %>
	  <div class="container-fluid">
		<div class="row-fluid" style="padding-top: 25px;">
		  <div class="span3">
			<%@ include file="webpart/leftbarmenu.jsp" %>
		  </div>
		  <div class="span9">
			<div class="page-header">
                <h1><img src="img/inbox.jpg" height="70px" width="70px"></img>
                  <small>Sent Items</small>
                </h1>
              </div><%
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
              Statement st=con.createStatement();
			  String password=(String)session.getAttribute("adminpassword");
			  String sql="select login_id from login where password='"+password+"'";
			  ResultSet rs=st.executeQuery(sql);
			  int loginid=0;
			  while(rs.next())
			  {
				loginid=rs.getInt("login_id");
			  }
              String sql1="select messagedetail.*,login.name from messagedetail INNER JOIN login ON messagedetail.receiver_id=login.login_id where sender_id="+loginid+" ";
              ResultSet rs1=st.executeQuery(sql1);

              %>
			  
			  <div class="accordion" id="accordionMessage">
			  <% while (rs1.next()) { %>
			  <div class="accordion-group">
				<div class="accordion-heading">
				  <div class="accordion-toggle clearfix" data-toggle="collapse" data-parent="#accordionMessage" href="#message<%=rs1.getString("message_id")%>">
					<div class="span3"><%=rs1.getString("name")%></div>
					<div class="span6"><%=rs1.getString("subject")%></div>
					<div class="span2"><%=rs1.getDate("send_date")%></div>
					<div class="span1">
						<a class="btn" title="delete the record" href="javascript:if (confirm('Are you sure?')) window.location.href = 'DeleteMessage.jsp?id=<%=rs1.getInt("message_id")%>'" onclick="event.stopPropagation();">
						<i class="icon-trash"></i></a>
					</div>
				  </div>
				</div>
				<div id="message<%=rs1.getString("message_id")%>" class="accordion-body collapse">
				  <div class="accordion-inner">
					<%=rs1.getString("message")%>
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
</body>
</html>
