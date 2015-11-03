<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.sql.ResultSet"%>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st=con.createStatement();
 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	   //get current date time with Date()
	   Date date = new Date();
int senderid=Integer.parseInt(request.getParameter("senderid"));
int receiverid=Integer.parseInt(request.getParameter("receiverid"));
String subject=request.getParameter("subject");
String message=request.getParameter("message");
String flag="unread";
String sql="insert into messagedetail (sender_id,subject,message,read_flag,receiver_id) values("+senderid+",'"+subject+"','"+message+"','"+flag+"',"+receiverid+")";
int result=st.executeUpdate(sql);
response.sendRedirect("ViewEmployeeSentMessages.jsp");
%>
<%= dateFormat.format(date) %>