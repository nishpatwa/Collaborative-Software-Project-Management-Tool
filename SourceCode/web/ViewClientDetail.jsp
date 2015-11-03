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
            <%@ include file="webpart/leftbarclientmenu.jsp" %>
          </div>
            <div class="span9">
              <div class="page-header">
                <h1>
				<img src="img/book.jpg" height="70px" width="70px"></img>
                  <small>My Detail</small>
                </h1>
              </div><%
			  Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
              Statement st=con.createStatement();
			  String password=(String)session.getAttribute("clientpassword");
			  String sql="select name from login where password='"+password+"'";
			  ResultSet rs=st.executeQuery(sql);
			  String clientname="";
			  while(rs.next())
			  {
					clientname=rs.getString("name");
			  }
			  String sql1="select client_id from clientdetail where client_name='"+clientname+"'";
			  ResultSet rs1=st.executeQuery(sql1);
			  int clientid=0;
			  while(rs1.next())
			  {
					clientid=rs1.getInt("client_id");
			  }
			  String sql2="select * from clientdetail where client_id="+clientid+"";
			  ResultSet rs2=st.executeQuery(sql2);
			  
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
                    Email
                  </th>
				  <th>
                    Contact No
                  </th>
                  
                  <th>
                    Operation
                  </th>
                  </tr>
                <%
                        while(rs2.next()){
                %>
                <tr >
                  <td>
                      <%=rs2.getString("client_name")%>
                  </td>
                  <td>
                      <%=rs2.getString("company_name")%>
                  </td>
				  <td>
                      <%=rs2.getString("email")%>
                  </td>
                  <td>
                      <%=rs2.getString("contact_no")%>
                  </td>
                  
                  <td>
                    <div class="btn-group">
                    <a class="btn fancybox" title="detail view of record"   
                    href="ViewClientDetail_popup.jsp?clientid=<%=rs2.getInt("client_id")%>">
					<i class="icon-search"></i>
                    </a>
                    <a class="btn fancybox" title="update the record" 
                    href="UpdateClientDetail_popup.jsp?clientid=<%=rs2.getInt("client_id")%>">
                    <i class="icon-pencil"></i></a>
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
