<%-- 
    Document   : LoginViewControl
    Created on : 30-may-2017, 12:49:14
    Author     : MrMonterrosa
--%>

<%@page import="com.empleonline.model.Persona"%>
<%@page import="com.empleonline.controller.PersonaController"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    <meta charset="ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%                
            String usuario = request.getParameter("txtusario");
            String contrasenna = request.getParameter("txtcontrasenna");
            PersonaController controller = new PersonaController();
            Persona p = controller.finds(usuario, contrasenna);
            if(p!=null){
                session.setAttribute("user", p);
                response.sendRedirect("/empleoline/principal.jsp");
            }else{
                response.sendRedirect("/empleoline/login.jsp");
            }  
        %>
    </body>
</html>
