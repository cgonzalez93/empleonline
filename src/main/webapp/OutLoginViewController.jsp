<%-- 
    Document   : OutLoginViewController
    Created on : 30-may-2017, 14:52:32
    Author     : MrMonterrosa
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("/empleoline/login.jsp");
        %>
    </body>
</html>
