<%@page import="java.sql.Connection"%><%@page import="java.sql.DriverManager"%><%@page import="java.sql.Statement"%><%@page import="java.sql.SQLException"%><%@page import="java.util.*"%><%@page import="java.text.*"%><%@page import="javax.servlet.ServletException"%><%@page import="java.sql.ResultSet"%>
<html>
  <head>
    <title>PMS</title><%@ include file="webpart/headsection.jsp" %>
    <link rel="stylesheet" href="fancybox/jquery.fancybox.css" />
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
				<img height="70px" width="70px" src="img/briefcase2.jpg"></img>
                  <small>List of Confirm Projects</small>
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
                    Client Name
                  </th>
				  <th>
                    Project Manager
                  </th>
				  <th>
                    Start Date
                  </th>
                  <th>
                    Status
                  </th>
                  <th>
                    Operation
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
                      <%=rs.getString("client_name")%>
                  </td>
				  <td>
                      <%=rs.getString("employee_name")%>
                  </td>
                  <td>
                      <%=rs.getString("final_start_date")%>
                  </td>
                  
                  <td>
                      <%=rs.getString("project_status")%>
                  </td>
                  <td>
                    <div class="btn-group">
                    <a class="btn fancybox" title="detail view of record"   
                    href="ViewProject_popup.jsp?projectid=<%=rs.getInt("project_id")%>">
					<i class="icon-search"></i>
                    </a>
                    <a class="btn fancybox" title="update the record" 
                    href="UpdateProject_popup.jsp?projectid=<%=rs.getInt("project_id")%>">
                    <i class="icon-pencil"></i></a>
                    <a class="btn" title="delete the record" href="javascript:if (confirm('Are you sure?')) window.location.href = 'DeleteProject.jsp?projectid=<%=rs.getInt("project_id")%>';">
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
    <script src="fancybox/jquery.fancybox.js"></script>
    <script>
$(document).ready(function() {
                                $('.fancybox').click(function() {
                                        $.fancybox.open({
                                                href : $(this).attr('href'),
                                                type : 'iframe',
                                                padding : 5,
                                                afterClose: function() {
                                                        location.reload();
                                                }
                                        });
                                        return false;
                                });

                        
                        });

</script>
	
  </body>
</html>
