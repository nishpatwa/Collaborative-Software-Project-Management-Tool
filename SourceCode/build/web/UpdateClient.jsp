<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%
String clientid=request.getParameter("client_id");
String clientname=request.getParameter("clientname");
String compname=request.getParameter("compname");
String compadd=request.getParameter("compadd");
String des=request.getParameter("des");
String dom=request.getParameter("dom");
String web=request.getParameter("web");
String oldemail=request.getParameter("oldemail");
String contact=request.getParameter("contact");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String sql="update clientdetail set client_name='"+clientname+"', company_name='"+compname+"',company_address='"+compadd+"',description='"+des+"',domain='"+dom+"',email='"+web+"',contact_no='"+contact+"' where client_id="+clientid+"";
int result=st.executeUpdate(sql);
String sql1="update login set name='"+clientname+"' ,email='"+web+"' where email='"+oldemail+"' ";
int result1=st.executeUpdate(sql1);
st.close();
con.close();
response.sendRedirect("ViewClient.jsp");
%>
