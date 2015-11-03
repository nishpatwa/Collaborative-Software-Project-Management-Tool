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
	<link rel="stylesheet" href="fancybox/jquery.fancybox.css" />
 
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
                <h1><img src="img/book.jpg" width="70px" height="70px"></img>
                  <small>My Detail</small>
                </h1>
              </div><%
              
              String sql4="select * from employeedetail where employee_id="+empid+"";
              ResultSet rs4=st.executeQuery(sql4);

              %>
              <table class="table table-bordered table-striped">
                <tr >
                  <th>
                    Employee Name
                  </th>
                  <th>
                    Gender
                  </th>
				  <th>
                    Email
                  </th>
				  <th>
                    Employee Type
                  </th>
                  
                  <th>
                    Operation
                  </th>
                  </tr>
                <%
                        while(rs4.next()){
                %>
                <tr >
                  <td>
                      <%=rs4.getString("employee_name")%>
                  </td>
                  <td>
                      <%=rs4.getString("gender")%>
                  </td>
				  <td>
                      <%=rs4.getString("email")%>
                  </td>
                  <td>
                      <%=rs4.getString("employee_type")%>
                  </td>
                  
                  <td>
                    <div class="btn-group">
                    <a class="btn fancybox" title="detail view of record"   
                    href="ViewEmployeeProfile_popup.jsp?employeeid=<%=rs4.getInt("employee_id")%>">
					<i class="icon-search"></i>
                    </a>
                    <a class="btn fancybox" title="update the record" 
                    href="UpdateEmployeeProfile_popup.jsp?employeeid=<%=rs4.getInt("employee_id")%>">
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
