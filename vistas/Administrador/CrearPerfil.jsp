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
        <title>Administrador/crearPerfilJugador</title>
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/estilosModulos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilosTabla.css">
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dataTable/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/main.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/hola/css/form.css"/>
        <link rel="stylesheet" href="../../animate.css"/>
        <link rel="stylesheet" href="../../alertifyjs/css/alertify.min.css"/>
        <link rel="stylesheet" href="../../sweetAlert2/sweetalert2.min.css"/>
    </head>

    <body>
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
    <body>
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

            <!-- area de trabajo  -->

            <div id="content-wrapper">
                <br>
                <div class="container-fluid"> 
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="my-form-top">
                                <div class="myform-top-left">
                                    <br>
                                    <h3 id="crearPerfiljugadorP"style="font-family: cursive; font-weight: 700; font-size: 2.1em">Crear perfil de jugador.</h3>
                                </div>
                                <div class="Myform-top-right">
                                    <i class="fas fa-user-check"></i>
                                </div>
                            </div>
                            <div class="my-form-botton">
                                <div class="ancho">
                                    <div class="table-responsive">
                                        <table id="example" class="table col-md-12 table-condensed table-hover table-striped table-bordered text-center" style="width: 100%">
                                            <br>
                                            <button id="AgregarNuevoP" class="btn btn-primary letra" data-toggle="modal" data-target="#modalNuevo">  Agregar nuevo   <i  class="fas fa-plus-circle"></i></button> 
                                            <a id="generarReporteperfiljuga"  class="btn btn-primary letra" href="../../PDF?accion=reportePerfilJugador" style="margin: 0px 10px ">  Generar reporte   <i class="fas fa-chart-bar"> </i></a> 
                                            <br><br><br>
                                            <thead class="letra">
                                                <tr>
                                                    <th id="codigoJugadorP">Código Jugador</th>
                                                    <th id="documentoJugaadorP">Documento jugador</th>
                                                    <th id="categoriap">Categoría</th>
                                                    <th id="alturap">Altura</th>
                                                    <th id="pesop">Peso</th>
                                                    <th id="numerodorsal">Número dorsal</th>
                                                    <th id="piedominantep">Pie dominante</th>
                                                    <th id="editarp">Editar</th>
                                                    <th id="eliminarp">Eliminar</th>
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

        <!--  modal nuevo-->
        <div class="modal fade" id="modalNuevo" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="container" >
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top">
                                    <div class="myform-top-left">
                                        <br> 
                                        <h3 id="crearPerfilPRe"style="font-family: cursive; font-weight: 700; font-size: 2.1em">Crear perfil.</h3>
                                    </div>
                                    <div class="Myform-top-right">
                                        <i class="fas fa-user-check"></i>
                                    </div>
                                </div>
                                <form id="frm_Nuevo" action="Rendimiento?menu=CrearPerfil" method="POST">
                                    <br>
                                    <center>
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label  class="letra" id="codigoJugadorPRe" for="codigo">Código Jugador</label>
                                                    <input  style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtCodigoJugador" id="codigo" class="form-control" placeholder="Codigo jugador" >
                                                </div>
                                                <div class="col-md-6">
                                                    <label  class="letra" id="documentoJugaadorPRe" for="Documento">Documento jugador</label>
                                                    <select style="color: #000; border: 2px solid #000; border-radius: 10px;font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" id="Documentojjjjjjjjjj" name="txtDocumentoJugador">                                 
                                                        <option value="" disabled=""  selected=""> ------------------------- ------------------------- </option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="letra" id="categoriaPRe" >Categoría</label>
                                            <select style="color: #000; border: 2px solid #000; border-radius: 10px;font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" name="txtuTipoCategoria">                                 
                                                <option value="" disabled=""  selected=""> ------------------------------------  ------------------------------------ ------------------------------------ </option>
                                                <option value="1" id="infantilRe">infantil</option>
                                                <option value="2"id="preinfantilre">Preinfantil</option>
                                                <option value="3" id="juniorRe">Junior</option>
                                                <option value="4" id="juvenilRe">Juvenil</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label class="letra" id="alturapRe" for="Altura">Altura</label>
                                                    <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtuAltura" id="Altura" class="form-control" placeholder="Altura" >
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="letra" id="pesopRe" for="Peso">Peso</label>
                                                    <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtuPeso" id="Peso" class="form-control" placeholder="Peso" >
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label class="letra" id="numerodorsalPRe" for="NumeroDorsal">Número dorsal</label>
                                                    <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtuNumeroDorsal" id="NumeroDorsal" class="form-control" placeholder="Numero dorsal" >
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="letra" id="piedominantepRe" >Pie dominante </label>
                                                        <select style=" border: 2px solid #000; border-radius: 10px;font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" style="color: #000" name="txtuPieDominante">                                 
                                                            <option value="" disabled=""  selected="">-------------------------   -------------------------</option>
                                                            <option value="Pie derecho" id="pieDerechoPRe">P.Derecho</option>
                                                            <option value="Pie izquierdo" id="pieIzquierdoPRe">P.Izquierdo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button id="limpiarPRE" type="reset" class="btn btn-outline-info"  >
                                                Limpiar
                                            </button>
                                            <button id="CancelarPREe"type="button" class="btn btn-outline-danger" data-dismiss="modal">
                                                Cancelar
                                            </button>
                                            <button id="btn_registrar" type="submit" class="btn btn-outline-success agregarPRE"   name="accion" >
                                                Agregar
                                            </button>
                                        </div>
                                    </center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--   modal modificar  -->
        <div class="modal fade" id="modalEdicion" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top">
                                    <div class="myform-top-left">
                                        <br>
                                        <h3 id="ModificaPerfilPMo"style="font-family: cursive; font-weight: 700; font-size: 2.1em">Modificar perfil.</h3>
                                    </div>
                                    <div class="Myform-top-right">
                                        <i class="fas fa-user-check"></i>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form id="form_editar">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label class="letra" id="codigoJugadirPMo" for="codigo">Código Jugador</label>
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txtCodigoJugador" readonly="readonly" id="codigoP" class="form-control" placeholder="Codigo jugador" required="required">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="letra" id="documentoJugaadorPMo" for="Documento">Documento jugador</label>
                                                        <select style="color: #000; border: 2px solid #000; border-radius: 10px;font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" id="Documentoj" name="txtDocumentoJugador">                                 
                                                            <option value="" disabled=""  selected=""> ------------------------- ------------------------- </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label class="letra" id="categoriaPMo" >Categoría</label>
                                                        <select style="color: #000; border: 2px solid #000; border-radius: 10px;font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" id="categoriaJson"  name="categoriaPerfili">                                 
                                                            <option value="" disabled=""  selected=""> ------------------------------------  ------------------------------------ ------------------------------------ </option>
                                                            <option value="1" id="infantilRe">infantil</option>
                                                            <option value="2"id="preinfantilre">Preinfantil</option>
                                                            <option value="3" id="juniorRe">Junior</option>
                                                            <option value="4" id="juvenilRe">Juvenil</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label class="letra" id="alturaPMo" for="Altura">Altura</label>
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtuAltura" id="AlturaP" class="form-control" placeholder="Altura" required="required">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="letra" id="PesoPMo" for="Peso">Peso</label>
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtuPeso" id="PesoP" class="form-control" placeholder="Peso" required="required">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label class="letra" id="numeroDosialPMo" for="NumeroDorsal">Número dorsal</label>
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtuNumeroDorsal" id="NumeroDorsalP" class="form-control" placeholder="Numero dorsal" required="required">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="letra" id="PieDominantePMo" >Pie dominante </label>
                                                            <select style=" border: 2px solid #000; border-radius: 10px;font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" id="pieDominanteP" style="color: #000" required="required" name="txtuPieDominante">                                 
                                                                <option value="" disabled=""  selected="">-------------------------   -------------------------</option>
                                                                <option value="Pie derecho" id="PieDerechoPMo">P.Der</option>
                                                                <option value="Pie izquierdo" id="PireIzquierdoPMo">P.Izq</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button id="CancelarPMO" type="button" class="btn btn-outline-danger" data-dismiss="modal" id="guardarnuevo">
                                                    Cancelar
                                                </button>
                                                <button id="btnModificar" type="submit" class="btn btn-outline-success actualizarPMO">Actualizar</button> 
                                            </div>
                                        </center>
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
            listarJugadores();
        });
