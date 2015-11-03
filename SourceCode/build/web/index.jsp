<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>

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
			<%@ include file="webpart/leftbarmenu.jsp" %>
		  </div>
		  <div class="span9">
			<div class="page-header">
                <h1>
				<img height="70px" width="70px" src="img/Home.jpg"></img>
                  <small>List of Recent Projects</small>
                </h1>
				
              </div><%
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
              Statement st=con.createStatement();
			  String status="pending";
              String sql="SELECT projectdetail . * , employeedetail.employee_name, clientdetail.client_name FROM  `projectdetail` INNER JOIN  `employeedetail` ON projectdetail.project_manager_id = employeedetail.employee_id INNER JOIN  `clientdetail` ON projectdetail.client_id = clientdetail.client_id  where project_status!='"+status+"'";
              ResultSet rs=st.executeQuery(sql);

              %>
              <table class="table table-bordered table-striped">
                <tr >
                  <th>
                    Project Name
                  </th>
				  <th>
                    Project Manager
                  </th>
				  <th>
                    Description
                  </th>
				  <th>
                    Client Name
                  </th>
				  <th>
                   Project Start Date
                  </th>
				  <th>
                   Project End Date
                  </th>
                  <th>
                    Status
                  </th>
                  
                  </tr>
                <%
                        while(rs.next()){
                %>
                <tr >
                  <td>
                      <%=rs.getString("project_name")%>
                  </td>
                 
				  <td>
                      <%=rs.getString("employee_name")%>
                  </td>
				  <td>
                      <%=rs.getString("description")%>
                  </td>
				   <td>
                      <%=rs.getString("client_name")%>
                  </td>
                  <td>
                      <%=rs.getString("final_start_date")%>
                  </td>
                  <td>
                      <%=rs.getString("final_end_date")%>
                  </td>
                  <td>
                      <%=rs.getString("project_status")%>
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
