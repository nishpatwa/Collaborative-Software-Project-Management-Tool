<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.ResultSet"%>

<html>
  <head>
    <title>PMS</title>
	<%@ include file="webpart/headsection.jsp" %>
  </head>
  <body>
  <div id="wrap">
	<header class="jumbotron subhead" id="overview">
	<div class="container-fluid">
		<h1>Welcome</h1>
		<p class="lead">to Project Management System.</p>
	</div>
	</header>
	<div class="container-fluid">
		<div class="row-fluid" style="padding-top: 3%;">
			<div class="span6 offset3">
				<div class="page-header">
					<%
						String email=request.getParameter("Email");
						String code=request.getParameter("code");
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
						Statement st=con.createStatement();
						String sql="select password from login where email='"+email+"'";
						ResultSet rs=st.executeQuery(sql);
						String password="";
						while(rs.next())
						{
							password=rs.getString("password");
					    }
						
						session.setAttribute("alert","Password Sent to your registered Account");
						session.setMaxInactiveInterval(20);
						response.sendRedirect("login.jsp");
					%>				
					
				</div>
			</div>
		</div>
	  </div>
	  <div id="push"></div>
	</div>
	<%@ include file="webpart/footer.jsp" %>
</body>
</html>
