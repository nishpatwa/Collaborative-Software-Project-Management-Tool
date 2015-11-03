<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%


String cname=request.getParameter("clientname");
String compname=request.getParameter("compname");
String compadd=request.getParameter("compadd");
String des=request.getParameter("des");
String dom=request.getParameter("dom");
String email=request.getParameter("email");
String contact=request.getParameter("contact");
String user=request.getParameter("usertype");

String password=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="insert into clientdetail(client_name,company_name,company_address,description,domain,email,contact_no) values('"+cname+"','"+compname+"','"+compadd+"','"+des+"','"+dom+"','"+email+"','"+contact+"');";
int result=st.executeUpdate(sql);
String sql1="insert into login(email,password,name,user_type) values('"+email+"','"+password+"','"+cname+"','"+user+"');";
int result1=st.executeUpdate(sql1);

st.close();
con.close();
response.sendRedirect("ViewClient.jsp");
%>
