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
	<link href="css/bootstrap-wysihtml5.css" rel="stylesheet" />
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
			<%  Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String usertype="employee";
String sql="select login_id,name from login where user_type='"+usertype+"' ";
ResultSet rs=st.executeQuery(sql);


%>
			<div class="page-header">
              <h1><img src="img/inbox.jpg" height="70px" width="70px"></img>
                <small> ADD the Message to Employee  </small>
              </h1>
            </div>
			<form id="form1" method="get" class="form-horizontal" action="AddMessageDetails.jsp">
              
			  <div class="control-group">
                <label class="control-label" for="receiverid">Select Name</label>
                <div class="controls">
                  <select name="receiverid" id="receiverid">
				  <option>Select Name</option>
				  <%while(rs.next()){%>
				  <option value='<%=rs.getInt("login_id")%>'><%=rs.getString("name")%></option>
				  <%}%>  
				  </select>
                </div>
              </div>
			  <%
			  String password=(String)session.getAttribute("adminpassword");
			  String sql1="select  login_id from login where password='"+password+"'";
			  ResultSet rs1=st.executeQuery(sql1);

			  %>
				<%while(rs1.next()){%>
				<input type="hidden" name="senderid" value='<%=rs1.getInt("login_id")%>'>
			    <%}%>
				
			 <div class="control-group">
                <label class="control-label" for="subject">Subject</label>
                <div class="controls" >
				<input type="text" name="subject" class="span10" id="subject">
                </div>
              </div>	
				
			  <div class="control-group">
                <label class="control-label" for="message">Message</label>
                <div class="controls" >
				<textarea name="message" id="message" rows="7" cols="12" class="span10"></textarea>
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
	<script src="js/select2.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#message').wysihtml5();
			$('select').addClass('span4').select2();
		});
	</script>
</body>
</html>
