<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="com.empleonline.controller.PersonaController" %>
<%@page import="com.empleonline.model.Persona" %>
        <%
            String nombre = request.getParameter("txtnombre").toString();
            String apellido = request.getParameter("txtapellido").toString();
            String usuario = request.getParameter("txtusuario").toString();
            String contrasenna = request.getParameter("txtcontrasenna").toString();
            
            Persona persona = new Persona(nombre, apellido, usuario, contrasenna);
            PersonaController personaController = new PersonaController();
            boolean resultado = personaController.create(persona);
             
        %>
