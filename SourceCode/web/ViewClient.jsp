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
            <%@ include file="webpart/leftbarmanagermenu.jsp" %>
          </div>
            <div class="span9">
              <div class="page-header">
                <h1>
				<img src="img/client.jpg" height="70px" width="70px"></img>
                  <small>List of Clients</small>
                </h1>
              </div><%
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
              Statement st=con.createStatement();
              String sql="select * from clientdetail";
              ResultSet rs=st.executeQuery(sql);

              %>
              <table class="table table-bordered table-striped">
                <tr >
                  <th>
                    Client Name
                  </th>
                  <th>
                    Company Name
                  </th>
				  <th>
                    Contact
                  </th>
                  <th>
                    Email
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
                      <%=rs.getString("client_name")%>
                  </td>
                  
				  <td>
                      <%=rs.getString("company_name")%>
                  </td>
                  <td>
                      <%=rs.getString("contact_no")%>
                  </td>
                  <td>
                      <%=rs.getString("email")%>
                  </td>
                  
                  <td>
                    <div class="btn-group">
                    <a class="btn fancybox" title="detail view of record"   
                    href="ViewClient_popup.jsp?clientid=<%=rs.getInt("client_id")%>">
					<i class="icon-search"></i>
                    </a>
                    <a class="btn fancybox" title="update the record" 
                    href="UpdateClient_popup.jsp?clientid=<%=rs.getInt("client_id")%>">
                    <i class="icon-pencil"></i></a>
                    <a class="btn" title="delete the record" href="javascript:if (confirm('Are you sure?')) window.location.href = 'DeleteClient.jsp?clientid=<%=rs.getInt("client_id")%>';">
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
