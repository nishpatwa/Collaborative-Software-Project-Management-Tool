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
ADD THE CLIENT
</title>
<%@ include file="webpart/headsection.jsp" %>
<link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />

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
<div id="wrap">
      <%@ include file="webpart/header.jsp" %>
      <div class="container-fluid">
        <div class="row-fluid" style="padding-top: 25px;">
          <div class="span3">
              <%@ include file="webpart/leftbarmanagermenu.jsp" %>
          </div>
          <div class="span9">
            <div class="page-header">
              <h1><img src="img/client.jpg" height="70px" width="70px"></img>
                <small>Fill following detail to ADD the Client</small>
              </h1>
            </div>
            <form id="form1" method="get" class="form-horizontal" action="AddClientDetails.jsp">

              <div class="control-group">
                <label class="control-label" for="clientname">Client Name</label>
                <div class="controls">
                  <input type="text" name="clientname" class="mandatory" id="clientname" value="" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="compname">Company Name</label>
                <div class="controls">
                  <input type="text" name="compname" id="compname" class="mandatory" value=""/>
				  </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="compadd">Company Address</label>
                <div class="controls">
                  <textarea rows="5" cols="28" name="compadd" class="mandatory" id="compadd"></textarea>
                </div>
              </div>
			  <div class="control-group">
                <label class="control-label" for="des">Description</label>
                <div class="controls">
                  <textarea rows="5" cols="28" class="mandatory" name="des" id="des"></textarea>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="dom">Domain</label>
                <div class="controls">
                  <input type="text" name="dom" class="mandatory" id="dom" value="" />
                </div>
              </div>
			  <div class="control-group">
                <label class="control-label" for="email">Email</label>
                <div class="controls">
                  <input type="text" name="email" class="mandatory" id="email" value="" />
                </div>
              </div>
			  <input type="hidden" name="usertype" value="client">
              
              <div class="control-group">
                <label class="control-label" for="contact">Contact No</label>
                <div class="controls">
                  <input type="text" name="contact" class="mandatory" id="contact" value="" />
                </div>
              </div>
             
              <div class="control-group">
                <label class="control-label" for="contact">Password</label>
                <div class="controls">
                  <input type="text" class="mandatory" name="password" id="password" value="" />&nbsp;&nbsp;<input type="button" class="btn btn-promary"  value="Generate" onclick="randomPassword(12)" />
					
                </div>
              </div>
			 
			 
			 
              <div class="control-group">
                <div class="controls">
                  <input type="submit" class="btn btn-primary" value="SUBMIT" />
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div id="push"></div>
    </div><%@ include file="webpart/footer.jsp" %>
	
</body>

</html>