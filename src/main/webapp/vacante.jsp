<%@page import="java.util.List"%>
<%@page import="com.empleonline.model.Vacante"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.empleonline.controller.VacanteController"%>
<%@page import="com.empleonline.model.Persona"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

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

    <body >
        <%
            Persona p = (Persona) session.getAttribute("user");
            if (p != null) {
        %>
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="principal.jsp">EmpleOnline v1.0</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <li >
                        <a href="javascript:void(0);">
                            <%out.write(p.getUsuario().toUpperCase());%>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);">
                            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="javascript:void(0);"><i class="fa fa-user fa-fw"></i> <%out.write(p.getUsuario().toUpperCase());%></a>
                            </li>
                            <li><a href="javascript:void(0);"><i class="fa fa-gear fa-fw"></i> Configurar</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="OutLoginViewController.jsp"><i class="fa fa-sign-out fa-fw"></i> Salir</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Vacantes<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="javascript:void(0);" >Crear</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-lg-12">
                            
                            <%if(session.getAttribute("MSG")!=null){%>
                                <% String msg = new String(session.getAttribute("MSG").toString()); %>
                                <%if(msg.equals("ok")){%>
                                    <div class="alert alert-success fade in alert-dismissable" style="margin-top:18px;">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
                                        <strong>Enhorabuena!</strong> datos guardados correctamente.
                                    </div>
                                <%}%>
                                <%if(msg.equals("error")){%>
                                    <div class="alert alert-danger fade in alert-dismissable" style="margin-top:18px;">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
                                        <strong>Erro!</strong> Ocurrio un error al registar.
                                    </div>
                                <%}%>
                                <%if(msg.equals("warning")){%>
                                    <div class="alert alert-warning fade in alert-dismissable" style="margin-top:18px;">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
                                        <strong>Precaución!</strong> Debes llenar todos los campos, ni introduscaz "," en el precio.
                                    </div>
                                <%}%>
                            <% session.removeAttribute("MSG");} %>
                            <h1 class="page-header">Vacantes <small><a href="/empleoline/principal.jsp" >volver</a></small></h1>
                            <div class="panel panel-default">
                                <div class="panel-heading">Ingrese los datos de la vacante</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form role="form" method="post" action="VacanteViewController.jsp">
                                                <div class="form-group">
                                                    <label>Nombre</label>
                                                    <input type="text" name="nombre" required="" class="form-control"/>                                                        
                                                </div>
                                                <div class="form-group">
                                                    <label>Descripción</label>
                                                    <textarea type="text" name="descripcion" required="" rows="5" class="form-control"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label>Salario</label>
                                                    <input type="number" name="precio"  required="" maxlength="9" max="999999999" class="form-control"/>                                                        
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
                                                <input type="hidden" name="data" value="nuevo"/>
                                                <input type="hidden" name="empresa" value="<%=p.getId()%>"/>
                                                <div class="panel-footer">
                                                    <button class="btn btn-success">Guardar</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>                               
                            </div>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="resources/vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="resources/vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="resources/dist/js/sb-admin-2.js"></script>
        <% String id = request.getParameter("id"); %>
        <script>
            $(document).ready(function (){
                $.post('/empleonline/VacanteViewController.jsp',{
                        data: "modificar",
                        id: <%= id %>
                    },
                    function(responseText) {
                        console.log("response >>> ",responseText);
                    }
                );
            });
        </script>
        <%} else {
                response.sendRedirect("/empleoline/login.jsp");
            }%>
    </body>

</html>
