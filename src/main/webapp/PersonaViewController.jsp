<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="com.empleonline.controller.PersonaController" %>
<%@page import="com.empleonline.model.Persona" %>
        <%
            String tipo = request.getParameter("tipo").toString();
            if(tipo.equals("empresa")){
                
            }else{
                String nombre = request.getParameter("nombre").toString();
                String apellido = request.getParameter("apellido").toString();
                String usuario = request.getParameter("usuario").toString();
                String contrasenna = request.getParameter("contrasenna").toString();
                String ciudad = request.getParameter("ciudad").toString();

                Persona persona = new Persona(null, nombre, apellido, usuario, contrasenna, ciudad);
                PersonaController personaController = new PersonaController();
                if(personaController.create(persona)){
                    response.sendRedirect("/empleoline/login.jsp");
                }
            }
            
             
        %>
