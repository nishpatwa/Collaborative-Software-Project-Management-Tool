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
                <small> ADD the Message  </small>
              </h1>
            </div>
			<form id="form1" method="get" class="form-horizontal" action="EmployeeAddMessageDetails.jsp">
              <%
					String sql4="select login_id from login where password='"+password+"'";
					ResultSet rs4=st.executeQuery(sql4);
			  %>
			  <%while(rs4.next()){%>
			  <input type="hidden" name="senderid" value='<%=rs4.getInt("login_id")%>'>
			  <%}%>
			  <%
					String sql5="select login_id,name from login";
					ResultSet rs5=st.executeQuery(sql5);
			  %>
			  <div class="control-group">
                <label class="control-label" for="receiverid">Select Name</label>
                <div class="controls">
                  <select name="receiverid" id="receiverid">
				  <option>Select Name</option>
				  <%while(rs5.next()){%>
					<option value='<%=rs5.getInt("login_id")%>'><%=rs5.getString("name")%></option>
					<%}%>
					<%
						String sql6="select login_id,name from login where user_type='admin'  ";
						ResultSet rs6=st.executeQuery(sql6);
					%>
					<%while(rs6.next()){%>
					<option value='<%=rs6.getInt("login_id")%>' ><%=rs6.getString("name")%></option>
				  <%}%>
				  <%
						String sql7="select client_id from projectdetail where project_manager_id="+projectmanagerid+"";
						ResultSet rs7=st.executeQuery(sql7);
						int clientid=0;
						while(rs7.next())
						{
							clientid=rs7.getInt("client_id");	
						}
						String sql8="select client_name from clientdetail where client_id="+clientid+"";
						ResultSet rs8=st.executeQuery(sql8);
						String clientname="";
						while(rs8.next())
						{
							clientname=rs8.getString("client_name");
						}
						String sql200="select login_id,name from login where name='"+clientname+"'";
						ResultSet rs200=st.executeQuery(sql200);
						
				  %>
				  <%while(rs200.next()){%>
				  <option value='<%=rs200.getInt("login_id")%>'><%=rs200.getString("name")%></option>
				  <%}%>
				  </select>
				  </div>
				  </div>
				  
				<div class="control-group">
                <label class="control-label" for="subject">Subject</label>
                <div class="controls" >
				<input type="text" name="subject" class="span10" id="subject">
                </div>
              </div>
			  <div class="control-group">
                <label class="control-label" for="message">Message</label>
                <div class="controls" >
				<textarea name="message" id="message" rows="7" cols="12" class="span10"> </textarea>
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
