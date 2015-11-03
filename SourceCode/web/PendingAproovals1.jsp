<%@page import="java.sql.Connection"%><%@page import="java.sql.DriverManager"%><%@page import="java.sql.Statement"%><%@page import="java.sql.SQLException"%><%@page import="java.util.*"%><%@page import="java.text.*"%><%@page import="javax.servlet.ServletException"%><%@page import="java.sql.ResultSet"%>
<html>
  <head>
    <meta name="generator"
    content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
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
                  <small>List of Pending Projects</small>
                </h1>
              </div><%
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
              Statement st=con.createStatement();
			  String status="pending";
              String sql="select * from projectdetail where project_status='"+status+"'";
              ResultSet rs=st.executeQuery(sql);

              %>
              <table class="table table-bordered table-striped">
                <tr>
                  <th>
                    Project Name
                  </th>
                  
				  <th>
                    Expected Start Date
                  </th>
				  <th>
                    Expected End Date
                  </th>
				  <th>
                    Project Status
                  </th>
                  <th>
                    Operation
                  </th>
                  <th>
				  Confirmation
				  </th>
                </tr>
                <%
                        while(rs.next()){
                %>
                <tr>
                  <td>
                      <%=rs.getString("project_name")%>
                  </td>
                  <td>
                      <%=rs.getString("expected_start_date")%>
                  </td>
				  <td>
                      <%=rs.getString("expected_end_date")%>
                  </td>
                  <td>
                      <%=rs.getString("project_status")%>
                  </td>
                  <td>
                    <div class="btn-group">
                    <a class="btn fancybox" title="detail view of record"   
                    href="ViewTempProject_popup.jsp?projectid=<%=rs.getInt("project_id")%>">
					<i class="icon-search"></i>
                    </a>
                    <a class="btn fancybox" title="update the record" 
                    href="UpdateTempProject_popup.jsp?projectid=<%=rs.getInt("project_id")%>">
                    <i class="icon-pencil"></i></a>
                    <a class="btn" title="delete the record" href="javascript:if (confirm('Are you sure?')) window.location.href = 'DeleteTempProject.jsp?projectid=<%=rs.getInt("project_id")%>';">
                    <i class="icon-trash"></i></a>
					</div>
                  </td>
                  <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a title="confirm the project" class="btn fancybox"
                  href="ConfirmProject_popup.jsp?projectid=<%=rs.getInt("project_id")%>"><i class="icon-ok"></i>
                   
                  </a></td>
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
