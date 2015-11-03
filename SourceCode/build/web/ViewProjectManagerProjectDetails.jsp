<%@page import="java.sql.Connection"%><%@page import="java.sql.DriverManager"%><%@page import="java.sql.Statement"%><%@page import="java.sql.SQLException"%><%@page import="java.util.*"%><%@page import="java.text.*"%><%@page import="javax.servlet.ServletException"%><%@page import="java.sql.ResultSet"%>
<html>
  <head>
    <title>PMS</title><%@ include file="webpart/headsection.jsp" %>
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
                <h1>
				<img height="70px" width="70px" src="img/briefcase2.jpg"></img>
                  <small> Project Detail</small>
                </h1>
				
              </div><%
			  String sql4="select * from projectdetail where project_manager_id="+projectmanagerid+"";
			  ResultSet rs4=st.executeQuery(sql4);
              %>
			 
              <table class="table table-bordered table-striped">
                <tr >
                  <th>
                    Project Name
                  </th>
                  <th>
                    Description
                  </th>
				  <th>
                   Project Start Date
                  </th>
				  <th>
                    Project End Date
                  </th>
				
                  <th>
                    Project Status
                  </th>
                  
                  </tr>
                <%int projectid=0;
                int p_array[] = new int[100];
                int i = 0;
                        while(rs4.next()){
                 projectid=rs4.getInt("project_id");
                p_array[i] = projectid;
                i++;%>
                 <tr >
                  <td>
                      <%=rs4.getString("project_name")%>
                  </td>
                  <td>
                      <%=rs4.getString("description")%>
                  </td>
                  
                  <td>
                      <%=rs4.getString("expected_start_date")%>
                  </td>
                  <td>
                      <%=rs4.getString("expected_end_date")%>
                  </td>
				
                  <td>
                      <%=rs4.getString("project_status")%>
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
