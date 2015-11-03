<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.ResultSet"%>

<html>
  <head>
    <meta name="generator"
    content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
    <title>Add Project</title><%@ include file="webpart/headsection.jsp" %>
    <link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />
	<link href="css/select2.css" rel="stylesheet" />
	
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
		  <%
		  Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
		Statement st=con.createStatement();
		
		String sql="select * from clientdetail ";
		ResultSet rs=st.executeQuery(sql);

		  
		  
		  %>
            <div class="page-header">
			
              <h1>
			  <img height="70px" width="70px" src="img/briefcase2.jpg"></img>
                <small>Fill following detail to ADD the PROJECT</small>
              </h1>
            </div>
            <form id="form1" method="get" class="form-horizontal" action="PendingAproovals.jsp">
              <input type="hidden" name="status" value="pending" />
              <div class="control-group">
                <label class="control-label" for="projname">Project Name</label>
                <div class="controls">
                  <input type="text" class="mandatory" name="projname" id="projname" value="" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="cid">Select Client Name</label>
                <div class="controls">
                  <select class="mandatory" name="cid" id="cid">
				  <option>Select Client Name</option>
				  <%while(rs.next()){%>
				  <option value='<%=rs.getInt("client_id")%>'><%=rs.getString("client_name")%></option>
				  <%}%></select>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="des">Description</label>
                <div class="controls">
                  <textarea rows="5" class="mandatory" cols="28" name="des" id="des"></textarea>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="datepick2">Expected Start Date</label>
                <div class="controls">
                  <input type="text" class="mandatory" name="datepick2" id="datepick2" value="" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="datepick3">Expected End Date</label>
                <div class="controls">
                  <input type="text" class="mandatory" name="datepick3" id="datepick3" value="" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="ecost">Expected Cost</label>
                <div class="controls">
                  <input type="text" class="mandatory" name="ecost" id="ecost" value="" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="pmd">Payment Mode</label>
                <div class="controls">
                  <select class="mandatory" name="pmd" id="pmd">
				  <option>Select Payment Mode</option>
				  <option value="Cash">Cash</option>
				  <option value="Cheque">Cheque</option>
				  <option value="Credit Card">Credit Card</option>
				  <option value="Debit card">Debit Card</option>
				  <option value="Net Banking">Net Banking</option>
				  </select>
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
	<script src="js/jquery-ui.js"></script>
	<script src="js/select2.min.js"></script>
	
	<script>$(document).ready(function() {
		$('#datepick2, #datepick3').datepicker({ dateFormat: 'yy-m-d' });
		$('select').addClass('span4').select2();
	});</script>
  </body>
</html>
