<%@page import="ControladorL.C_Login"%>
<%@page import="Modelo.M_Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object numeroDocumento = sesion.getAttribute("numeroDocumento") == null ? null : sesion.getAttribute("numeroDocumento");
    String ro = sesion.getAttribute("foto").toString();
    String rol = sesion.getAttribute("rol").toString();
    String primerNombre = sesion.getAttribute("primerNombre").toString();
    String PrimerApellido = sesion.getAttribute("primerApellido").toString();
    String correo = sesion.getAttribute("correo").toString();
    String celular = sesion.getAttribute("celular").toString();
    String SegNombre = sesion.getAttribute("SegNombre").toString();
    String SegApelli = sesion.getAttribute("SegApelli").toString();
    if (sesion != null) {
        if(numeroDocumento != null){
            if(!rol.equalsIgnoreCase("Entrenador")&&!rol.equalsIgnoreCase("Administrador")){
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
        <title>Entrenador/Prestamo</title>
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/estilosModulos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilosTabla.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Entrenador/cosasstablas.css">
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dataTable/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/main.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/hola/css/form.css"/>
        <link rel="stylesheet" href="../../animate.css"/>
        <link rel="stylesheet" href="../../sweetAlert2/sweetalert2.min.css"/>
        <link rel="stylesheet" href="../../alertifyjs/css/alertify.min.css"/>
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
    <body >
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1 letraPr" href="Entrenador.jsp"><%= " " + rol%></a>
            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>
            <!-- Navbar Search -->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <div class="input-group-append">
                        <button id="traducirEntrenadorIngles" class="btn btn-dark" style="color: #fff;border-radius: 10px" type="button">
                            ING
                        </button>
                        <button id="traducirEntrenadorEspañol" class="btn btn-dark" style="color: #fff;border-radius: 10px" type="button">
                            ESP
                        </button>
                    </div>
                </div>
            </form>

            <!-- MODAL PQRS -->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li>
                    <button href="#ventanaPQRS" id="pqrs" class="btn  btn-primary letraPr" data-toggle="modal"> PQRS</button>
                    <div class="modal fade" id="ventanaPQRS">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title" id="mensajeModal">Tiene alguna pregunta, queja, reclamo, o sugerencia, escribanos...</h4>
                                    <div class="Myform-top-right">
                                        <i class="fas fa-mail-bulk"></i>
                                    </div>
                                </div>
                                <div class="modal-body">
                                    <form id="frm_PQRS">
                                        <div class="form-group"> 
                                            <input type="hidden" name="txttelefono" value="<%=celular%>" id="Telefono" class=" form-control"/><br>
                                            <input type="hidden" name="txtrolpqrs" value="<%=rol%>" id="rolpqrs" class=" form-control"/><br>
                                            <textarea id="lim" type="text" name="txtmensaje" id="mensaje" style="width: 100%;  height:200px" class="campo4 form-control"  style="width: 100%;  height:100px"></textarea>
                                            <input type="hidden" name="txtnombre" value="<%=primerNombre%> <%=SegNombre%>" id="Nombre" class=" form-control"/><br>                                            
                                            <input type="hidden" name="txtapellido" value="<%=PrimerApellido%> <%=SegApelli%>" id="Apellidos" class=" form-control"/><br>
                                            <input type="hidden" name="txtcorreo" value="<%=correo%>" id="mail" class=" form-control"/><br>

                                            <center>
                                                <button type="button" id="cerrarModal" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                <button id="btn_Enviarrr" type="submit"  class="btn btn-success">Enviar</button>       
                                            </center>
                                        </div>
                                    </form>
                                    <!--<textarea id="" name="subject" placeholder="" style="width: 90%;  height:200px"></textarea>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
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
                        <a class="dropdown-item subLetra" href="#"><i class="fas fa-user"></i> <%=  primerNombre + " "+ PrimerApellido%></a>
                        <a class="dropdown-item subLetra" href="#"><i class="fas fa-id-card"></i> <%=  numeroDocumento%></a>
                        <a class="dropdown-item subLetra" href="#"><i class="fas fa-envelope"></i> <%=  correo%></a>
                        <a id="cerrarSesionAviso" class="dropdown-item subLetra" href="#" data-toggle="modal" data-target="#cerrarSesion"><i class="fas fa-power-off"></i> Cerrar sesión</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="modal fade" id="cerrarSesion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                    <a class="nav-link letraPr" href="Jugador.jsp">
                        <i class="fas fa-child"></i>
                        <span id="consultarJugador">Consultar jugador</span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link letraPr" href="Prestamos.jsp">
                        <i class="fas fa-handshake"></i>
                        <span id="Solicitarprestamo">Solicitar préstamo</span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link letraPr"  href="DescripcionTest.jsp">
                        <i class="fas fa-handshake"></i>
                        <span id="Descripciorendimiento">Descripción test de rendimiento</span>
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
                                    <h3 id="SolicitarprestamoPrstamo" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Solicitar préstamo.</h3>
                                </div>
                                <div class="Myform-top-right">
                                    <i class="fas fa-futbol"></i>
                                </div>
                            </div>
                            <div class="my-form-botton">
                                <div class="ancho">
                                    <div class="table-responsive">
                                        <table id="example" class="table col-md-12 table-condensed table-hover table-striped table-bordered text-center" style="width: 100%">
                                            <br>
                                            <button id="AgregarnuevoPrestamo" class="btn btn-primary letra" data-toggle="modal" data-target="#modalNuevo" >  Agregar nuevo   <i  class="fas fa-plus-circle"></i></button> 
                                            <br><br><br>
                                            <thead class="letra">
                                                <tr>
                                                    <th id="Idprestamo">Id préstamo</th>
                                                    <th id="CantidadPrestamo">Cantidad</th>
                                                    <th id="Nombreimplemento">Nombre implemento</th>                          
                                                    <th id="Fechaprestamo">Fecha préstamo</th>
                                                    <th id="Horadevolucion">Hora devolución</th>
                                                    <th id="Editar">Editar</th>
                                                    <th id="Eliminar">Eliminar</th>
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

        <!--modal nuevo -->
        <div class="modal fade" id="modalNuevo" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top">
                                    <div class="myform-top-left">
                                        <h3 id="SolicitarprestamoRe"style="font-family: cursive; font-weight: 600; font-size: 2.1em">Solicitar préstamo.</h3>
                                    </div>
                                    <div class="Myform-top-right">
                                        <i class="fas fa-trophy"></i>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form id="frm_Nuevo"  method="POST">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label id="cantidadprestamoRe" class="letra" for="lastName">Cantidad </label>
                                                        <input type="text" style="font-weight: 600; font-size: 1em;font-family: sans-serif" id="lastName" name="txtCantidad" class="form-control" placeholder="Cantidad" required="required">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label id="mnombreImplementoRe"class="letra" for="inputPassword">Nombre implemento</label>
                                                        <select type="text" style="font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" id="nombreImplementoJson" name="txtnombreImplemento">                                 
                                                            <option value="" disabled=""  selected=""> ---------------------------------- ---------------------------------- ---------------------------------- </option>
                                                        </select>
                                                    </div>
                                                </div> 
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="frchaPrestamoRe"class="letra" for="fechaPres">Fecha préstamo</label>
                                                        <input type="date" style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" id="fechaPres" name="txtFechaPrestamo" class="form-control" placeholder="Fecha prestamo" required="required">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="horaPrestamoRe"class="letra" for="horaDevolucion">Hora devolución</label>
                                                        <input type="time" style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" id="horaDevolucion" name="txtHoraDEvolucion" class="form-control" placeholder="Hora Prestamo" required="required">
                                                    </div>                                                            
                                                </div>
                                            </div>
                                        </center>
                                        <div class="modal-footer">
                                            <button id="limipiarprestamoRe" type="reset" class="btn btn-outline-info" >
                                                Limpiar
                                            </button>
                                            <button id="cancelarprestamoRe" type="submit" class="btn btn-outline-danger" data-dismiss="modal">
                                                Cancelar
                                            </button>
                                            <button id="btn_registrar" type="submit" class="btn btn-outline-success agregarPrestamoRe">Agregar</button>                       
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--            modal editar-->
        <div class="modal fade" id="modalEdicion" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4 " style="border: none">
                                <div class="my-form-top">
                                    <div class="myform-top-left">
                                        <h3 id="Modificarprestamo" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Modificar préstamo.</h3>
                                    </div>
                                    <div class="Myform-top-right">
                                        <i class="fas fa-trophy"></i>
                                    </div>
                                </div>
                                <div id="ocultar" class="card-body">
                                    <form id="frm_actualizar" action="Inventario?menu=Prestamo" method="POST">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="idMo" class="letra" for="lastName1">Id </label>  
                                                        <input type="number" style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" id="idvaloracion" class="form-control" name="txtIdValoracion" >                                                           
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="cantidadPrestamoMo" class="letra" for="lastName9">Cantidad </label>
                                                        <input type="text" style="font-weight: 600; font-size: 1em;font-family: sans-serif" id="cantidadddddd"  name="txtCantidad1" class="form-control" placeholder="Last name" required="">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">                                                
                                                    <div class="col-md-12">
                                                        <label id="nombreInpelementoMo" class="letra" for="inputPassword9">Nombre implemento</label>
                                                        <select type="text" style="font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" id="nombreImplemento" name="txtImplementoNombre">                                 
                                                            <option value="" disabled=""  selected=""> ------------------------- ------------------------- </option>
                                                        </select>
                                                    </div>                                                             
                                                </div>
                                            </div>  

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="fechaprstamoMo"class="letra" for="fechaPres" >Fecha préstamo</label>
                                                        <input type="date" style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" id="fechaPrestamo"  name="txtFechaPrestamo1" class="form-control"  required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="horaDevolucionMo" class="letra" for="confirmPassword9">Hora devolución</label>
                                                        <input type="time" style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif"id="horaDevolucion" name="txtHoraDEvolucion1" class="form-control" placeholder="Confirm password" required="">
                                                    </div>
                                                </div>
                                            </div>
                                        </center>
                                        <div class="modal-footer">
                                            <button id="cancelarMo" type="button" class="btn btn-outline-danger" data-dismiss="modal">Cancelar</button>
                                            <button type="submit" id="btnModificar" class="btn btn-outline-success actuañizarPrestamoMo">Actualizar</button>                         
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
        <script src="../../sweetAlert2/sweetalert2.all.min.js"></script>
        <script src="../../js/Traductor/TraduciEntrenador.js"></script>
        <script src="../../alertifyjs/js/alertify.min.js"></script>

    </body>
    <script>
        $(document).ready(function () {
            listar();
            nombreImplemento();
        });
        var nombreImplemento = function () {
            var data = "";
            $.ajax({
                url: "../../Inventarion?accion=ListarInventario",
                type: "POST",
                data: data,
                dataSrc: "datos",
                dataType: "json",
                success: function (data) {
                    $.each(data.datos, function (i, field) {
                        $('#nombreImplementoJson').append('<option value="' + field.idInventario + '">' + field.nombreImplemento + '</option>');
                        $('#nombreImplemento').append('<option value="' + field.idInventario + '">' + field.nombreImplemento + '</option>');
                    });
                }
            });
        };
//**********************************            FUNCION PARA LISTAR LOS DATOS EN EL DATATABLE.    *****************************************************************************************************
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
                order: [[0, "desc"]],
                destroy: true,
                ajax: {
                    method: "POST",
                    url: "../../Inventarion?accion=Listar",
                    dataSrc: "datos"
                },
                columns: [
                    {data: "idPrestamo"},
                    {data: "cantidad"},
                    {data: "nombreImplemento"},
                    {data: "fechaPrestamo"},
                    {data: "horaPrestamo"},
                    {data: "Editar"},
                    {data: "Eliminar"}
                ],
                language: idiomaEsp

            });
        };
        $(function () {

//***************************************         FUNCCION AJAX PARA REGISTRAR Y VALIDAR CAMPOS.   ******************************************************************************************
            $('#btn_registrar').click(function (e) {
                $('#frm_Nuevo').validate({
                    rules: {
                        txtCantidad: {
                            required: true,
                            digits: true
                        },
                        txtnombreImplemento: {
                            required: true
                        },
                        txtFechaPrestamo: {
                            required: true
                        },
                        txtHoraDEvolucion: {
                            required: true
                        }
                    },
                    messages: {
                        txtCantidad: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La cantidad es rerquerida.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingrese solo numeros"
                        },
                        txtnombreImplemento: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El nombre del implemento es rerquerido."
                        },
                        txtFechaPrestamo: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La fecha es rerquerida."
                        },
                        txtHoraDEvolucion: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La hora es rerquerida."
                        }
                    },
                    submitHandler: function (form) {
                        e.preventDefault();
                        var datos = $('#frm_Nuevo').serialize();
                        $("#frm_Nuevo")[0].reset();
                        $("#modalNuevo").modal("toggle");
                        $.ajax({
                            type: "POST",
                            url: "../../Inventarion?accion=AgregarPrestamo",
                            data: datos,
                            success: function (r) {
                                if (r == "1") {
                                    Swal.fire({
                                        type: 'success',
                                        title: '¡ Registro creado exitosamente ! ',
                                        width: 500,
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
//*************************************            FUNCCION AJAX PARA ELIMINAR UN REGISTRO.      ***************************************************************************
            $(document).on('click', 'a.btnEliminar', function (e) {
                var idPrestamo = $(this).attr('id');
                var fila = $(this).parent().parent();
                e.preventDefault();
                var data = {idPrestamo: idPrestamo};
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons.fire({
                    title: '¿Desea eliminar el registro con el ID ' + idPrestamo + ' ? ',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Si, Eliminar!',
                    cancelButtonText: 'No, Cancelar!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "../../Inventarion?accion=EliminarPrestamo",
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

//**************************************           FUNCCION JQUERY PARA CARGAR LOS DATOS EN EL MODAL DE EDITAR.     *******************************************************
            var fila;
            $(document).on('click', 'a.btnEditar', function (e) {
                fila = $(this).closest("tr");
                var idvaloracion = fila.find('td:eq(0)').text();
                var cantidadP = fila.find('td:eq(1)').text();
                var nombreImplementoP = fila.find('td:eq(2)').text();
                var fechaPrestamoP = fila.find('td:eq(3)').text();
                var horaDevolucionP = fila.find('td:eq(4)').text();
                $('#idvaloracion').val(idvaloracion);
                $('#cantidadddddd').val(cantidadP);
                $('#nombreImplemento').val(nombreImplementoP);
                $('#fechaPrestamo').val(fechaPrestamoP);
                $('#horaDevolucion').val(horaDevolucionP);
            });

//*************************************            FUNCCION AJAX PARA ACTUALIZAR.      *************************************************************************************
            $('#btnModificar').click(function (e) {
                $('#frm_actualizar').validate({
                    rules: {
                        txtCantidad1: {
                            required: true,
                            digits: true
                        },
                        txtnombreImplemento: {
                            required: true
                        },
                        txtFechaPrestamo: {
                            required: true
                        },
                        txtHoraDEvolucion: {
                            required: true
                        }
                    },
                    messages: {
                        txtCantidad1: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La cantidad es rerquerida.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingrese solo numeros"
                        },
                        txtnombreImplemento: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El nombre del implemento es rerquerido."
                        },
                        txtFechaPrestamo: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La fecha es rerquerida."
                        },
                        txtHoraDEvolucion: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La hora es rerquerida."
                        }
                    },
                    submitHandler: function (form) {
                        e.preventDefault();
                        $("#modalEdicion").modal("toggle");
                        var idvaloracion = document.getElementById('idvaloracion').value;
                        var cantidadddddd = document.getElementById('cantidadddddd').value;
                        var nombreImplemento = document.getElementById('nombreImplemento').value;
                        var fechaPrestamo = document.getElementById('fechaPrestamo').value;
                        var horaDevolucion = document.getElementById('horaDevolucion').value;
                        $.ajax({
                            url: "../../Inventarion?accion=Actualizar",
                            type: "POST",
                            data: {
                                idvaloracion: idvaloracion,
                                cantidadddddd: cantidadddddd,
                                nombreImplemento: nombreImplemento,
                                fechaPrestamo: fechaPrestamo,
                                horaDevolucion: horaDevolucion
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

//*******    IDIOMA DATATABLE. *******************************************   
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
    <script>
        //ENVIAR POR PETICION AJAX EL PQRS
        $(function () {
            $('#btn_Enviarrr').click(function (e) {
                e.preventDefault();
                var datos = $('#frm_PQRS').serialize($('#frm_PQRS')[0]);
                //                alert(datos);
                //                return false;
                $.ajax({
                    type: "POST",
                    url: "../../Usuarion?accion=AgregarPQRS",
                    data: datos,
                    success: function (r) {
                        if (r == 1) {
                            Swal.fire({
                                type: 'success',
                                title: '¡ Mensaje enviado exitosamente ! ',
                                width: 500,
                                padding: '1em',
                                confirmButtonColor: '#11a621',
                                showConfirmButton: true,
                                timer: 2500
                            });
                            $("#ventanaPQRS").modal("toggle");
                            $(':text', $('#frm_PQRS')).val('');
                            document.getElementById("lim").value = "";
                        } else {
                            Swal.fire({
                                type: 'error',
                                title: '¡Error al enviar el mensaje! ',
                                text: 'Intentelo de nuevo',
                                width: 500,
                                confirmButtonColor: '#11a621',
                                padding: '5em',
                                showConfirmButton: false,
                                timer: 4000 //el tiempo que dura el mensaje en ms
                            });
                        }
                    }
                });
            });
        });
    </script>
    <script>
        $('#ocultar').show();
        function ocultar() {
            if ($('#btnOcultar').text() === "Ocultar") {
                $('#ocultar').hide();
            }
            ;
        }
    </script>
</html>


