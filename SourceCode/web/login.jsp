<html>
  <head>
    <title>Login Page</title>
	<%@ include file="webpart/headsection.jsp" %>
  </head>
  <body>
  <div id="wrap">
	<header class="jumbotron subhead" id="overview">
	<div class="container-fluid">
		<h1>COLLABORATIVE</h1>
		<p class="lead">THE PROJECT MANAGEMENT TOOL</p>
	</div>
	</header>
	<div class="container-fluid">
		<div class="row-fluid" style="padding-top: 3%;">
			<div class="span6 offset3">
				<div class="page-header">
					<%
						String alert="";
						if(session.getAttribute("alert")!=null)
						{
							alert=(String)session.getAttribute("alert");
						}
						
					%>
						
					<h3><%=alert%></h3><h1><small>Sign In</small></h1>
				</div>
				<form class="form-horizontal well" method="get" action="LoginDetail.jsp">
					<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-envelope"></i></span>
                                                        <input type="email" id="inputEmail" name="inputEmail" placeholder="Email" required autocomplete="off">
						</div>
					</div>
				  </div>
				  <div class="control-group">
					<label class="control-label" for="inputPassword">Password</label>
					<div class="controls">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span>
                                                        <input type="password" id="inputPassword" name="inputPassword" placeholder="Password" required autocomplete="off">
						</div>
					</div>
				  </div>
				 <div class="control-group">
				 <label class="control-label">
				 </label>
				 <div class="controls">
				 <a href="ForgotPassword1.jsp" style="text-decoration:none" >Forgot Your Password?</a>
				 </div>
				</div>	
				  
				  <div class="control-group">
					<div class="controls">
					  <button type="submit" class="btn">Log in</button>
					</div>
				  </div>
				</form>
			</div>
		</div>
	  </div>
	  <div id="push"></div>
	</div>
	<%@ include file="webpart/footer.jsp" %>
</body>
</html>
