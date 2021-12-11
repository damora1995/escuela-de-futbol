<%@page import="Modelo.M_Usuario"%>
<%@page import="ControladorL.C_Login"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpSession sesion = request.getSession(true);
    Object numeroDocumento = sesion.getAttribute("numeroDocumento") == null ? null : sesion.getAttribute("numeroDocumento");
    String ro = sesion.getAttribute("foto").toString();
    String rol = sesion.getAttribute("rol").toString();
    String primerNombre = sesion.getAttribute("primerNombre").toString();
    String PrimerApellido = sesion.getAttribute("primerApellido").toString();
    String correo = sesion.getAttribute("correo").toString();
    if (sesion != null) {
        if(numeroDocumento != null){
            if(!rol.equalsIgnoreCase("Administrador")){
                response.sendRedirect("../../vistas/Usuario/login.jsp");
            }
        }else{
            response.sendRedirect("../../vistas/Usuario/login.jsp");
        }
    } else {
        response.sendRedirect("../../vistas/Usuario/login.jsp");
    }
%>
<html lang="es"> 

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Administrador</title>
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/estilosModulos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilosTabla.css">
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="../../alertifyjs/css/alertify.min.css"/>
    </head>
    <style>
        .letra{
            font-family: cursive;
            font-weight: 500;
            font-size: 1.2em;
        }
        .subLetra{
            font-weight: 500;
            font-size: 1.1em;
            font-family: initial
        }
        img{
            transition: all 0.6s linear;
        }
        img:hover{
            transform: scale(1.8);
            border: 0.5px solid #64c47b;
            margin-top: 4px;
        }
        .foto{
            transition: all 0.6s linear!important;
        }
        .foto:hover{
            transform: scale(1.05)!important;
            border: 0px solid #fff;
            /*margin-top: 4px;*/
        }
        body{
            padding: 0%!important;
        }
    </style>
    <body id="page-top">
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1 letra" href="Administrador.jsp"><%= rol %></a>
            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
               
            </button>

            <!-- Navbar Search -->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <div class="input-group-append">
                        <button id="traducirAdministradorIngles" class="btn btn-dark" style="color: #fff;border-radius: 10px" type="button">
                            ING
                        </button>
                        <button id="traducirAdministradorEspañol" class="btn btn-dark" style="color: #fff;border-radius: 10px" type="button">
                            ESP
                        </button>
                    </div>
                </div>
            </form>

            <!-- Navbar -->
            <ul class="navbar-nav ml-auto ml-md-0">                
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-bell fa-fw"></i>

                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="../../<%=ro %>" width="25" height="25" style="border-radius: 40px">
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item subLetra"  href="#"><i class="fas fa-user"></i> <%=  primerNombre + " "+ PrimerApellido%> </a>
                        <a class="dropdown-item subLetra" href="#"><i class="fas fa-id-card"></i> <%=  numeroDocumento%> </a>
                        <a class="dropdown-item subLetra"  href="#"><i class="fas fa-envelope"></i> <%=  correo%> </a>
                        <a id="cerrarSesionAviso" class="dropdown-item subLetra" href="#" data-toggle="modal" data-target="#logoutModal"><i class="fas fa-power-off"></i> Cerrar sesión</a>
                    </div>
                </li>
            </ul>

        </nav>
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">¿Listo para salir?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div id="selecionCerrarSesion" class="modal-body">Seleccione "Cerrar sesión" a continuación si está listo para finalizar su sesión actual.</div>
                    <div class="modal-footer">
                        <button id="CancelarModal" class="btn btn-danger" type="button" data-dismiss="modal">Cancelar</button>
                        <a id="cerrarSesoin" class="btn btn-primary" href="../../Usuarion?accion=Logout">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="wrapper">

            <!-- area de trabajo                     -->
            <div id="content-wrapper">
                <div class="container-fluid">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <p id="bienbenidosQueDesea" style="font-family: initial; text-align: center; font-size: 3.7em; font-weight: 600; line-height: 60px" >BIENVENIDO ¿QUE DESEA HACER?</p>
                                <center><br><br><br>
                                    <div class="form-group " style="margin-top: -60px">
                                        <div class="form-row">
                                            <div class="col-md-6 ">
                                                <h2 id="moduloAdministracion"style="text-align: center; color: #57c257; font-family: cursive; font-weight: 600; font-size: 2.1em" >Módulo Administración</h2>
                                                <a href="Administracion.jsp"><img class="foto"  src="../../img/AdministracionIcono.png" width="60%"></a> 
                                            </div>
                                            <div class="col-md-6 " style="margin-top: -20px">
                                                <h2 id="moduloRendimientoAdm"style="text-align: center; color: #57c257; font-family: cursive; font-weight: 600; font-size: 2.1em">Módulo Rendimiento deportivo</h2>
                                                <a class="foto" href="../Entrenador/EntrenadorA.jsp"><img class="foto" src="../../img/RendimientoDeportivo.png" width="53%"></a>
                                            </div>
                                        </div>
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div> 
                </div> 
            </div> 
        </div>

        <!-- jquery para ir hacia arriba -->

        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript-->
        <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/sb-admin.min.js"></script>
        <script src="../../alertifyjs/js/alertify.min.js"></script>
        <script src="../../js/Traductor/TraducirAdministrador.js"></script>

    </body>

</html>
