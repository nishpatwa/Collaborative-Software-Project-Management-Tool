<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>

<%
String inputEmail=request.getParameter("inputEmail");
String inputPassword=request.getParameter("inputPassword");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="SELECT name,login_id,email,PASSWORD,user_type FROM login WHERE email='"+inputEmail+"' AND PASSWORD='"+inputPassword+"';";
ResultSet rs=st.executeQuery(sql);
String user="";
				String sname = "";
                                   String login_id = "";
					while(rs.next())
					{
						user=rs.getString("user_type");
                                                sname = rs.getString("name");
                                                login_id = rs.getString("login_id");
					}
Statement stmt=con.createStatement();
                                                                                   String sql_not = "SELECT COUNT(*) as cnt FROM EMPLOYEEMODULE where read_flag=0 and employee_id="+login_id+"; ";
						ResultSet rs26=stmt.executeQuery(sql_not);
						rs26.next();	
                                                session.setAttribute("norts",rs26.getInt("cnt"));                                   
					if(user.equals(""))
					{
						response.sendRedirect("login.jsp");
					}
					if(user.equals("admin"))
					{
						session.setAttribute("adminpassword",inputPassword);
						response.sendRedirect("index.jsp");
					}
					if(user.equals("client"))
					{
						session.setAttribute("clientpassword",inputPassword);
						response.sendRedirect("ClientProfile.jsp");
					}
					if(user.equals("employee") || user.equals("Manager"))
					{
                                           session.setAttribute("Login_ID",login_id);
                                            session.setAttribute("emp_name",sname);
						session.setAttribute("employeepassword",inputPassword);

						response.sendRedirect("EmployeeProfile.jsp");
					}
					
				
			
			
	
		
%>
<%=login_id%>