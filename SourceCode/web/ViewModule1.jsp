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
                <h1><img src="img/module.jpg" height="70px" width="70px"></img>
                  <small>List of Tasks</small>
                </h1>
                  
              </div><%
              String sql4="select project_id from projectdetail where project_manager_id='"+projectmanagerid+"';";
			ResultSet rs4=st.executeQuery(sql4);
			int projectid=0;
                        int p_array[] = new int[100];
			int i = 0,count = 0;
                        while(rs4.next())
			{
                            projectid=rs4.getInt("project_id");
                                p_array[i] = projectid;
                                i++;
                  
				
			}%>
                     
                        <table class="table table-bordered table-striped">
	    <tr >
                <th>
                    Task Name
                  </th>

                  <th>
                    Project Name
                  </th>
                  <th>
                    Employee Name
                  </th>				  
				  <th>
                   Task Start Date
                  </th>
				  <th>
                   Task End Date
                  </th>
                  <th>
                    Task Status
                  </th>
                  
                  <th>
                    Operation
                  </th>
                  </tr>
                            <% while(count<i){String sql5="SELECT moduledetail . *,projectdetail.project_name,projectdetail.project_manager_id "
                                    + "FROM `moduledetail` "
                                    + "INNER JOIN  `projectdetail` ON moduledetail.project_id = projectdetail.project_id "
                                    + "where moduledetail.project_id="+p_array[count]+"; ";
              ResultSet rs5=st.executeQuery(sql5);
count++;
              %>
              
            
                <%
                        while(rs5.next()){
                %>
                <tr >
                  <td>
                      <%=rs5.getString("module_name")%>
                  </td>
                  <td>
                      <%=rs5.getString("project_name")%>
                  </td>
		    <td>
                        <%
                        String project_id = rs5.getString("moduledetail.project_id");
                        String module_number = rs5.getString("moduledetail.module_number");%>
                        
                        
                        <%
                        String sql_empid = "SELECT EMPLOYEE_NAME FROM EMPLOYEEDETAIL WHERE EMPLOYEE_ID = (SELECT EMPLOYEE_ID FROM EMPLOYEEMODULE WHERE MODULE_NUMBER = '"+module_number+"' AND PROJECT_ID = '"+project_id+"');";
                        Statement stmt_emp=con.createStatement();
                        ResultSet rs_emp=stmt_emp.executeQuery(sql_empid);
                        String s = "";
                        String STATUS = "";
                        while(rs_emp.next())
                        {
                            s = rs_emp.getString("EMPLOYEE_NAME");
                            
                        }
                        String sql_emp_status = "SELECT employee_work_status FROM EMPLOYEEMODULE WHERE MODULE_NUMBER = '"+module_number+"' AND PROJECT_ID = '"+project_id+"';";
                        Statement stmt_emp_status=con.createStatement();
                        ResultSet rs_emp_status=stmt_emp_status.executeQuery(sql_emp_status);
                                  while(rs_emp_status.next())
                        {
                            STATUS = rs_emp_status.getString("employee_work_status");
                            
                        }
                        %>
                      <%=s%>
                  </td>		  
                  <td>
                      <%=rs5.getString("module_start_date")%>
                  </td>
				   <td>
                      <%=rs5.getString("module_end_date")%>
                  </td>
                  <td>
                      <%=STATUS%>
                  </td>
                  <td>
                    <div class="btn-group">
                    <a class="btn fancybox" title="detail view of record"   
                    href="ViewModule_popup.jsp?moduleid=<%=rs5.getString("module_number")%>">
					<i class="icon-search"></i>
                    </a>
                    <a class="btn fancybox" title="update the record" 
                    href="UpdateModule_popup.jsp?moduleid=<%=rs5.getString("module_number")%>">
                    <i class="icon-pencil"></i></a>
                    <a class="btn" title="delete the record" href="javascript:if (confirm('Are you sure?')) window.location.href ='DeleteModule.jsp?moduleid=<%=rs5.getString("module_number")%>';">
                    <i class="icon-trash"></i></a>
					</div>
                  </td>
                  
                </tr><%}}%>
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
