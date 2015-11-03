<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="checkSession.jsp" %>
<html>
  <head>
    <title>Employee Profile</title>
	
	
	<%@ include file="webpart/headsection.jsp" %>
  </head>
  <body>
  
  <div id="wrap">
	<%@ include file="webpart/header.jsp" %>
	  <div class="container-fluid">
		<div class="row-fluid" style="padding-top: 25px;">
		  <div class="span3">
                      
		  <%
                  session.setAttribute("norts",0);
                  String password=(String)session.getAttribute("employeepassword");
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
				Statement st=con.createStatement();
				String sql="select name,user_type from login where password='"+password+"'";
				ResultSet rs=st.executeQuery(sql);
				String name="";
                                
                                String role = "";
				while(rs.next())
				{
					name=rs.getString("name");
                                        role = rs.getString("user_type");
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
			if(role.equals("Manager"))
				{ %>

<%@ include file="webpart/leftbarmanagermenu.jsp" %>

                                
				
			<%}
				else{%>	
				
				<jsp:include page="webpart/leftbaremployeemenu.jsp" >
    <jsp:param name="flag_read" value="0" />
</jsp:include>	
				<%}%>
		  
		  </div>
		  <div class="span9">
			<div class="page-header">
                <h1><img src="img/Home.jpg" height="70px" width="70px"></img>
                  <small>My WorkSheet</small>
                </h1>
                           
              </div><%
              String sql5="SELECT employeemodule . *,moduledetail.*,projectdetail.project_name ,employeedetail.employee_name FROM `employeemodule` INNER JOIN  `moduledetail` ON employeemodule.module_number = moduledetail.module_number  INNER JOIN projectdetail ON moduledetail.project_id=projectdetail.project_id INNER JOIN employeedetail ON projectdetail.project_manager_id=employeedetail.employee_id where employeemodule.employee_id="+empid+" order by read_flag;";
              ResultSet rs5=st.executeQuery(sql5);
			  
			  %>
            <table class="table table-bordered table-striped">
                <tr >
                  <th>
                    Project Name
                  </th>
				  <th>
                    Project Manager Name
                  </th>
					<th>
                    Task Name
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
					Update
				  </th>
                  
                  </tr>
                <%
                        while(rs5.next()){
                int flag = 0;
            if(rs5.getInt("read_flag")==0)
                               {
                flag =1;
            }
            %>
                
                      <form action="Update_Project.jsp" method="get">
                          <input type="hidden" name="projectid" value="<%=rs5.getString("moduledetail.project_id")%>"/>
                          <input type="hidden" name="moduleid" value="<%=rs5.getString("moduledetail.module_number")%>"/>
               <%if(flag==0)
               {%>
                          <tr >
				<td>
                      <%=rs5.getString("project_name")%>
                  </td>
				  <td>
                      <%=rs5.getString("employee_name")%>
                  </td>
                  <td>
                      <%=rs5.getString("module_name")%>
                  </td>
                  
                  <td>
                      <%=rs5.getString("module_start_date")%>
                  </td>
				   <td>
                      <%=rs5.getString("module_end_date")%>
                  </td>
                  <td>
                    <%if(rs5.getString("employee_work_status").equals("In Progress")){%>
                    
 <select name="status">
                <option value ="In Progress" >In Progress</option>
                <option value ="Not started">Not Started</option>                
                <option value ="Under Review">Under Review</option>
                <option value ="Completed">Completed</option>
                       </select>
                <%} %>
         
                    <%if(rs5.getString("employee_work_status").equals("Under Review")){%>
 <select name="status">
                <option value ="Under Review">Under Review</option>
                <option value ="In Progress" >In Progress</option>
                <option value ="Not started">Not Started</option>                
                
                <option value ="Completed">Completed</option>
                </select>
                <%} %>
                
                    <%if(rs5.getString("employee_work_status").equals("Completed")){%>
 <select name="status">
                <option value ="Completed">Completed</option>
                    <option value ="In Progress" >In Progress</option>
                <option value ="Not started">Not Started</option>                
                <option value ="Under Review">Under Review</option>
                </select>
                <%} %>
                
                    <%if(rs5.getString("employee_work_status").equals("Not started")){%>
                    <select name="status">
                <option value ="Not started">Not Started</option>                
 <option value ="In Progress" Default>In Progress</option>
                <option value ="Under Review">Under Review</option>
                <option value ="Completed">Completed</option>
                </select>
                <%} %>
                
                
                    
                  </td>
                     
				<td>
                                    <input class="btn" type="submit" value="Save" name ="save"/>
                  </td>
                  </form>
                </tr>
                <%}%>
                
               <%if(flag==1)
               {%>
                          <tr ><b>
				<td>
                                    <b><%=rs5.getString("project_name")%></b>
                  </td>
				  <td>
                      <b><%=rs5.getString("employee_name")%></b>
                  </td>
                  <td>
                      <b><%=rs5.getString("module_name")%></b>
                  </td>
                  
                  <td>
                      <b><%=rs5.getString("module_start_date")%></b>
                  </td>
				   <td>
                      <b><%=rs5.getString("module_end_date")%></b>
                  </td>
                  <td>
                    <%if(rs5.getString("employee_work_status").equals("In Progress")){%>
                    
 <select name="status">
                <option value ="In Progress" >In Progress</option>
                <option value ="Not started">Not Started</option>                
                <option value ="Under Review">Under Review</option>
                <option value ="Completed">Completed</option>
                       </select>
                <%} %>
         
                    <%if(rs5.getString("employee_work_status").equals("Under Review")){%>
 <select name="status">
                <option value ="Under Review">Under Review</option>
                <option value ="In Progress" >In Progress</option>
                <option value ="Not started">Not Started</option>                
                
                <option value ="Completed">Completed</option>
                </select>
                <%} %>
                
                    <%if(rs5.getString("employee_work_status").equals("Completed")){%>
 <select name="status">
                <option value ="Completed">Completed</option>
                    <option value ="In Progress" >In Progress</option>
                <option value ="Not started">Not Started</option>                
                <option value ="Under Review">Under Review</option>
                </select>
                <%} %>
                
                    <%if(rs5.getString("employee_work_status").equals("Not started")){%>
                    <select name="status">
                <option value ="Not started">Not Started</option>                
 <option value ="In Progress" Default>In Progress</option>
                <option value ="Under Review">Under Review</option>
                <option value ="Completed">Completed</option>
                </select>
                <%} %>
                
                
                    
                  </td>
                     
				<td>
                                    <input class="btn" type="submit" value="Save" name ="save"/>
                  </td>
                  </form>
                </tr></b>
                <%}%>                
                
                <%}%>
              </table>  
              <%
              Statement st_read_flag=con.createStatement();
              String sql_not_flag="UPDATE EMPLOYEEMODULE SET READ_FLAG = '1' WHERE EMPLOYEE_ID = '"+empid+"'";
int result1=st_read_flag.executeUpdate(sql_not_flag);
%>
		  </div>
		</div>
	  </div>
	  <div id="push"></div>
	</div>
	<%@ include file="webpart/footer.jsp" %>
</body>
</html>
