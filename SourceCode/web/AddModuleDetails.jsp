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
<title>
ADDING THE MODULE
</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();

String modulename=request.getParameter("modulename");
String projectid=request.getParameter("projectid");
String startdate=request.getParameter("datepick2");
String enddate=request.getParameter("datepick3");
String modulestatus=request.getParameter("modulestatus");
int cnt=Integer.parseInt(request.getParameter("counter"));
String employeename="";
int employeeid=0;

String status="";
String sql="";

String sql1="";
int result1=0;
ResultSet rs;
Random generator=new Random();
double modulenum=generator.nextDouble();
%>
    
    <%
for(int i=1;i<=1;i++)
{
	employeename=request.getParameter("employeename1");
%>
    
    


    <%
        sql="select employee_id from employeedetail where employee_name='"+employeename+"'";
	rs=st.executeQuery(sql);
	while(rs.next())
	{
            %>
<%=rs.getInt("employee_id")%>
    
    <%
		employeeid=rs.getInt("employee_id");
	}
	status=request.getParameter("status1");
	sql1="insert into employeemodule (module_number,employee_id,project_id,employee_work_status) value('"+modulenum+"',"+employeeid+",'"+projectid+"','"+status+"')";
        result1=st.executeUpdate(sql1);
	
}

String sql2="insert into moduledetail(module_number,module_name,project_id,module_start_date,module_end_date,module_status,employee_id) values('"+modulenum+"','"+modulename+"','"+projectid+"','"+startdate+"','"+enddate+"','"+modulestatus+"','"+employeeid+"');";
int result2=st.executeUpdate(sql2);

response.sendRedirect("ViewModule1.jsp");
 
%>
<%=status%>
</body>
</html>