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
    String foto = sesion.getAttribute("foto").toString();
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
        <title>Administrador/Inventario</title>
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/estilosModulos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilosTabla.css">
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dataTable/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/main.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/hola/css/form.css">
        <link rel="stylesheet" href="../../boostrapValidation/css/BootstrapValidator/bootstrapValidator.css"/>
        <link rel="stylesheet" href="../../boostrapValidation/css/BootstrapValidator/bootstrapValidator.min.css"/>
        <link rel="stylesheet" href="../../animate.css"/>
        <link rel="stylesheet" href="../../alertifyjs/css/alertify.min.css"/>
        <link rel="stylesheet" href="../../sweetAlert2/sweetalert2.min.css"/>
    </head>
    <style>
        .letra{
            font-family: cursive;
            font-weight: 600;
            font-size: 1.3em;
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
                        <div class="col-sm-12 col-md-12 col-lg-12" >
                            <div class="my-form-top">
                                <div class="myform-top-left">
                                    <br>
                                    <h3 id="registrarInventarioii" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Registrar inventario.</h3>
                                </div>
                                <div class="Myform-top-right">
                                    <i class="fas fa-futbol"></i>
                                </div>
                            </div>
                            <div class="my-form-botton" >
                                <div class="ancho">
                                    <div class="table-responsive">
                                        <table id="example" class="table col-md-12 table-condensed table-hover table-striped table-bordered text-center" style="width: 100%">
                                            <br>
                                            <button id="agregarNuevoII"class="btn btn-primary letra" data-toggle="modal" data-target="#modalNuevo" >  Agregar nuevo   <i  class="fas fa-plus-circle"></i></button> 
                                            <br><br><br>
                                            <thead class="letra">
                                                <tr>
                                                    <th class="hidden" >Id</th>
                                                    <th id="nombreII">Nombre</th>
                                                    <th id="cantidadimpleII">Cantidad implemento</th>
                                                    <th id="cantidadDisponibleII">Cantidad disponible</th>
                                                    <th id="garantiaIi">Garantía</th>
                                                    <th id="estadoII">Estado</th>
                                                    <th id="fechaEntradaII">Fecha Entrada</th>
                                                    <th id="fechaActualizacionii">Fecha actualización</th>                                                            
                                                    <th id="editar">Editar</th>
                                                    <th id="eliminar">Eliminar</th>
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
        </div>

        <!--modal nuevo-->
        <div class="modal fade" id="modalNuevo" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top">
                                    <div class="myform-top-left">
                                        <br>
                                        <h3 id="registrarinventarioIIRe" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Registrar Inventario.</h3>
                                    </div>
                                    <div class="Myform-top-right">
                                        <i class="fas fa-money-check-alt"> </i>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <form id="frm_Nuevo" method="POST">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label class="letra" id="nombreImpleementoIIRe"for="nombreImplentooo">Nombre Implemento</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" id="nombreImplentooo" class="form-control" name="txtnomombre"placeholder="Nombre Implemento" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="cantidadImpelmetoIIRe"class="letra" for="Cantidad">Cantidad implemento</label>
                                                        <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" id="Cantidad" class="form-control" name="txtcantidad"placeholder="Cantidad implemento">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="cantidaddiponbleIIRe" class="letra" for="cantidadDisponibleee">Cantidad disponible</label>
                                                        <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" id="cantidadDisponibleee" class="form-control" name="txtcantidadDisponible" placeholder="Cantidad disponible">
                                                    </div>                                                
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="garamtiaIIRe" class="letra" for="Garantia">Garantía</label>
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" id="Garantia" class="form-control" name="txtGaran" placeholder="Garantía">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="estadoIIRe" class="letra" for="estado">Estado</label>                                                        
                                                        <select style="font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" id="estado"  style="color: #000"  name="txtEstado">                                 
                                                            <option value="" disabled=""  selected=""> --------------------- ------------------------</option>
                                                            <option value="Bueno" id="BuenoTra">Bueno</option>
                                                            <option value="Regular" id="RegularTra">Regular</option>
                                                            <option value="Malo" id="MaloTra">Malo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </center>

                                        <div class="modal-footer">
                                            <button id="limipiarIIRe" type="reset" class="btn btn-outline-info"  >
                                                Limpiar
                                            </button>
                                            <button id="cancelarIIRe" type="button" class="btn btn-outline-danger" data-dismiss="modal" id="guardarnuevo">
                                                Cancelar
                                            </button>
                                            <button id="btn_registrar" type="submit" class="btn btn-outline-success agregarIIEE" > 
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
        </div>

        <!-- modal para editar -->
        <div class="modal fade" id="modalEdicion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top">
                                    <div class="myform-top-left">
                                        <br>
                                        <h3 id="modificarinventarioIIMo" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Modificar Inventario.</h3>
                                    </div>
                                    <div class="Myform-top-right">
                                        <i class="fas fa-money-check-alt"> </i>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form  id="form_editar" method="POST">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="idInventarioIIMo" class="letra" for="inputPassword">Id inventario</label>
                                                        <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif"  type="number" readonly="readonly" id="idInventarioI" class="form-control" name="txtidInventarioInv"placeholder="Id Inventario">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="nombreImplementoIImo" class="letra" for="inputPassword">Nombre Implemento</label>
                                                        <input type="text" style=" font-weight: 600; font-size: 1em;font-family: sans-serif" id="nombreImplementoI" class="form-control" name="txtnomInv" placeholder="Nombre Implemento">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="cantidadimpelementoIIMo" class="letra" for="Cantidad">Cantidad implemento</label>
                                                        <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" type="number" id="CantidadImplementoi" class="form-control" name="txtcantidad1nv"placeholder="Cantidad implemento">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="cantidadDisponibleIIMo" class="letra" for="inputPassword">Cantidad disponible</label>
                                                        <input style="border: 2px solid #000; border-radius: 10px;font-weight: 600; font-size: 1em;font-family: sans-serif" type="number" id="cantidadDisponibleI" class="form-control" name="txtcantidadDisp1Inv"placeholder="Cantidad disponible">
                                                    </div>                                                
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="garantiaIIMo"  class="letra" for="Garantia">Garantía</label>
                                                        <input type="text" style=" font-weight: 600; font-size: 1em;font-family: sans-serif" id="GarantiaI" class="form-control" name="txtGaran1Inv" placeholder="Garantía">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="estadoIIMo"class="letra" for="estado">Estado</label>
                                                        <select style="font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" id="estadoI"  style="color: #000"  name="txtEstado1nv">                                 
                                                            <option value="" disabled=""  selected=""> --------------------- ------------------------</option>
                                                            <option value="Bueno" id="BuenoTra">Bueno</option>
                                                            <option value="Regular" id="RegularTra">Regular</option>
                                                            <option value="Malo" id="MaloTra">Malo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="fechaEntradaIIMo" class="letra" for="inputPassword">Fecha entrada</label>
                                                        <input style="border: 2px solid #000; border-radius: 10px;font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" type="date" id="fechaEntradaI" class="form-control" name="txtFechaEn1nv"placeholder="Fecha entrada">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="fechaActualizacionIImo" class="letra" for="FechaActualizacion">Fecha actualización</label>
                                                        <input style="border: 2px solid #000; border-radius: 10px;font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" type="date" id="FechaActualizacionI" class="form-control" name="txtActualizacion1nv" placeholder="Fecha actualizacion">
                                                    </div>
                                                </div>
                                            </div>
                                        </center>

                                        <div class="modal-footer">
                                            <button id="cancelarIIMo" type="button" class="btn btn-outline-danger" data-dismiss="modal">
                                                Cancelar
                                            </button>
                                            <button type="submit" id="btnModificar" class="btn btn-outline-success actualizarIIMO" >Actualizar</button> 
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
    </body>

    <script>

    </script>
    <script>

        $(document).ready(function () {
            listar();
            cantidad();
        });
        var cantidad = function(){
            if($('#cantidadimpleII') <= 10){
                alert("ojo con esas manito");
            }
        };
//***** FUNCION PARA LISTAR LOS DATOS EN EL DATATABLE.    *****************************************************************************************************
        var listar = function () {
            var table = $("#example").DataTable({
                dom: "Bf"
                        + "<rt>"
                        + "lip",
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
                order: [[0, "desc"]],
                ajax: {
                    method: "POST",
                    url: "../../Inventarion?accion=ListarInventario",
                    dataSrc: "datos"
                },
                columns: [
                    {data: "idInventario"},
                    {data: "nombreImplemento"},
                    {data: "cantidadImplemento"},
                    {data: "cantidadDisponible"},
                    {data: "garantia"},
                    {data: "estado"},
                    {data: "fechaEntrada"},
                    {data: "fechaActualizacion"},
                    {data: "Editar"},
                    {data: "Eliminar"}
                ],
                language: idiomaEsp

            });
        };
        $(function () {

//********  FUNCCION AJAX PARA REGISTRAR Y VALIDAR CAMPOS.   ******************************************************************************************
            $('#btn_registrar').click(function (e) {//                
                $('#frm_Nuevo').validate({
                    rules: {
                        txtnomombre: {
                            required: true
                        },
                        txtcantidad: {
                            required: true,
                            digits: true
                        },
                        txtcantidadDisponible: {
                            required: true,
                            digits: true
                        },
                        txtGaran: {
                            required: true
                        },
                        txtEstado: {
                            required: true
                        }
                    },
                    messages: {
                        txtnomombre: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El nombre del implemento es rerquerido.."
                        },
                        txtcantidad: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La cantidad es requerida.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  por favor ingrese solo numeros"
                        },
                        txtcantidadDisponible: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La cantidad disponible es rerquerido.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  por favor ingrese solo numeros"
                        },
                        txtGaran: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La garantia es rerquerido."
                        },
                        txtEstado: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El estado es rerquerido."
                        }
                    },
                    submitHandler: function (form) {
                        e.preventDefault();
                        var data = $('#frm_Nuevo').serialize();
//                        var data = new FormData($('#frm_Nuevo')[0]);
//                        for (var entrie of data.entries()) {
//                            console.log(entrie[0] + ': ' + entrie[1]);
//                        }
                        $("#frm_Nuevo")[0].reset();
                        $("#modalNuevo").modal("toggle");
                        $.ajax({
                            url: "../../Inventarion?accion=AgregarInventario",
                            type: "post",
                            data: data,
//                            contentType: false,
//                            processData: false,
                            success: function (data) {
                                if (data == 1) {
                                    Swal.fire({
                                        type: 'success',
                                        title: '¡ Registro creado exitosamente ! ',
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
                                        title: '¡Error al Crear! ',
                                        text: 'Intentelo de nuevo',
                                        width: 500,
                                        confirmButtonColor: '#11a621',
                                        padding: '5em',
                                        showConfirmButton: false,
                                        timer: 4000 //el tiempo que dura el mensaje en ms
                                    });
                                    listar();
                                }
                            }
                        });
                    }
                });
            });
