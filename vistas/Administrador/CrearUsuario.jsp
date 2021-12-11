<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page session="true" %>
<%@page import="Modelo.M_Usuario"%>
<%@page import="ControladorL.C_Login"%>
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
        <title>Administrador/CrearUsuario</title> 
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/select.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/estilosModulos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilosTabla.css">
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet"> 
        <link rel="stylesheet" href="<%=request.getContextPath()%>/hola/css/form.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dataTable/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/main.css"/>
        <link rel="stylesheet" href="../../animate.css"/>
        <link rel="stylesheet" href="../../alertifyjs/css/alertify.min.css"/>
        <link rel="stylesheet" href="../../sweetAlert2/sweetalert2.min.css"/>
    </head>
    <style>
        .letra{
            font-family: cursive;
            font-weight: 600;
            font-size: 1.2em;
        }
        .letraPr{
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
        body{
            padding: 0%!important;
        }
    </style>
    <body id="page-top">

        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1 letra" href="Administrador.jsp"><%= rol %></a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
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

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">      
                <li class="nav-item active">
                    <a class="nav-link letra" href="CrearUsuario.jsp">
                        <i class="fas fa-user-check"></i>
                        <span id="crearUsuario">Crear usuario</span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link letra" href="CrearPerfil.jsp">
                        <i class="fas fa-user"></i>
                        <span id="crearPerfilJugador">Crear perfil jugador</span>
                    </a>
                </li> 
                <li class="nav-item active">
                    <a class="nav-link letra" href="Inventario.jsp">
                        <i class="fas fa-futbol"></i>
                        <span id="registrarInventario">Registrar inventario</span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link letra" href="GestionarPQRS.jsp">
                        <i class="fas fa-mail-bulk"></i>
                        <span id="gestionpqrs">Gestionar PQRS</span>
                    </a>
                </li>
            </ul>

            <!-- area de trabajo                     -->
            <div id="content-wrapper">
                <br>
                <div class="container-fluid">  
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="my-descripcion"></div>
                        </div>             
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12" >
                            <div class="my-form-top">
                                <div class="myform-top-left">
                                    <br> 
                                    <h3 id="CrearUsuarioUsuario" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Crear usuario.</h3>
                                </div>
                                <div class="Myform-top-right">
                                    <i class="fas fa-user-check" ></i>
                                </div>
                            </div>
                            <div class="my-form-botton">
                                <div class="ancho">
                                    <div class="table-responsive">
                                        <table id="example" class="table col-md-12 table-condensed table-hover table-striped table-bordered text-center" style="width: 100%">
                                            <br>
                                            <button id="agregarNuevoUsuario" class="btn btn-primary letra" data-toggle="modal" data-target="#modalNuevo" >  Agregar nuevo   <i  class='fas fa-plus-circle'></i></button> 
                                            <a id="generarReporteUser"  class="btn btn-primary letra" href="../../PDF?accion=reporteUsuario" style="margin: 0px 10px ">  Generar reporte   <i class="fas fa-chart-bar"> </i></a> 
                                            <br><br><br>
                                            <thead class="letra">
                                                <tr>
                                                    <th id="numeroDocumentoTr">Número documento</th>
                                                    <th id="tipoDocumentoTr">Tipo documento</th>
                                                    <th id="primerNombreTr">Primer nombre</th>
                                                    <th id="segundoNombreTr">Segundo nombre</th>
                                                    <th id="priemrApellidoTr">Primer apellido</th>
                                                    <th id="segundoApellidotr">Segundo apellido</th>
                                                    <th id="fechaNacimientoTr">Fecha nacimiento </th>
                                                    <th id="edadTr">Edad</th>                                                       
                                                    <th id="celularTr">Celular</th>
                                                    <th id="Telefonotr">Teléfono</th>
                                                    <th id="correoTr">Correo</th>
                                                    <th id="direccionTr">Dirección</th>
                                                    <th id="generoTr">Género</th> 
                                                    <th id="rolTr">Rol</th>                                                        
                                                    <th id="fechaRegistroTr">Fecha Registro</th>
                                                    <th id="FechaActualizacionTr">Fecha Actualización</th>
                                                    <th id="editarTr">Editar</th>
                                                    <th id="eliminarTr">Eliminar</th>
                                                </tr>
                                            </thead> 
                                            <tbody class="subLetra">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--            modal nuevo        -->
            <div class="modal fade" id="modalNuevo" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg"  role="document">
                    <div class="modal-content" >

                        <div class="modal-body">
                            <div class="container">
                                <div class="card card-register mx-auto mt-3" style="border: none"> //ojo arregla la altura del formulario
                                    <div class="my-form-top">
                                        <div class="myform-top-left">
                                            <br> 
                                            <h3 id="registrarUsuarioTr" style="font-family: cursive; font-weight: 700; font-size: 2.1em">Registrar usuario.</h3>
                                        </div>
                                        <div class="Myform-top-right">
                                            <i class="fas fa-user-check"></i>
                                        </div>
                                    </div>
                                    <form  id="frm_Nuevo" action="../../Usuarion" method="POST" enctype="multipart/form-data" class="center-block ">
                                        <br>
                                        <center class="subLetra">
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="">
                                                            <label  class="letra" for="Numero" id="numeroDocumentoRe">Número documento</label>
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuNumero" id="Numero" class="form-control" placeholder="Numero documento" >
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label  class="letra"  for="Numero" id="tipoDocumentoRe">Tipo documento</label>
                                                        <select style=" font-weight: 600; font-size: 1em;font-family: sans-serif; height: 39px"  style="color: #000" name="txtuTipo" >                                 
                                                            <option value="" disabled=""  selected="">  --------------------- ----------------------- </option>
                                                            <option value="CedulaCiudadania" id="cedulaCiudadania">Cédula de ciudadanía</option>
                                                            <option value="TargetaIdentidad" id="tarjetaIdentidad">Tarjeta de Identidad</option>
                                                            <option value="CedulaExtrangeria" id="cedulaExtranjera">Cédula de extranjería</option>
                                                        </select>
                                                    </div>                                                
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">                                                    
                                                        <label class="letra" for="PrimerNombre" id="primerNombreRe">Primer nombre</label>
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuPrimerNombre" id="PrimerNombre" class="form-control" placeholder="Primer nombre" >
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="letra" for="SegundoNombre" id="segundoNombreRe">Segundo nombre</label>
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuSegundoNombre" id="SegundoNombre" class="form-control" placeholder="Segundo nombre" >
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label class="letra" for="PrimerApellido" id="primerApellidoRe">Primer apellido</label>
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuPrimerApellido" id="PrimerApellido" class="form-control" placeholder="Primer apellido">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="letra" for="segundoApellido" id="segundoApellidore">Segundo apellido</label>
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtusegundoApellido" id="segundoApellido" class="form-control" placeholder="Segundo apellido" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label class="letra" for="nacimiento" id="fechaNacimientoRe">Fecha nacimiento</label>
                                                        <input style=" border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif"  style="border: 2px solid black; border-radius: 10px" type="date" name="txtunacimiento" id="nacimiento" class="form-control" placeholder="Fecha nacimiento" >
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="letra" for="Edad" id="edadRe">Edad</label>
                                                        <input style=" border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuEdad" style="border: 2px solid black;border-radius: 10px" id="Edad" class="form-control" placeholder="Edad">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label class="letra" for="Celular" id="celularRe">Celular</label>
                                                        <input style="border: 2px solid #000; border-radius: 10px ; font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuCelular" style="border: 2px solid black;border-radius: 10px" id="Celular" class="form-control" placeholder="Celular" >
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="letra" for="telefono" id="telefonoRe">Teléfono</label>
                                                        <input style=" border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtutelefono" style="border: 2px solid black;border-radius: 10px" id="telefono" class="form-control" placeholder="Telefono" >
                                                    </div>
                                                </div>
                                                </div6

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra" for="Correo" id="correoRe">Correo</label>
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuCorreo" id="Correo" class="form-control" placeholder="Correo" >
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" for="Dirección" id="direccionRe">Dirección</label>
                                                            <input  style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtuDireccion" id="Direccion" class="form-control" placeholder="Direccion" >
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra" for="Genero" id="generoRe">Género</label>                                                        
                                                            <select style=" font-weight: 600; font-size: 1em;font-family: sans-serif; height: 39px"  name="txtuGenero" id="Genero"  >                                 
                                                                <option value="" disabled=""  selected="">  --------------------- ----------------------- </option>
                                                                <option value="Masculino" id="Masculino">Masculino</option>
                                                                <option value="Femenino" id="Femenino">Femenino</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" for="Contraseña" id="ContraseñaRe">Contraseña</label>
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="password" name="txtuContrasena" id="Contraseña" class="form-control" placeholder="Contraseña" >
                                                        </div>
                                                    </div>
                                                </div>  

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra"  for="foto" id="rolRe">Rol</label>
                                                            <select style=" font-weight: 600; font-size: 1em;font-family: sans-serif; height: 39px"  style="color: #000"  name="txtuRol">                                 
                                                                <option value="" disabled=""  selected=""> --------------------- ------------------------</option>
                                                                <option value="Administrador" id="AdministradorReA">Administrador</option>
                                                                <option value="Entrenador" id="EntrenadorRea">Entrenador</option>
                                                                <option value="Jugador" id="JugadorReA">Jugador</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra"  for="foto" id="fotoRe">Foto</label>
                                                            <input  style=" border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" style="border: 2px solid black;border-radius: 10px" type="file" name="txtufoto" id="foto" class="form-control" >
                                                        </div>
                                                    </div>
                                                </div>
                                        </center>

                                        <div class="modal-footer">
                                            <button id="limpiarRe" type="reset" class="btn btn-outline-info">
                                                Limpiar
                                            </button>
                                            <button id="cancelarRe"type="button" class="btn btn-outline-danger" data-dismiss="modal" >
                                                Cancelar
                                            </button>
                                            <button id="btn_registrar" type="submit" class="btn btn-outline-success AgregarRea" name="accion" value="AgregarUsuario">
                                                Agregar
                                            </button>
                                        </div>                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--       modal modificar-->
            <div class="modal fade" id="modalEdicion" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg"  role="document">
                    <div class="modal-content" >

                        <div class="modal-body">
                            <div class="container">
                                <div class="card card-register mx-auto mt-4" style="border: none">
                                    <div class="my-form-top">
                                        <div class="myform-top-left"><br>
                                            <h3 id="modificarUsuarioMo" style="font-family: cursive; font-weight: 700; font-size: 2.1em">Modificar usuario.</h3>
                                        </div>
                                        <div class="Myform-top-right">
                                            <i class="fas fa-user-check"></i>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <form id="form_editar" enctype="multipart/form-data"  method="POST" enctype="multipart/form-data"> 
                                            <center>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <div class="">
                                                                <label id="numeroDocumentoMo" class="letra"  for="Numero">Número documento</label>
                                                                <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuNumero" id="NumeroU" class="form-control" placeholder="Numero documento" >
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label  class="letra" id="tipoDocumentoMo"  for="Numero">Tipo documento</label>
                                                            <select style=" font-weight: 600; font-size: 1em;font-family: sans-serif; height: 39px"  style="color: #000" id="tipodocumentoUs" name="txtuTipo">                                 
                                                                <option value="" disabled=""  selected="">  ------------------- ----------------</option>
                                                                <option value="CedulaCiudadania" id="cedulaCiudadaniaMo">Cédula de ciudadanía</option>
                                                                <option value="TargetaIdentidad" id="terjetaIdentidadMo">Tarjeta de Identidad</option>
                                                                <option value="CedulaExtrangeria" id="cedulaExtranjeriaMo">cédula de extranjería</option>
                                                            </select>
                                                        </div>                                                
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">                                                    
                                                            <label class="letra" id="priumerNombreMo" for="PrimerNombre">Primer nombre</label>
                                                            <input style=" font-weight: 600; font-size: 1em; font-family: sans-serif" type="text" name="txtuPrimerNombre" id="PrimerNombreU" class="form-control" placeholder="Primer nombre">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" for="SegundoNombre" id="segundoNombreMo">Segundo nombre</label>
                                                            <input  style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtuSegundoNombre" id="SegundoNombreU" class="form-control" placeholder="Segundo nombre" >
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra" id="primerApellidomo" for="PrimerApellido">Primer apellido</label>
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuPrimerApellido" id="PrimerApellidoU" class="form-control" placeholder="Primer apellido" >
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" id="segundoApellidoMo" for="segundoApellido">Segundo apellido</label>
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtusegundoApellido" id="segundoApellidoU" class="form-control" placeholder="Segundo apellido" >
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra" id="fechaNacimientomo" for="nacimiento">Fecha nacimiento</label>
                                                            <input  style=" border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" style="border: 2px solid black; border-radius: 10px" type="date" name="txtunacimiento" id="nacimientoU" class="form-control" placeholder="Fecha nacimiento">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" id="edadMo" for="Edad">Edad</label>
                                                            <input style=" border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuEdad" style="border: 2px solid black;border-radius: 10px" id="EdadU" class="form-control" placeholder="Edad">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra" id="celularMo" for="Celular">Celular</label>
                                                            <input style=" border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif"  type="number" name="txtuCelular" style="border: 2px solid black;border-radius: 10px" id="CelularU" class="form-control" placeholder="Celular" >
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label  class="letra" id="telefonoMo"for="telefono">Teléfono      </label>
                                                            <input style=" border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif"  type="number" name="txtutelefono" style="border: 2px solid black;border-radius: 10px" id="telefonoU" class="form-control" placeholder="Telefono" >
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra" id="correoMo" for="Correo">Correo</label>
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuCorreo" id="CorreoU" class="form-control" placeholder="Correo" >
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" id="direccionMo" for="Dirección">Direccion</label>
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtuDireccion" id="DireccionU" class="form-control" placeholder="Direccion" >
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--                                                <div class="form-group">
                                                                                                    <div class="form-row">
                                                                                                        
                                                                                                        <div class="col-md-6">
                                                                                                            <label class="letra"  for="Contraseña">Contraseña</label>
                                                                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="password" name="txtuContrasena" id="ContrasenaU" class="form-control" placeholder="Contraseña" >
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>-->

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra" id="generoMo" >Género</label>
                                                            <select style=" font-weight: 600; font-size: 1em;font-family: sans-serif; height: 39px"  name="txtuGenero" id="GeneroU"  >                                 
                                                                <option value="" disabled=""  selected="">  --------------------- ----------------------- </option>
                                                                <option value="Masculino" id="Masculino">Masculino</option>
                                                                <option value="Femenino" id="Femenino">Femenino</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label  class="letra" id="rolMo" >Rol</label>
                                                            <select  style=" font-weight: 600; font-size: 1em;font-family: sans-serif; height: 39px" style="color: #000" id="rolU" name="txtuRol">                                 
                                                                <option value="" disabled=""  selected=""> --------------------- ---------------------</option>
                                                                <option value="Administrador" id="administradorMo">Administrador</option>
                                                                <option value="Entrenador" id="entrenadorMo">Entrenador</option>
                                                                <option value="Jugador" id="jugadorMo">Jugador</option>
                                                            </select>
                                                        </div>
                                                        <!--                                                        <div class="col-md-6">
                                                                                                                    <label  class="letra" for="foto">Foto</label>
                                                                                                                    <input style=" border: 2px solid #000; border-radius: 10px ;font-weight: 600;font-size: 1em;font-family: sans-serif"  style="border: 2px solid black;border-radius: 10px" type="file" name="txtufoto" id="fotoU" class="form-control" >
                                                                                                                </div>-->
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label  class="letra" id="fechaRegistroMo">Fecha Registro</label>
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" type="text" name="txtuFechaRegistro" id="fechaRegistroU" class="form-control" placeholder="Fecha Registro" >
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" id="fechaActuañlizacionMo" >Fecha actualización</label>
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" type="text" name="txtuFechaActualiza" id="fechaActualizacionU" class="form-control" placeholder="Fecha actualizacion" >
                                                        </div>
                                                    </div>
                                                </div>
                                            </center>
                                            <div class="modal-footer">
                                                <button id="cancelarMo" type="button" class="btn btn-outline-danger" data-dismiss="modal" >
                                                    Cancelar
                                                </button>
                                                <button type="submit" id="btnModificar" class="btn btn-outline-success ActualizarMo">Actualizar</button>
                                            </div> 
                                        </form>
                                    </div>
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
            <script src="<%=request.getContextPath()%>/dataTable/jquery.dataTables.min.js"></script>
            <script src="<%=request.getContextPath()%>/dataTable/dataTables.bootstrap4.min.js"></script>
            <script src="<%=request.getContextPath()%>/main.js"></script>
            <script src="<%=request.getContextPath()%>/dataTable/botones/dataTables.buttons.min.js"></script>
            <script src="<%=request.getContextPath()%>/dataTable/botones/jszip.min.js"></script>
            <script src="<%=request.getContextPath()%>/dataTable/botones/pdfmake.min.js"></script>
            <script src="<%=request.getContextPath()%>/dataTable/botones/vfs_fonts.js"></script>
            <script src="<%=request.getContextPath()%>/dataTable/botones/buttons.html5.min.js"></script>
            <script src="<%=request.getContextPath()%>/hola/dist/jquery.validate.min.js"></script>
            <script src="../../alertifyjs/js/alertify.min.js"></script>
            <script src="../../sweetAlert2/sweetalert2.all.min.js"></script>
            <script src="../../js/Traductor/TraducirAdministrador.js"></script>
            <script>

                $(document).ready(function () {
                    listar();
                });
//***** FUNCION PARA LISTAR LOS DATOS EN EL DATATABLE.    *****************************************************************************************************
                var listar = function () {
                    var table = $("#example").DataTable({
                        dom: "Bf"
                                + "<rt>"
                                + "lp",
                        buttons: [
                            {
                                extend: 'excelHtml5',
                                text: '<i class="fas fa-file-excel"></i> ',
                                titleAttr: 'Exportar a Excel',
                                className: 'btn btn-outline-success'
                            },
                            {
                                extend: 'pdfHtml5',
                                text: '<i class="fas fa-file-pdf"></i> ',
                                titleAttr: 'Exportar a PDF',
                                className: 'btn btn-outline-danger'
                            },
                            {
                                extend: 'csvHtml5',
                                text: '<i class="fas fa-file-csv"></i> ',
                                titleAttr: 'Exportar a csv',
                                className: 'btn btn-outline-info'
                            },
                            {
                                extend: 'copyHtml5',
                                text: '<i class="fas fa-copy"></i>',
                                titleAttr: 'copiar',
                                className: 'btn btn-outline-warning'
                            }
                        ],
                        destroy: true,
                        ajax: {
                            method: "POST",
                            url: "../../Usuarion?accion=Listar",
                            dataSrc: "datos"
                        },
                        columns: [
                            {data: "numeroDocumento"},
                            {data: "tipoDocumento"},
                            {data: "primerNombre"},
                            {data: "segundoNombre"},
                            {data: "primerApellido"},
                            {data: "segundoApellido"},
                            {data: "fechaNacimiento"},
                            {data: "edad"},
                            {data: "celular"},
                            {data: "telefono"},
                            {data: "correo"},
                            {data: "direccion"},
                            {data: "genero"},
                            {data: "rol"},
                            {data: "fechaRegistro"},
                            {data: "fechaActualizacion"},
                            {data: "Editar"},
                            {data: "Eliminar"}
                        ],
                        language: idiomaEsp
                    });
                };
                $(function () {

//********  FUNCCION AJAX PARA REGISTRAR Y VALIDAR CAMPOS.   ******************************************************************************************                    
                    $('#btn_registrar').click(function (e) {
                        $('#frm_Nuevo').validate({
                            rules: {
                                txtuNumero: {
                                    required: true,
                                    digits: true,
                                    rangelength: [10, 13]
                                },
                                txtuTipo: {
                                    required: true
                                },
                                txtuPrimerNombre: {
                                    required: true
                                },
                                txtuPrimerApellido: {
                                    required: true
                                },
                                txtusegundoApellido: {
                                    required: true
                                },
                                txtunacimiento: {
                                    required: true
                                },
                                txtuEdad: {
                                    required: true,
                                    digits: true,
                                    range: [3, 60]
                                },
                                txtuCelular: {
                                    required: true,
                                    digits: true,
                                    rangelength: [10, 15]
                                },
                                txtutelefono: {
                                    required: true,
                                    digits: true,
                                    rangelength: [7, 11]
                                },
                                txtuCorreo: {
                                    required: true,
                                    email: true
                                },
                                txtuDireccion: {
                                    required: true
                                },
                                txtuGenero: {
                                    required: true
                                },
                                txtuContrasena: {
                                    required: true,
                                    rangelength: [8, 20]
                                },
                                txtuRol: {
                                    required: true
                                },
                                txtufoto: {
                                    required: true
                                }
                            },
                            messages: {
                                txtuNumero: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El numero de documento es rerquerido.",
                                    digits: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese solo numeros",
                                    rangelength: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese un numero de documento valido."
                                },
                                txtuTipo: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El tipo documento es rerquerido.."
                                },
                                txtuPrimerNombre: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El primer nombre es rerquerido."
                                },
                                txtuPrimerApellido: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El primer apellido es rerquerido.."
                                },
                                txtusegundoApellido: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El segundo apellido es rerquerido."
                                },
                                txtunacimiento: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  La fecha de nacimiento es rerquerida."
                                },
                                txtuEdad: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  La edad es rerquerida.",
                                    digits: "<i class='fas fa-exclamation-triangle iconError'></i>   Ingrese solo numeros",
                                    range: "<i class='fas fa-exclamation-triangle iconError'></i>   Ingrese una edad valida"
                                },
                                txtuCelular: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El numero celular es rerquerido.",
                                    digits: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese solo numeros",
                                    rangelength: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese un numero celular de 10 digitos minimo."
                                },
                                txtutelefono: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El numero telefonico es rerquerido.",
                                    digits: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese solo numeros",
                                    rangelength: "<i class='fas fa-exclamation-triangle iconError'></i>  ingrese un numero telefonico de 7 digitos minimo."
                                },
                                txtuCorreo: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El correo es rerquerido.",
                                    email: "<i class='fas fa-exclamation-triangle iconError'></i>  ingrese un correo electronico valido."
                                },
                                txtuDireccion: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  La direccion es rerquerida."
                                },
                                txtuGenero: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El genero es rerquerido."
                                },
                                txtuContrasena: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  La contraseña es rerquerida.",
                                    rangelength: "<i class='fas fa-exclamation-triangle iconError'></i>  ingrese minimo 8 caracteres."
                                },
                                txtuRol: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El rol es rerquerido."
                                },
                                txtufoto: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  La foto es rerquerida."
                                }
                            },
                            submitHandler: function (form) {
                                e.preventDefault();
                                var datos = new FormData($('#frm_Nuevo')[0]);
                                $("#frm_Nuevo")[0].reset();
                                $("#modalNuevo").modal("toggle");
                                $.ajax({
                                    type: "POST",
                                    url: "../../Usuarion?accion=AgregarUsuario",
                                    data: datos,
                                    contentType: false,
                                    processData: false,
                                    success: function (r) {
//                                $("#modalNuevo").modal("toggle");
                                        if (r == 1) {
                                            Swal.fire({
                                                type: 'success',
                                                title: '¡ Usuario creado exitosamente ! ',
                                                width: 500,
                                                padding: '1em',
                                                confirmButtonColor: '#11a621',
                                                showConfirmButton: true,
                                                timer: 3000
                                            });
                                            listar();
                                        } else {
                                            Swal.fire({
                                                type: 'error',
                                                title: '¡Error al Crear el usuario! ',
                                                text: 'Intentelo de nuevo',
                                                width: 500,
                                                confirmButtonColor: '#11a621',
                                                padding: '5em',
                                                showConfirmButton: false,
                                                timer: 4000
                                            });
                                            listar();
                                        }
                                    }
                                });
                            }
                        });
                    });
