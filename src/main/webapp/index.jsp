<%-- 
    Document   : index
    Created on : 29-may-2017, 22:08:52
    Author     : MrMonterrosa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="form" action="PersonaViewController.jsp" method="POST">
            <label>Nombre: </label><input type="text" name="txtnombre" value="" required /><br/>
            <label>Apellido: </label><input type="text" name="txtapellido" value="" required/><br/>
            <label>Usuario: </label><input type="text" name="txtusuario" value="" required/><br/>
            <label>Contraseña: </label><input type="password" name="txtcontrasenna" value="" required/><br/>
            <input type="submit" value="Enviar" name="btnEnviar" />
        </form>
    </body>
</html>
