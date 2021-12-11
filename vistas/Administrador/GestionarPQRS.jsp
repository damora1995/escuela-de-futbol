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
        <title>Administrador/GestionarPQRS</title>
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">        <!-- Custom styles for this template-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/estilosModulos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilosTabla.css">
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dataTable/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dataTable/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/main.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/hola/css/form.css">
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
        td{
            width: 100%!important; 
            float: center;
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

            <!-- AREA DE TRABAJO  -->
            <div id="content-wrapper">
                <br>
                <div class="container-fluid"> 
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12 ">
                            <div class="my-form-top">
                                <div class="myform-top-left">
                                    <br>
                                    <h3 id="gestionarPqrs" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Gestionar PQRS.</h3>
                                </div>
                                <div class="Myform-top-right">
                                    <i class="fas fa-mail-bulk"></i>
                                </div>
                            </div>
                            <div class="my-form-botton">
                                <div class="ancho">
                                    <div class="table-responsive">
                                        <br> 
                                        <table id="example" class="table col-md-12 table-condensed table-hover table-striped table-bordered text-center" style="width: 100%">                                           
                                            <thead class="letra">
                                                <tr>
                                                    <th>Id PQRS</th>                                                            
                                                    <th id="nombresPQ">Nombre</th>
                                                    <th id="apellidosPq">Apellido</th>
                                                    <th id="correoPq">Correo</th>
                                                    <th id="telefonoPq">teléfono</th> 
                                                    <th id="rolPq">Rol</th> 
                                                    <th id="MensajePq">Mensaje</th>
                                                    <th id="ResponerPq">Responder</th>                      
                                                    <th id="eliminarPq">Eliminar</th>                      
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

            <!--modal respuesta-->
            <div class="modal fade" id="modalRespuesta" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg"  role="document">
                    <div class="modal-content" >
                        <div class="modal-body">
                            <div class="container">
                                <div class="card card-register mx-auto mt-4" style="border: none">
                                    <div class="my-form-top">
                                        <div class="myform-top-left">
                                            <br>
                                            <h3 id="registrarPQRSSSSS" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Respuesta PQRS...</h3>
                                        </div>
                                        <div class="Myform-top-right">
                                            <i class="fas fa-money-check-alt"> </i>
                                        </div>
                                    </div>

                                    <div class="card-body">
                                        <form id="frm_correo" >
                                            <center>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-12">
                                                            <label class="letra" id="nombreImpleementoIIRe"for="nombreImplentooo">PARA:</label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" type="text" id="correoID"  class="form-control" name="para" placeholder="Para" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra" id="nombreImpleementoIIRe"for="nombreImplentooo">Nombres:</label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" type="text" id="nombreID"  class="form-control"  placeholder="Para" >
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" id="nombreImpleementoIIRe"for="nombreImplentooo">Apellidos</label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" type="text" id="apellidoID"  class="form-control" placeholder="Para" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" type="hidden" id="Cantidad" class="form-control" name="de"placeholder="Cantidad implemento" value="sistemarendimientodeportivo@gmail.com" >
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" type="hidden" id="cantidadDisponibleee" class="form-control" name="clave"  placeholder="Cantidad disponible" value="fm00000000">
                                                        </div>                                                
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" value="Respuesta PQRS" type="hidden" id="Garantia" class="form-control" name="asunto" placeholder="Garantía">
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label id="estadoIIRe" class="letra" for="estado">Respuesta</label>
                                                            <textarea style=" font-weight: 600; font-size: 1em;font-family: sans-serif" rows="7" type="text" id="estado" class="form-control" name="mensaje" placeholder="Respuesta"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </center>

                                            <div class="modal-footer">
                                                <button id="cancelarIIRe" type="button" class="btn btn-outline-danger" data-dismiss="modal" id="guardarnuevo">
                                                    Cancelar
                                                </button>
                                                <button id="btn_registrar" type="submit"class="btn btn-outline-success enviarPq" > 
                                                    Enviar
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

            <!--MODAL MENSAJE-->
            <div class="modal fade" id="mo0dalMensajee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <center>
                            <div class="modal-header" style="text-align: center">                        
                                <h5 class="modal-title letra" id="exampleModalLabel"  style="text-align: center!important; font-size: 1.5em">Mensaje</h5>                        
                            </div>
                            <div class="card-body">
                                <table style="width: 80%; float: center">
                                    <tr style="float: center">
                                        <td class="letraPr" style="border: none!important" id="mensajeJson"></td>
                                    </tr>
                                </table>                          
                            </div>
                            <div class="modal-footer">
                                <button id="CancelarModal" class="btn btn-primary" type="button" data-dismiss="modal">Aceptar</button>
                            </div>
                        </center>
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
// **************   FUNCION AJAX PARA RESPONDER LOS MENSAJES VIA CORREO ELECTRONICO DEL PQRS ENVIADOS   **********************
                $(function () {
                    $('#btn_registrar').click(function (e) {
                        $('#frm_correo').validate({
                            rules: {
                                mensaje: {
                                    required: true
                                }
                            },
                            messages: {
                                mensaje: {
                                    required: "<i class='fas fa-exclamation-triangle iconError'></i>  El mensaje es rerquerido."
                                }
                            },
                            submitHandler: function (form) {
                                e.preventDefault();
                                var datos = $('#frm_correo').serialize();
                                $("#frm_correo")[0].reset();
                                $("#modalRespuesta").modal("toggle");
                                $.ajax({
                                    type: "POST",
                                    url: "resultado.jsp",
                                    data: datos,
                                    success: function (resultado) {                                        
                                        if (resultado == 1) {
                                            alert("enviado");
                                        } else {
                                            Swal.fire({
                                                type: 'success',
                                                title: '¡ Mensaje enviado exitosamente ! ',
                                                width: 500,
                                                padding: '1em',
                                                confirmButtonColor: '#11a621',
                                                showConfirmButton: true,
                                                timer: 2500
                                            });
                                        }
                                    }
                                });
                            }
                        });
                    });
                });

//************   FUNCION JQUERY PARA LLENAR LOS CAMPOS DE CORREO ELECTRONICO, NOMBRES Y APELLIDOS A QUIENES SE LES VA A RESPONDER LOS PQRS  *********
                $(document).on('click', 'a.btnEditar', function (e) {
                    fila = $(this).closest("tr");
                    var correo = fila.find('td:eq(3)').text();
                    var nombres = fila.find('td:eq(1)').text();
                    var apellido = fila.find('td:eq(2)').text();
                    var mensaje = fila.find('td:eq(6)').text();
                    $('#correoID').val(correo);
                    $('#nombreID').val(nombres);
                    $('#apellidoID').val(apellido);
                    $('#mensajeID').val(mensaje);
                });
            </script>

            <script>
                $(document).ready(function () {
                    listar();
                });

//*********     FUNCION AJAX PARA HACER LA PETICION A UN JSON Y DEVOLVER DEPENDIENDO EL ID EL MENSAJE QUE SE VISUALIZARA EN UN MODAL EN LA TABLA PQRS. *******************
                $(document).on('click', 'a.btnMensajepqr', function (e) {
                    var data = "";
                    var idPqrs = $(this).parents("tr").find("td").eq(0).text();
                    $.ajax({
                        url: "../../Usuarion?accion=ListarPQRSMensaje&mensajepqrss=" + idPqrs + "",
                        type: "POST",
                        data: data,
                        dataSrc: "datos",
                        dataType: "json",
                        success: function (data) {
                            $.each(data.datos, function (i, field) {
                                $('#mensajeJson').html(field.mensajee);
                            });
                        }
                    });
                });

//*********       FUNCION PARA LISTAR LOS DATOS EN EL DATATABLE. *******************
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
                        order: [[0, "desc"]],
                        destroy: true,
                        ajax: {
                            method: "POST",
                            url: "../../Usuarion?accion=ListarPQRS",
                            dataSrc: "datos"
                        },
                        columns: [
                            {data: "idPQRS"},
                            {data: "nombre"},
                            {data: "apellido"},
                            {data: "correoelectronico"},
                            {data: "telefonoo"},
                            {data: "Rolpqrs"},
                            {data: "mensaje"},
                            {data: "Responder"},
                            {data: "Eliminar"}
                        ],
                        language: idiomaEsp
                    });
                };

//   ***************      funcion ajax para eliminar el registro.   **********************
                $(document).on('click', 'a.btnEliminar', function (e) {
                    var idpqrs = $(this).attr('id');
                    var fila = $(this).parent().parent();
                    e.preventDefault();
                    var data = {idpqrs: idpqrs};
                    const swalWithBootstrapButtons = Swal.mixin({
                        customClass: {
                            confirmButton: 'btn btn-success',
                            cancelButton: 'btn btn-danger'
                        },
                        buttonsStyling: false
                    });
                    swalWithBootstrapButtons.fire({
                        title: '¿Desea eliminar el registro con el ID ' + idpqrs + ' ? ',
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Si, Eliminar!',
                        cancelButtonText: 'No, Cancelar!',
                        reverseButtons: true
                    }).then((result) => {
                        if (result.value) {
                            $.ajax({
                                url: "../../Usuarion?accion=EliminarPQRS",
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

                //idioma del datatable.
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
