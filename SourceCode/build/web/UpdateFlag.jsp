<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.ResultSet"%>
<%
int messageid=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
String flag="read";
String sql="update messagedetail set read_flag='"+flag+"' where message_id="+messageid+"";
int result=st.executeUpdate(sql);			  
%>