//*******   FUNCCION PARA BORRAR O REFRESCAR LOS CAMPOS DEL MODAL AL REGISTRAR.    ****************************************************
//            $('#modalNuevo').on('hidden.bs.modal', function () {
//                $(this).find('form')[0].reset(); //para borrar todos los datos que tenga los input, textareas, select.
//                $("label.error").remove(); //lo utilice para borrar la etiqueta de error del jquery validate
//            });
      
//*******   FUNCCION AJAX PARA ELIMINAR UN REGISTRO.      ***************************************************************************
            $(document).on('click', 'a.btnEliminar', function (e) {
                var idInventario = $(this).attr('id');
                var fila = $(this).parent().parent();
                e.preventDefault();
                var data = {idInventario: idInventario};
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons.fire({
                    title: '¿Desea eliminar el registro con el ID ' + idInventario + ' ? ',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Si, Eliminar!',
                    cancelButtonText: 'No, Cancelar!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "../../Inventarion?accion=EliminarInventario",
                            type: "POST",
                            data: data,
                            success: function (data) {
                                Swal.fire(
                                        'Eliminado!',
                                        'El registro se ha eliminado exitosamente.',
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
                                'El registro no se ha eliminado.',
                                'error'
                                );
                    }
                });
            });
//********  FUNCCION JQUERY PARA CARGAR LOS DATOS EN EL MODAL DE EDITAR.     *******************************************************
            $(document).on('click', 'a.btnEditar', function (e) {
                fila = $(this).closest("tr");
                var idInventarioI = fila.find('td:eq(0)').text();
                var nombreImplementoI = fila.find('td:eq(1)').text();
                var CantidadImplementoi = fila.find('td:eq(2)').text();
                var cantidadDisponibleI = fila.find('td:eq(3)').text();
                var GarantiaI = fila.find('td:eq(4)').text();
                var estadoI = fila.find('td:eq(5)').text();
                var fechaEntradaI = fila.find('td:eq(6)').text();
                var FechaActualizacionI = fila.find('td:eq(7)').text();
                $('#idInventarioI').val(idInventarioI);
                $('#nombreImplementoI').val(nombreImplementoI);
                $('#CantidadImplementoi').val(CantidadImplementoi);
                $('#cantidadDisponibleI').val(cantidadDisponibleI);
                $('#GarantiaI').val(GarantiaI);
                $('#estadoI').val(estadoI);
                $('#fechaEntradaI').val(fechaEntradaI);
                $('#FechaActualizacionI').val(FechaActualizacionI);
            });

