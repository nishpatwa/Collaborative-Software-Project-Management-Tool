<%-- 
    Document   : logout
    Created on : Mar 28, 2015, 5:08:07 AM
    Author     : nish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% session.invalidate(); 
response.sendRedirect("login.jsp");        
%>
    </body>
</html>
