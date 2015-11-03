<html>
  <head>
    <title>PMS</title>
	<%@ include file="webpart/headsection.jsp" %>
  </head>
  <body>
  <div id="wrap">
	<header class="jumbotron subhead" id="overview">
	<div class="container-fluid">
	<h1>COLLABORATE</h1>
		<p class="lead">THE PROJECT MANAGEMENT TOOL</p>
	</div>
	</header>
	<div class="container-fluid">
		<div class="row-fluid" style="padding-top: 3%;">
			<div class="span6 offset3">
				<div class="page-header">
									
					<h1><small>Forgot Password</small></h1>
				</div>
				<form class="form-horizontal well" method="get" action="ForgotPassword1Details.jsp">
					<div class="control-group">
					<label class="control-label" for="Email"> Enter Your Email Id</label>
					<div class="controls">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-envelope"></i></span>
                                                        <input type="email" id="Email" name="Email" placeholder="Registered Email Address" required autocomplete="off">
						</div>
					</div>
				  </div>
				  	
					
				  
				  <div class="control-group">
					<div class="controls">
					  <button type="submit" class="btn">submit</button>
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