//*************     FUNCCION AJAX PARA ELIMINAR UN REGISTRO.      ***************************************************************************
                    $(document).on('click', 'a.btnEliminar', function (e) {
                        var numeroDocumento = $(this).attr('id');
                        var fila = $(this).parent().parent();
                        e.preventDefault();
                        var data = {numeroDocumento: numeroDocumento};
                        const swalWithBootstrapButtons = Swal.mixin({
                            customClass: {
                                confirmButton: 'btn btn-success',
                                cancelButton: 'btn btn-danger'
                            },
                            buttonsStyling: false
                        });
                        swalWithBootstrapButtons.fire({
                            title: '¿Desea eliminar el registro con el ID ' + numeroDocumento + ' ? ',
                            type: 'warning',
                            showCancelButton: true,
                            confirmButtonText: 'Si, Eliminar!',
                            cancelButtonText: 'No, Cancelar!',
                            reverseButtons: true
                        }).then((result) => {
                            if (result.value) {
                                $.ajax({
                                    url: "../../Usuarion?accion=EliminarUsuario",
                                    type: "POST",
                                    data: data,
                                    success: function (data) {
                                        Swal.fire(
                                                'Eliminado!',
                                                'El usuario se ha eliminado exitosamente.',
                                                'success'
                                                );
                                        listar();
                                    }
                                });
                            } else if (
                                    /* Read more about handling dismissals below */
                                    result.dismiss === Swal.DismissReason.cancel
                                    )
                            {
                                swalWithBootstrapButtons.fire(
                                        'Cancelado',
                                        'El uusario no se ha eliminado.',
                                        'error'
                                        );
                            }
                        });
                    });

