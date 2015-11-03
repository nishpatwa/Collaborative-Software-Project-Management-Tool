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
<%@ include file="webpart/headsection.jsp" %>
    
<link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />
  <script src="js/jquery.js"> </script>
<script>

function randomPassword(length)
{
  chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
  pass = "";
  for(x=0;x<length;x++)
  {
    i = Math.floor(Math.random() * 62);
    pass += chars.charAt(i);
  }
  document.getElementById("password").value=pass;
}

</script>
  
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
Statement st1=con1.createStatement();
String clientid=request.getParameter("clientid");
String sql1="select * from clientdetail where client_id="+clientid+"";
ResultSet rs1=st1.executeQuery(sql1);
%>
	<div class="page-header">
    <h1>
      <small>Update the Client-Info Here</small>
    </h1>
  </div>
  
	<br/>
	<form id="form1" class="form-horizontal" method="get" action="UpdateClient.jsp" onsubmit="validate()">
	<% while(rs1.next()){%>
	<input type="hidden" name="client_id" value='<%=rs1.getInt("client_id")%>'>
	<div class="control-group">
                <label class="control-label" for="clientname">Client Name</label>
                <div class="controls">
                  <input type="text" name="clientname" id="clientname" value='<%=rs1.getString("client_name")%>'>
				  </div>
              </div>
	
	<div class="control-group">
                <label class="control-label" for="compname">Company Name</label>
                <div class="controls">
                  <input type="text" name="compname" id="compname" value='<%=rs1.getString("company_name")%>'>
				  </div>
              </div>
	
	<div class="control-group">
      <label class="control-label" for="compadd">Company Address</label>
      <div class="controls">
        <textarea name="compadd" id="compadd" rows="5" cols="20"><%=rs1.getString("company_address")%></textarea>
      </div>
    </div>
	<div class="control-group">
      <label class="control-label" for="des">Description</label>
      <div class="controls">
        <textarea name="des" id="des" rows="5" cols="20"><%=rs1.getString("description")%></textarea>
      </div>
    </div>
	<div class="control-group">
      <label class="control-label" for="dom">Domain</label>
      <div class="controls">
        <input type="text" name="dom" id="dom" value=<%=rs1.getString("domain")%> />
      </div>
    </div>
	<input type="hidden" name="oldemail" value='<%=rs1.getString("email")%>'>
	<div class="control-group">
      <label class="control-label" for="web">Email</label>
      <div class="controls">
        <input type="text" name="web" id="web" value=<%=rs1.getString("email")%> />
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="contact">Contact No</label>
      <div class="controls">
        <input type="text" name="contact" id="contact" value='<%=rs1.getString("contact_no")%>' />
      </div>
    </div>
	
    <%}%>
		<div class="control-group">
                <div class="controls">
                  <input type="submit" class="btn btn-primary" value="SUBMIT" />
                </div>
              </div>
	</form>
<script>
	function validate()
{
    parent.jQuery.fancybox.close();
}

</script>
</body>	
</html>