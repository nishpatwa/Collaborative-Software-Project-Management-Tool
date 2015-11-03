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
ADD THE MODULE
</title>
<%@ include file="webpart/headsection.jsp" %>
<link href="css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" media="screen" />

<script>
function showEmployee(sender)
{
	var p = $(sender).parent(), index = p.parent().get(0).rowIndex, $ddlEmp = p.next().find('select');
	if (sender.selectedIndex === 0) {
		$ddlEmp.html('<option>Select Employee</option>');
	}
	else {
		$.ajax({
			url: "GetEmployee.jsp?q=" + sender.value,
			success: function(data, textStatus, jqXHR) {
				$ddlEmp.html(data).find('#employeename').attr('name', 'employeename' + index);
			}
		});
	}
}

function addRow(sender)
{
	var senderTr = $(sender).closest('tr'), 
		index = senderTr.get(0).rowIndex, 
		cln = senderTr.prev('tr').clone();
	
	cln.find('#employeetype').attr('name', 'employeetype' + index);
	cln.find('#employeeName').attr('name', 'employeename' + index).prop('selectedIndex', 0);
	cln.find('#status').attr('name', 'status' + index);
	
	cln.insertBefore(senderTr);
}
function deleteRow(sender)
{	
	var tbl = $('#tblEmployee');
	if (tbl.find('tr').length > 3 && confirm('Are you sure?')) {
		$(sender).closest('tr').remove();
		// reassign names
		tbl.find('tr').each(function(index) {
			$(this).find('#employeetype').attr('name', 'employeetype' + index);
			$(this).find('#employeeName').attr('name', 'employeeName' + index);
			$(this).find('#status').attr('name', 'status' + index);
		});
	}
}
function validate()
{
	document.getElementById("counter").value=$('#tblEmployee').find('tr').length - 2;
}
</script>

</head>
<body>
<div id="wrap">
      <%@ include file="webpart/header.jsp" %>
      <div class="container-fluid">
        <div class="row-fluid" style="padding-top: 25px;">
          <div class="span3">
            <%	String password=(String)session.getAttribute("employeepassword");
            String login_id = (String)session.getAttribute("Login_ID");
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","");
				Statement st=con.createStatement();
				String sql="select name from login where password='"+password+"'";
				ResultSet rs=st.executeQuery(sql);
				String name="";
				while(rs.next())
				{
					name=rs.getString("name");
				}
				String sql1="select employee_id from employeedetail where employee_name='"+name+"'";
				ResultSet rs1=st.executeQuery(sql1);
				int empid=0;
				while(rs1.next())
				{
					empid=rs1.getInt("employee_id");
				}
				String sql2="select project_manager_id from projectdetail where project_manager_id="+empid+"";
				ResultSet rs2=st.executeQuery(sql2);
				int projectmanagerid=0;
				while(rs2.next())
				{
					projectmanagerid=rs2.getInt("project_manager_id");
				}
				String sql3="select employee_name from employeedetail where employee_id="+projectmanagerid+"";
				ResultSet rs3=st.executeQuery(sql3);
				String empname="";
				while(rs3.next())
				{
					empname=rs3.getString("employee_name");
				}
				if(empname.equals(name))
				{ %>
					<%@ include file="webpart/leftbarmanagermenu.jsp" %>
				<%}
				else{%>
					<%@ include file="webpart/leftbaremployeemenu.jsp" %>
				<%}%>
          </div>
          <div class="span9">
              <%
                                String sql_project="select project_name from projectdetail where project_manager_id='"+login_id+"'";
				ResultSet rs_project=st.executeQuery(sql_project);
                                
                               %>
              
     
            <div class="page-header">
              <h1><img src="img/module.jpg" height="70px" width="70px"></img>
                <small>Fill following detail to ADD the Task</small>
              </h1>
            </div>
            <form id="form1" method="get" class="form-horizontal" onsubmit="validate()" action="AddModuleDetails.jsp">
			<input type="hidden" name="counter" id="counter">				
			
			<div class="control-group">
                <label class="control-label" for="modulename">Project Name</label>
                <div class="controls">
                
                   <select name="modulename" class="mandatory" id="modulename" class="span4">
                  <%  while(rs_project.next())
                                {%>
				  
				  <option value="<%=rs_project.getString("project_name")%>"><%=rs_project.getString("project_name")%></option>
		   <%
                                    
                                }
                                %>	
                   </select>
                </div>
              </div>
                                 
              
           
                        <div class="control-group">
                <label class="control-label" for="modulename">Task Name</label>
                <div class="controls">
                  <input type="text" class="mandatory" name="modulename" id="modulename" value="" />
                </div>
              </div>
<%
String sql4="select project_id,expected_start_date,expected_end_date from projectdetail where project_manager_id="+projectmanagerid+"";
ResultSet rs4=st.executeQuery(sql4);
Date minDate;
Date maxDate;
int minyear=0;
int minmonth=0;
int mindate=0;
int maxyear=0;
int maxmonth=0;
int maxdate=0;
while(rs4.next()){

%>
			<input type="hidden" name="projectid" value='<%=rs4.getInt("project_id")%>'>
			<%
				 minDate=rs4.getDate("expected_start_date");
				 maxDate=rs4.getDate("expected_end_date");
				 minyear=minDate.getYear();
				 minmonth=minDate.getMonth();
				 mindate=minDate.getDate();
				 maxyear=maxDate.getYear();
				 maxmonth=maxDate.getMonth();
				 maxdate=maxDate.getDate();
			}%>
			  <div class="control-group">
                <label class="control-label" for="datepick2">Task Start Date</label>
                <div class="controls">
                  <input type="date" class="mandatory" name="datepick2" id="datepick2" value=""/>
				  </div>
              </div>
			  <div class="control-group">
                <label class="control-label" for="datepick3">Task End Date</label>
                <div class="controls">
                  <input type="date" class="mandatory" name="datepick3" id="datepick3" value=""/>
				  </div>
              </div>
                          <div class="control-group">
                <label class="control-label" for="datepick3">Task Description</label>
                <div class="controls">
                    <textarea name ="TaskDescription"></textarea>
                       
				  </div>
              </div>
              
                          <h4>Add Employee to the Task</h4>			
                  <table id="tblEmployee" class="table table-bordered table-striped" border ="0">
                <tr >
			
                  <th>
                    Employee Type
                  </th>
                  <th>
                    Employee Name
                  </th>
				  <th>
                    Employee Work Status
                  </th>
		     
                  </tr>
				  
				  <tr>

<td><select class="mandatory" name="employeetype1" id="employeetype" onchange="showEmployee(this)"><option>Select Type</option><option value="Analyst">Analyst</option><option value="Designer">Designer</option><option value="Developer">Developer</option><option value="Tester">Tester</option><option value="Manager">Manager</option></td>
<td><select class="mandatory" name="employeename1" id="employeename" ><option>Select Employee</option></select></td>
<td><select class="mandatory" name="status1" id="status">
         <option value ="Not started">Not Started</option>         
        <option value ="In Progress" >In Progress</option>
                             <option value ="Under Review">Under Review</option>
                
                <option value ="Completed">Completed</option>
    </select></td>
</tr>


				 
              </table>  
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
	
	<script>$(document).ready(function() {
		$('#datepick2, #datepick3').datepicker({ dateFormat: 'yy-m-d', minDate: (new Date(<%=minyear%> + 1900, <%=minmonth%> , <%=mindate%>)), maxDate: (new Date(<%=maxyear %> + 1900, <%= maxmonth%> , <%= maxdate%>)) });
	});</script>

</body>

</html>