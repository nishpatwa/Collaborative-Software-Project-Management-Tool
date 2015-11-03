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
                <h1><img src="img/chat.jpg" height="70px" width="70px"></img>
                  <small>List of Sent Notifications</small>
                </h1>
              </div><%
              String password1=(String)session.getAttribute("employeepassword");
			  String sql4="select login_id from login where password='"+password1+"'";
              ResultSet rs4=st.executeQuery(sql4);
              int loginid=0;
              while(rs4.next())
             {
	              loginid=rs4.getInt("login_id");
             }
			  String sql5="select notification.*,moduledetail.module_name,projectdetail.project_name  from notification INNER JOIN  `moduledetail` ON notification.module_number = moduledetail.module_number  INNER JOIN projectdetail ON moduledetail.project_id=projectdetail.project_id  where login_id="+loginid+"";
              ResultSet rs5=st.executeQuery(sql5);
				
              %>
              <table class="table table-bordered table-striped">
                <tr >
                  <th>
                    Project Name
                  </th>
                  <th>
                     Module Name
                  </th>
				  <th>
                    Description
                  </th>
					<th>
					Operation
					</th>
	
                                  </tr>
                <%
                        while(rs5.next()){
						String classname="";
					if(rs5.getString("priority").equals("Low Priority"))
					{
						classname="success";
					}
					if(rs5.getString("priority").equals("Medium Priority"))
					{
						classname="warning";
					}
					if(rs5.getString("priority").equals("High Priority"))
					{
						classname="error";
					}
                %>
                <tr  class="<%=classname%>">
                  <td>
                      <%=rs5.getString("project_name")%>
                  </td>
                  <td>
                      <%=rs5.getString("module_name")%>
                  </td>
				  <td>
                      <%=rs5.getString("description")%>
                  </td>
				  <td>
				  <div class="btn-group">
                    
                    <a class="btn" title="delete the record" href="javascript:if (confirm('Are you sure?')) window.location.href = 'DeleteNotification1.jsp?id=<%=rs5.getInt("notification_id")%>';">
                    <i class="icon-trash"></i></a>
					</div>
				  </td>
                                    
                  
                </tr><%}%>
              </table>
		  </div>
		</div>
	  </div>
	  <div id="push"></div>
	</div>
	<%@ include file="webpart/footer.jsp" %>
</body>
</html>