//*************     funcion jquery para cargar los datos en el modar de modificar.  **********************
                    $(document).on('click', 'a.btnEditar', function (e) {
                        fila = $(this).closest("tr");
                        var NumeroU = fila.find('td:eq(0)').text();
                        var tipodocumentoU = fila.find('td:eq(1)').text();
                        var PrimerNombreU = fila.find('td:eq(2)').text();
                        var SegundoNombreU = fila.find('td:eq(3)').text();
                        var PrimerApellidoU = fila.find('td:eq(4)').text();
                        var segundoApellidoU = fila.find('td:eq(5)').text();
                        var nacimientoU = fila.find('td:eq(6)').text();
                        var EdadU = fila.find('td:eq(7)').text();
                        var CelularU = fila.find('td:eq(8)').text();
                        var telefonoU = fila.find('td:eq(9)').text();
                        var CorreoU = fila.find('td:eq(10)').text();
                        var DireccionU = fila.find('td:eq(11)').text();
                        var GeneroU = fila.find('td:eq(12)').text();
                        var rolU = fila.find('td:eq(13)').text();
                        var fechaRegistroU = fila.find('td:eq(14)').text();
                        var fechaActualizacionU = fila.find('td:eq(15)').text();
                        $('#NumeroU').val(NumeroU);
                        $('#tipodocumentoUs').val(tipodocumentoU);
                        $('#PrimerNombreU').val(PrimerNombreU);
                        $('#SegundoNombreU').val(SegundoNombreU);
                        $('#PrimerApellidoU').val(PrimerApellidoU);
                        $('#segundoApellidoU').val(segundoApellidoU);
                        $('#nacimientoU').val(nacimientoU);
                        $('#EdadU').val(EdadU);
                        $('#CelularU').val(CelularU);
                        $('#telefonoU').val(telefonoU);
                        $('#CorreoU').val(CorreoU);
                        $('#DireccionU').val(DireccionU);
                        $('#GeneroU').val(GeneroU);
                        $('#rolU').val(rolU);
                        $('#fechaRegistroU').val(fechaRegistroU);
                        $('#fechaActualizacionU').val(fechaActualizacionU);
                    });

