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
</head>
<body>
<%
    String password=(String)session.getAttribute("employeepassword");
    
String projectname=request.getParameter("projname");
String cid=request.getParameter("cid");
String des=request.getParameter("des");
String esd=request.getParameter("datepick2");
String eed=request.getParameter("datepick3");
String ecost=request.getParameter("ecost");
String pmode=request.getParameter("pmd");
String status=request.getParameter("status");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sqllogin="select name,user_type from login where password='"+password+"'";
				ResultSet rs=st.executeQuery(sqllogin);
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
                                
String sql="insert into projectdetail(project_manager_id,project_name,client_id,description,expected_start_date,expected_end_date,expected_cost,payment_mode,project_status) values('"+empid+"','"+projectname+"',"+cid+",'"+des+"','"+esd+"','"+eed+"','"+ecost+"','"+pmode+"','Not Started');";
int result=st.executeUpdate(sql);
st.close();
con.close();
response.sendRedirect("ViewProjectManagerProjectDetails.jsp");
%>
</body>
</html>