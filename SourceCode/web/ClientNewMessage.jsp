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
	<link href="css/bootstrap-wysihtml5.css" rel="stylesheet" />
  </head>
  <body>
  
  <div id="wrap">
	<%@ include file="webpart/header.jsp" %>
	  <div class="container-fluid">
		<div class="row-fluid" style="padding-top: 25px;">
		<div class="span3">
            <%@ include file="webpart/leftbarclientmenu.jsp" %>
          </div>
		  <div class="span9">
              <div class="page-header">
                <h1>
				<img height="70px" width="70px" src="img/inbox.jpg"></img>
                  <small>Add Message  </small>
                </h1>
              </div>
			 <%
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
			  String sql1="select name from login where password='"+password+"'";
			  ResultSet rs1=st.executeQuery(sql1);
			  String clientname="";
			  while(rs1.next())
			  {
					clientname=rs1.getString("name");
			  }
			  String sql2="select client_id from clientdetail where client_name='"+clientname+"'";
			  ResultSet rs2=st.executeQuery(sql2);
			  int clientid=0;
			  while(rs2.next())
			  {
				clientid=rs2.getInt("client_id");
			  }
			  String sql3="select project_manager_id from projectdetail where client_id="+clientid+"";
			  ResultSet rs3=st.executeQuery(sql3);
			  int projectmanagerid=0;
			  while(rs3.next())
			  {
					projectmanagerid=rs3.getInt("project_manager_id");
			  }
			  String sql4="select employee_name from employeedetail where employee_id="+projectmanagerid+"";
			  ResultSet rs4=st.executeQuery(sql4);
			  String employeename="";
			  while(rs4.next())
			  {
					employeename=rs4.getString("employee_name");
			  }
			  String sql5="select login_id from login where name='"+employeename+"'";
			  ResultSet rs5=st.executeQuery(sql5);
			  int loginid1=0;
			  while(rs5.next())
			  {
					loginid1=rs5.getInt("login_id");
			  }
			 %>
			 <form id="form1" method="get" class="form-horizontal" action="ClientAddMessageDetails.jsp">
              <input type="hidden" name="senderid" value='<%=loginid%>'>
			<input type="hidden" name="receiverid" value='<%=loginid1%>'>	
			  <div class="control-group">
                <label class="control-label" for="message">Message</label>
                <div class="controls" >
				<textarea name="message" id="message" class="span10" rows="7" cols="12"></textarea>
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
	<script src="js/wysihtml5-0.3.0.js"></script>
	<script src="js/bootstrap-wysihtml5.js"></script>
	<script>
		$(document).ready(function() {
			$('#message').wysihtml5();
	});</script>
</body>
</html>