//*********     FUNCION AJAX PARA HACER LA PETICION A UN JSON Y DEVOLVER DEPENDIENDO EL CODIGO LA CATEGORIA QUE SE VISUALIZARA EN UN MODAL EN LA TABLA PQRS. *******************
        $(document).on('click', 'a.btnEditar', function (e) {
            var data = "";
            var idPerfil = $(this).parents("tr").find("td").eq(0).text();
//            alert(idPerfil);
            $.ajax({
                url: "../../Usuarion?accion=ListarPerCategoria&categoriaEdiJson=" + idPerfil + "",
                type: "POST",
                data: data,
                dataSrc: "datos",
                dataType: "json",
                success: function (data) {
                    $.each(data.datos, function (i, field) {
                        $('#categoriaJson').html('<option value="' + field.iddCategoria + '">' + field.idCategoria + '</option>');
                    });
                }
            });
        });
        var listarJugadores = function () {
            var data = "";
            $.ajax({
                url: "../../Usuarion?accion=ListarP",
                type: "POST",
                data: data,
                dataSrc: "datos",
                dataType: "json",
                success: function (data) {
                    $.each(data.datos, function (i, field) {
                        $('#Documentojjjjjjjjjj').append('<option value="' + field.numeroDocumento + '">' + field.numeroDocumento + '</option>');
                        $('#Documentoj').append('<option value="' + field.numeroDocumento + '">' + field.numeroDocumento + '</option>');
                    });
                }
            });
        };
        //funcion para listar los datos en el datatable.
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
                    url: "../../Rendimienton?accion=ListarPerfil",
                    dataSrc: "datos"
                },
                columns: [
                    {data: "codigo"},
                    {data: "numeroDocumentoJug"},
                    {data: "idCategoria"},
                    {data: "altura"},
                    {data: "peso"},
                    {data: "numeroDorsal"},
                    {data: "pieDominante"},
                    {data: "Editar"},
                    {data: "Eliminar"}
                ],
                language: idiomaEsp

            });
        };
        $(function () {
            $('#btn_registrar').click(function (e) {
                $('#frm_Nuevo').validate({
                    rules: {
                        txtCodigoJugador: {
                            required: true
                        },
                        txtDocumentoJugador: {
                            required: true
                        },
                        txtuTipoCategoria: {
                            required: true
                        },
                        txtuAltura: {
                            required: true
                        },
                        txtuPeso: {
                            required: true
                        },
                        txtuNumeroDorsal: {
                            required: true,
                            digits: true
                        },
                        txtuPieDominante: {
                            required: true
                        }
                    },
                    messages: {
                        txtCodigoJugador: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El codigo es rerquerido."
                        },
                        txtDocumentoJugador: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El documento del jugador es rerquerido."
                        },
                        txtuTipoCategoria: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La catagoria es rerquerida."
                        },
                        txtuAltura: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La altura es rerquerido."
                        },
                        txtuPeso: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Elpeso es rerquerido."
                        },
                        txtuNumeroDorsal: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El numerodorsal es rerquerido.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingrese solo numeros"
                        },
                        txtuPieDominante: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El pie dominante es rerquerido."
                        }
                    },
                    submitHandler: function (form) {
                        e.preventDefault();
                        var data = $('#frm_Nuevo').serialize();
                        $("#frm_Nuevo")[0].reset();
                        $("#modalNuevo").modal("toggle");
                        $.ajax({
                            type: "post",
                            url: "../../Rendimienton?accion=AgregarPerfil",
                            data: data,
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

//**********  funcion ajax para eliminar el registro.    ************************
            $(document).on('click', 'a.btnEliminar', function (e) {
                var codigoJugador = $(this).attr('id');
                var fila = $(this).parent().parent();
                e.preventDefault();
                var data = {codigoJugador: codigoJugador};
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons.fire({
                    title: '¿Desea eliminar el registro con el codigo ' + codigoJugador + ' ? ',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Si, Eliminar!',
                    cancelButtonText: 'No, Cancelar!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "../../Rendimienton?accion=EliminarPerfil",
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

//*******   funcion jquery para cargar los datos en el modar de modificar.    ***********************
            $(document).on('click', 'a.btnEditar', function (e) {
                fila = $(this).closest("tr");
                var codigoP = fila.find('td:eq(0)').text();
                var DocumentoP = fila.find('td:eq(1)').text();
                var categoriaP = fila.find('td:eq(2)').text();
                var AlturaP = fila.find('td:eq(3)').text();
                var PesoP = fila.find('td:eq(4)').text();
                var NumeroDorsalP = fila.find('td:eq(5)').text();
                var pieDominanteP = fila.find('td:eq(6)').text();
                $('#codigoP').val(codigoP);
                $('#Documentoj').val(DocumentoP);
                $('#categoriaJson').val(categoriaP);
                $('#AlturaP').val(AlturaP);
                $('#PesoP').val(PesoP);
                $('#NumeroDorsalP').val(NumeroDorsalP);
                $('#pieDominanteP').val(pieDominanteP);
            });

//**********  funcion ajax para actualizar.   ********************************
            $('#btnModificar').click(function (e) {
                $('#form_editar').validate({
                    rules: {
                        txtCodigoJugador: {
                            required: true
                        },
                        txtDocumentoJugador: {
                            required: true
                        },
                        categoriaPerfili: {
                            required: true
                        },
                        txtuAltura: {
                            required: true
                        },
                        txtuPeso: {
                            required: true
                        },
                        txtuNumeroDorsal: {
                            required: true,
                            digits: true
                        },
                        txtuPieDominante: {
                            required: true
                        }
                    },
                    messages: {
                        txtCodigoJugador: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El codigo es rerquerido."
                        },
                        txtDocumentoJugador: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El documento del jugador es rerquerido."
                        },
                        categoriaPerfili: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La catagoria es rerquerida."
                        },
                        txtuAltura: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La altura es rerquerido."
                        },
                        txtuPeso: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Elpeso es rerquerido."
                        },
                        txtuNumeroDorsal: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El numerodorsal es rerquerido.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingrese solo numeros"
                        },
                        txtuPieDominante: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El pie dominante es rerquerido."
                        }
                    },
                    submitHandler: function (form) {
                        e.preventDefault();
                        $("#modalEdicion").modal("toggle");
                        var codigo = document.getElementById('codigoP').value;
                        var documento = document.getElementById('Documentoj').value;
                        var categoria = document.getElementById('categoriaJson').value;
                        var altura = document.getElementById('AlturaP').value;
                        var peso = document.getElementById('PesoP').value;
                        var numeroDorsal = document.getElementById('NumeroDorsalP').value;
                        var pieDominante = document.getElementById('pieDominanteP').value;
                        $.ajax({
                            url: "../../Rendimienton?accion=ActualizarPerfil",
                            type: "POST",
                            data: {
                                codigo: codigo,
                                documento: documento,
                                categoria: categoria,
                                altura: altura,
                                peso: peso,
                                numeroDorsal: numeroDorsal,
                                pieDominante: pieDominante
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

</html>

