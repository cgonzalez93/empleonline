<%-- 
    Document   : PersonaController
    Created on : 29-may-2017, 22:44:59
    Author     : MrMonterrosa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.empleonline.controller.PersonaController" %>
<%@page import="com.empleonline.model.Persona" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nombre = request.getParameter("txtnombre").toString();
            String apellido = request.getParameter("txtapellido").toString();
            String usuario = request.getParameter("txtusuario").toString();
            String contrasenna = request.getParameter("txtcontrasenna").toString();
            
            Persona persona = new Persona(nombre, apellido, usuario, contrasenna);
            PersonaController personaController = new PersonaController();
            boolean resultado = personaController.create(persona);
            
        %>
    </body>
</html>