// *************    FUNCCION AJAX PARA ACTUALIZAR.      *************************************************************************************               
                    $('#btnModificar').click(function (e) {
                        $('#form_editar').validate({
                            rules: {
                                txtuNumero: {
                                    required: true,
                                    digits: true,
                                    rangelength: [10, 13]
                                },
                                txtuTipo: {
                                    required: true
                                },
                                txtuPrimerNombre: {
                                    required: true
                                },
                                txtuPrimerApellido: {
                                    required: true
                                },
                                txtusegundoApellido: {
                                    required: true
                                },
                                txtunacimiento: {
                                    required: true
                                },
                                txtuEdad: {
                                    required: true,
                                    digits: true,
                                    range: [1, 60]
                                },
                                txtuCelular: {
                                    required: true,
                                    digits: true,
                                    rangelength: [10, 15]
                                },
                                txtutelefono: {
                                    required: true,
                                    digits: true,
                                    rangelength: [7, 11]
                                },
                                txtuCorreo: {
                                    required: true,
                                    email: true
                                },
                                txtuDireccion: {
                                    required: true
                                },
                                txtuGenero: {
                                    required: true
                                },
                                txtuRol: {
                                    required: true
                                }
                            },
                            messages: {
                                txtuNumero: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El numero de documento es rerquerido.",
                                    digits: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese solo numeros",
                                    rangelength: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese un numero de documento valido."
                                },
                                txtuTipo: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El tipo documento es rerquerido.."
                                },
                                txtuPrimerNombre: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El primer nombre es rerquerido."
                                },
                                txtuPrimerApellido: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El primer apellido es rerquerido.."
                                },
                                txtusegundoApellido: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El segundo apellido es rerquerido."
                                },
                                txtunacimiento: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  La fecha de nacimiento es rerquerida."
                                },
                                txtuEdad: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  La edad es rerquerida.",
                                    digits: "<i class='fas fa-exclamation-triangle iconError'></i>   Ingrese solo numeros",
                                    range: "<i class='fas fa-exclamation-triangle iconError'></i>   Ingrese una edad valida"
                                },
                                txtuCelular: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El numero celular es rerquerido.",
                                    digits: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese solo numeros",
                                    rangelength: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese un numero celular de 10 digitos minimo."
                                },
                                txtutelefono: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El numero telefonico es rerquerido.",
                                    digits: "<i class='fas fa-exclamation-triangle iconError'></i>   ingrese solo numeros",
                                    rangelength: "<i class='fas fa-exclamation-triangle iconError'></i>  ingrese un numero telefonico de 7 digitos minimo."
                                },
                                txtuCorreo: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El correo es rerquerido.",
                                    email: "<i class='fas fa-exclamation-triangle iconError'></i>  ingrese un correo electronico valido."
                                },
                                txtuDireccion: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  La direccion es rerquerida."
                                },
                                txtuGenero: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El genero es rerquerido."
                                },
                                txtuRol: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El rol es rerquerido."
                                }
                            },
                            submitHandler: function (form) {
                                e.preventDefault();
                                $("#modalEdicion").modal("toggle");
                                var NumeroU = document.getElementById('NumeroU').value;
                                var tipodocumentoU = document.getElementById('tipodocumentoUs').value;
                                var PrimerNombreU = document.getElementById('PrimerNombreU').value;
                                var SegundoNombreU = document.getElementById('SegundoNombreU').value;
                                var PrimerApellidoU = document.getElementById('PrimerApellidoU').value;
                                var segundoApellidoU = document.getElementById('segundoApellidoU').value;
                                var nacimientoU = document.getElementById('nacimientoU').value;
                                var EdadU = document.getElementById('EdadU').value;
                                var CelularU = document.getElementById('CelularU').value;
                                var telefonoU = document.getElementById('telefonoU').value;
                                var CorreoU = document.getElementById('CorreoU').value;
                                var DireccionU = document.getElementById('DireccionU').value;
                                var GeneroU = document.getElementById('GeneroU').value;
                                var rolU = document.getElementById('rolU').value;
                                var fechaRegistroU = document.getElementById('fechaRegistroU').value;
                                var fechaActualizacionU = document.getElementById('fechaActualizacionU').value;
                                $.ajax({
                                    url: "../../Usuarion?accion=ActualizarUsuario",
                                    type: "POST",
                                    data: {
                                        NumeroU: NumeroU,
                                        tipodocumentoU: tipodocumentoU,
                                        PrimerNombreU: PrimerNombreU,
                                        SegundoNombreU: SegundoNombreU,
                                        PrimerApellidoU: PrimerApellidoU,
                                        segundoApellidoU: segundoApellidoU,
                                        nacimientoU: nacimientoU,
                                        EdadU: EdadU,
                                        CelularU: CelularU,
                                        telefonoU: telefonoU,
                                        CorreoU: CorreoU,
                                        DireccionU: DireccionU,
                                        GeneroU: GeneroU,
                                        rolU: rolU,
                                        fechaRegistroU: fechaRegistroU,
                                        fechaActualizacionU: fechaActualizacionU
                                    },
                                    success: function (data) {
                                        if (data == 1) {
                                            Swal.fire({
                                                type: 'success',
                                                title: '¡ Registro actualizado exitosamente ! ',
                                                width: 500,
                                                padding: '1em',
                                                confirmButtonColor: '#11a621',
                                                showConfirmButton: true,
                                                timer: 2500
                                            });
                                            listar();
                                        } else {
                                            Swal.fire({
                                                type: 'error',
                                                title: '¡ Error al actualizar ! ',
                                                text: 'Intentelo de nuevo',
                                                width: 500,
                                                confirmButtonColor: '#11a621',
                                                padding: '1em',
                                                showConfirmButton: false,
                                                timer: 2500 //el tiempo que dura el mensaje en ms
                                            });
                                            listar();
                                        }
                                    }
                                });
                            }
                        });
                    });
                });
//********  idioma del datatable.    ************************************************************************
                var idiomaEsp = {
                    "decimal": "",
                    "emptyTable": "No hay datos",
                    "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                    "infoEmpty": "Mostrando 0 a 0 de 0 registros",
                    "infoFiltered": "(Filtro de _MAX_ total registros)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "No se encontraron coincidencias",
                    "paginate": {
                        "first": "Primero",
                        "last": "Ultimo",
                        "next": "Próximo",
                        "previous": "Anterior"
                    },
                    "aria": {
                        "sortAscending": ": Activar orden de columna ascendente",
                        "sortDescending": ": Activar orden de columna desendente"
                    }
                };
            </script>
    </body>
</html>