//*******  FUNCCION AJAX PARA ACTUALIZAR.      *************************************************************************************
            $('#btnModificar').click(function (e) {
                $('#form_editar').validate({
                    rules: {
                        txtnomInv: {
                            required: true
                        },
                        txtcantidad1nv: {
                            required: true,
                            digits: true
                        },
                        txtcantidadDisp1Inv: {
                            required: true,
                            digits: true
                        },
                        txtGaran1Inv: {
                            required: true
                        },
                        txtEstado1nv: {
                            required: true
                        }
                    },
                    messages: {
                        txtnomInv: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El nombre es requerido."
                        },
                        txtcantidad1nv: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La cantidad es requerida.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  por favor ingrese solo numeros"
                        },
                        txtcantidadDisp1Inv: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La cantidad disponible es requerida.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  por favor ingrese solo numeros"
                        },
                        txtGaran1Inv: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La garantia es requerida."
                        },
                        txtEstado1nv: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El estado es requerido."
                        }
                    },
                    submitHandler: function (form) {
                        e.preventDefault();
                        var data = $('#form_editar').serialize();
                        $("#modalEdicion").modal("toggle");
                        $.ajax({
                            url: "../../Inventarion?accion=ActualizarInventario",
                            type: "post",
                            data: data,
//                            contentType: false,
//                            processData: false,
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
//****** IDIOMA DATATABLE. **********************************************************************************   
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
</html>

