<html>
  <head>
    <meta name="generator"
    content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
    <title>Add Employee</title><%@ include file="webpart/headsection.jsp" %>
      <link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />
	  <link href="css/select2.css" rel="stylesheet" />
    
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
            <%@ include file="webpart/leftbarmenu.jsp" %>
          </div>
          <div class="span9">
            <div class="page-header">
              <h1>
			  <img height="70px" width="70px" src="img/employee.jpg"></img>
                
                <small>Fill following detail to ADD the Employee</small>
              </h1>
            </div>
            <form id="form1" method="get" class="form-horizontal" action="AddEmployeeDetails.jsp">
              
              <div class="control-group">
                <label class="control-label" for="empname">Employee Name</label>
                <div class="controls">
                  <input type="text" class="mandatory" name="empname" id="empname" value="" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="gender">Gender</label>
                <div class="controls">
                  <input type="radio" name="gender" id="gender" value="Male"/>&nbsp;Male&nbsp;&nbsp; <input type="radio" name="gender" id="gender" value="Female"/>&nbsp;Female
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="address">Address</label>
                <div class="controls">
                  <textarea rows="5" cols="28" class="mandatory" name="address" id="address"></textarea>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="email">Email</label>
                <div class="controls">
                  <input type="text" name="email" id="email" class="mandatory" value="" />
                </div>
              </div>
			  <input type="hidden" name="usertype" value="employee">
              <div class="control-group">
                <label class="control-label" for="phname">Contact No</label>
                <div class="controls">
                  <input type="text" name="phname" class="mandatory" id="phname" value="" />
                </div>
              </div>
              
              <div class="control-group">
                <label class="control-label" for="etype">Employee Type</label>
                <div class="controls">
                  <select class="mandatory" name="etype" id="etype">
				  <option>Select Employee Type</option>
				  <option value="Analyst">Analyst</option>
				  <option value="Designer">Designer</option>
				  <option value="Developer">Developer</option>
				  <option value="Tester">Tester</option>
                                  <option value="Manager">Manager</option>
				  </select>
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
	<script src="js/select2.min.js"></script>
	<script>
$(document).ready(function() {
	$('select').addClass('span4').select2();
});

</script>
  </body>
</html>
