<%@page import="com.empleonline.model.Persona"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
        <meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Bootstrap Admin Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <%
            Persona p = (Persona) session.getAttribute("user");
            if (p != null) {
                //response.sendRedirect("/empleoline/principal.jsp");
            }
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">REGISTRO</h3>
                        </div>
                        <div class="panel-body">
                            <fieldset id="btnum">
                                <div class="form-group">
                                    <button type="button" id="us" class="btn btn-lg btn-warning btn-block">COMO USUARIO</button>
                                    <button type="button" id="em" class="btn btn-lg btn-primary btn-block">COMO EMPRESA</button>
                                </div>
                            </fieldset>
                            <form role="form" action="PersonaViewController.jsp" id="formus" method="post" style="display: none;">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" title="Nombre requerido" placeholder="Nombre" name="nombre"  id="nombre" required type="text" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Apellido" name="apellido" id="apellido" required type="text" value="">
                                    </div>
                                    <div class="form-group">
                                        <label>Ciudad</label>
                                        <select name="ciudad" required="" class="form-control">
                                            <option value="">Selecione una ciudad</option>
                                            <option value="antioqua">Antioquia</option>
                                            <option value="bogota">Bogota</option>
                                            <option value="bolivar">Bolivar</option>
                                            <option value="cali">Cali</option>
                                            <option value="cordoba">Cordoba</option> 
                                        </select>                                                  
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Usuario" name="usuario" required id="usuario" required type="text" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Contraseña" name="contrasenna" id="contrasenna" required  required type="password" value="">
                                    </div>
                                    <input type="hidden" value="" id="tipo" name="tipo"/>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <button type="submit" class="btn btn-lg btn-success btn-block">REGISTRAR</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="resources/vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="resources/vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="resources/dist/js/sb-admin-2.js"></script>
        <script>
            $("#us").click(function (){
                $("#formus").css("display","block");
                $("#us").css("display","none");
                $("#em").css("display","none");
                $("#tipo").val("usuario");
            });
            $("#em").click(function (){
                $("#formus").css("display","block");
                $("#us").css("display","none");
                $("#em").css("display","none");
                $("#apellido").attr("placeholder", "Descripción");
                $("#tipo").val("empresa");
            });
        </script>
    </body>

</html>
