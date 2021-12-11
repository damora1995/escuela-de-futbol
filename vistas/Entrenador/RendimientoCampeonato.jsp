<%@page import="ControladorL.C_Login"%>
<%@page import="Modelo.M_Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es"> 
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
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Entrenador/RendimientoCampeonato</title>
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"><!-- Custom styles for this template-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/estilosModulos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilosTabla.css">
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dataTable/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/main.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/hola/css/form.css"/>
        <link rel="stylesheet" href="../../animate.css"/>
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

            <!--            //Variable que recupera el parametro que esta en la url, esta variable es la que permite traer el codigo que esta en la url, para luego 
                        //mandarla por el ajax como parametro hacia el controlador rendimiento.-->
            <%
               String codigorendi = request.getParameter("codigo");
            %>

            <!-- ***************         AREA DE TRABAJO  **************************    -->
            <div id="content-wrapper">
                <a id="perfiljugadoRendi"class="btn btn-outline-success letraPr" href="ConsultarPerfilJugador.jsp?codigo=<%=codigorendi%>"> <i class="fas fa-arrow-left"> </i> Perfil jugador</a>
                <br>
                <br>
                <div class="container-fluid"> 
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12" >
                            <div class="my-form-top">
                                <div class="myform-top-left">
                                    <br> 
                                    <h3 id="registrarrendimientocamp"style="font-family: cursive; font-weight: 600; font-size: 2.1em">Registra Rendimiento en el campeonato.</h3>
                                </div>  
                                <div class="Myform-top-right">
                                    <i class="fas fa-trophy"></i>
                                </div>
                            </div>
                            <div class="my-form-botton">
                                <div class="ancho">
                                    <div class="table-responsive">
                                        <!--tblData-->
                                        <table id="example" class="table col-md-12 table-condensed table-hover table-striped table-bordered text-center" width="100%">
                                            <br>
                                            <button id="agregarnuevo"class="btn btn-primary letra" data-toggle="modal" data-target="#modalNuevo" > Agregar nuevo   <i  class="fas fa-plus-circle"></i></button> 
                                            <br><br>
                                            <br><br>
                                            <thead class="letra">
                                                <tr>
                                                    <th id="IdRendimiento">Id</th>
                                                    <th id="Goles">Goles</th>
                                                    <th id="Asistencia">Asistencia</th>
                                                    <th id="tiempoJugado">Tiempo jugado</th>
                                                    <th id="partidoss">Partidos jugados</th>
                                                    <th id="targetasrojas">Tarjetas rojas</th>
                                                    <th id="tarjetasamarillas">Tarjetas amarillas</th>
                                                    <th id="codigojugadorRendi">Código jugador</th>
                                                    <th id="comentariorendi">Comentario</th>
                                                    <th id="editarrendi">Editar</th>
                                                    <th id="elimianrrendi">Eliminar</th>
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

            <!--modal nuevo-->
            <div class="modal fade" id="modalNuevo" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg"  role="document">
                    <div class="modal-content" >
                        <div class="modal-body">
                            <div class="container">
                                <div class="card card-register mx-auto mt-4" style="border: none">
                                    <div class="my-form-top">
                                        <div class="myform-top-left ">
                                            <br>
                                            <h3 id="nuevorendimientorendire"style="font-family: cursive; font-weight: 600; font-size: 2.1em">Nuevo rendimiento.</h3>
                                        </div>
                                        <div class="Myform-top-right">
                                            <i class="fas fa-trophy"></i>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <form id="frm_Nuevo" action="Rendimiento?menu=Rendimiento" method="POST">
                                            <center>
                                                <div class="form-group">
                                                    <div class="form-row">                                                    
                                                        <div class="col-md-6">
                                                            <label id="golesrendire"class="letra" for="lastName">Goles </label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtgoles" id="lastName" class="form-control" placeholder="Goles" >
                                                        </div>                                                   
                                                        <div class="col-md-6">
                                                            <label id="asistenciaremndire"class="letra" for="inputPassword">Asistencia</label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtasistencia" id="inputPassword" class="form-control" placeholder="Asistenacia">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-12">
                                                            <label id="tiempojugadorendire"class="letra" for="tiempojugado">Tiempo jugado</label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttiempoJugado" id="tiempojugado" class="form-control" placeholder="Tiempo jugado en minutos">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" value="1" type="hidden" name="txtpartidosJugados" id="partidosjugados" class="form-control" placeholder="Partidos jugados">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label class="letra" id="tarjetasrpojasrendire"for="tarjetasRojas">Tarjetas rojas</label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttarjetasRojas" id="tarjetasRojas" class="form-control" placeholder="Tarjetas Rojas">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" tarjetasamarillasrendire for="tarjetasAmarillas">Tarjetas amarillas</label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttarjetasAmarillas" id="tarjetasAmarillas" class="form-control" placeholder="Tarjetas amarillas">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" value="<%=codigorendi%>" type="hidden" name="txtCodigoJugador" id="codigoJuga" class="form-control" placeholder="Codigo jugador">
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="letra" id="comentariorendire"for="Comentario">Comentario</label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtComentario" id="Comentario" class="form-control" placeholder="Comentario">
                                                        </div>
                                                    </div>
                                                </div>  

                                                <div class="modal-footer">
                                                    <button id="limpiarrenidre"type="reset" class="btn btn-outline-info"  >
                                                        Limpiar
                                                    </button>
                                                    <button id="cancelarrendire"type="button" class="btn btn-outline-danger"  data-dismiss="modal" >
                                                        Cancelar
                                                    </button>
                                                    <button type="submit" id="btn_registrar" class="btn btn-outline-success agregarrendimire">Agregar</button>  
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


            <!-- Modal de edicion  ---> 
            <div class="modal fade" id="modalEdicion" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg"  role="document">
                    <div class="modal-content" >
                        <div class="modal-body">
                            <div class="container">
                                <div class="card card-register mx-auto mt-4" style="border: none">
                                    <div class="my-form-top">
                                        <div class="myform-top-left">
                                            <h3 id="modificarrendimientomo" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Modificar rendimiento.</h3>
                                        </div>
                                        <div class="Myform-top-right">
                                            <i class="fas fa-trophy"></i>
                                        </div>
                                    </div>

                                    <form  id="form_editar">
                                        <center>
                                            <div class="form-group center">
                                                <div class="form-row">                                                    
                                                    <div class="col-md-6">
                                                        <label class="letra" for="lastName1">Id </label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="number" readonly="readonly" id="idRendimientoR" class="form-control" name="txtidRendimientoCampeonato1" value="${rendimientoJ.getIdRendimientoCampeonato()}">
                                                    </div> 
                                                    <div class="col-md-6">
                                                        <label id="golesmo"class="letra" for="lastName1">Goles </label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtgoles1" id="golesR"  class="form-control" placeholder="Goles"  required="required">
                                                    </div>  
                                                </div>
                                            </div>

                                            <div class="form-group center">
                                                <div class="form-row">                                 
                                                    <div class="col-md-6">
                                                        <label id="asistencaimo"class="letra" for="inputPassword1">Asistencia</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txtasistencia1"  id="asistenciasR" class="form-control" placeholder="Asistencias" required="required">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="tiempojugadormo"class="letra" for="tiempojugado1">Tiempo jugado</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttiempoJugado1"  id="tiempojugado1" class="form-control" placeholder="Tiempo jugado en minutos" required="required">
                                                    </div>       
                                                </div>
                                            </div>

                                            <div class="form-group center">
                                                <div class="form-row">    
                                                    <div class="col-md-6">
                                                        <label class="letra"id="tarjhetasrojasmo" for="tarjetasRojas1">Tarjetas rojas</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttarjetasRojas1"  id="tarjetasRojas1" class="form-control" placeholder="Tarjetas Rojas" required="required">
                                                    </div>  
                                                    <div class="col-md-6">
                                                        <label id="tarjetasamarillasmo"class="letra" for="tarjetasAmarillas1">Tarjetas amarillas</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttarjetasAmarillas1"  id="tarjetasAmarillas1" class="form-control" placeholder="Tarjetas amarillas" required="required">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group center">
                                                <div class="form-row center">
                                                    <div class="col-md-6">
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="hidden" value="1" name="txtpartidosJugados1"   id="partidosjugados1" class="form-control" placeholder="partidos jugados" required="required">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" value="<%=codigorendi%>" type="hidden" name="txtCodigoJugador" id="codigoJugadir" class="form-control" placeholder="Codigo jugador" required="required">
                                                    </div>
                                                </div>
                                            </div>  

                                            <div class="form-group center">
                                                <div class="form-row center">
                                                    <div class="col-md-12">
                                                        <label id="comentariomo" class="letra"  for="Comentario1">Comentario</label>
                                                        <textarea style="font-weight: 600; font-size: 1em;font-family: sans-serif;height: 38px" type="text" name="txtComentario1"   id="Comentario1" class="form-control" placeholder="Comentario" ></textarea>
                                                    </div>
                                                </div>
                                            </div>  
                                        </center>

                                        <div class="modal-footer">
                                            <button id="cancelarrrmo" type="button" data-dismiss="modal" class="btn btn-outline-danger" >Cancelar</button>

                                            <!--   data-toggle="modal" data-target="#modalModificarDos" -->
                                            <button id="btnModificar" type="submit" class="btn btn-outline-success   actualizarrrmo">Actualizar</button>  
                                        </div>
                                    </form>
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
            <script src="../../boostrapValidation/bootstrapValidator/es_ES.js"></script>
            <script src="../../sweetAlert2/sweetalert2.all.min.js"></script>
            <script src="../../js/Traductor/TraduciEntrenador.js"></script>
            <script src="../../alertifyjs/js/alertify.min.js"></script>
    </body>
    <script>

        $(document).ready(function () {
            listar();
        });
//  **********************************************     FUNCION PARA LISTAR LOS DATOS EN EL DATATABLE.      ********************************************************************************

        var listar = function () {
            var codigorendimiento = <%=codigorendi%>
//             var codigorendimiento = $("#example").parents("tr").find("td").eq(7).text();
//var codigorendimiento = $(#)
//             alert(codigorendimiento);
            var dato = {codigorendimiento: codigorendimiento};
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
                order: [[0, "desc"]],
                ajax: {
                    method: "POST",
                    url: "../../Rendimienton?accion=ListarRendimiento&codigorendimiento=" + codigorendimiento + "",
                    data: dato,
                    dataSrc: "datos"
                },
                columns: [
                    {data: "idRendimientoRe"},
                    {data: "golesRe"},
                    {data: "asistenciasRe"},
                    {data: "tiempojugado1Re"},
                    {data: "partidosjugados1Re"},
                    {data: "tarjetasRojas1Re"},
                    {data: "tarjetasAmarillas1Re"},
                    {data: "codigoJugadirRe"},
                    {data: "Comentario1Re"},
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
                        txtgoles: {
                            required: true,
                            digits: true,
                            range: [0, 15]
                        },
                        txtasistencia: {
                            required: true,
                            digits: true,
                            range: [0, 10]
                        },
                        txttiempoJugado: {
                            required: true,
                            digits: true,
                            range: [0, 120]
                        },
                        txtpartidosJugados: {
                            required: true,
                            digits: true
                        },
                        txttarjetasRojas: {
                            required: true,
                            digits: true,
                            range: [0, 1]
                        },
                        txttarjetasAmarillas: {
                            required: true,
                            digits: true,
                            range: [0, 2]
                        },
                        txtCodigoJugador: {
                            required: true
                        }
                    },
                    messages: {
                        txtgoles: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Los goles son rerqueridos.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  No puede ingresar tantos goles."
                        },
                        txtasistencia: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Las asistencias son rerqueridas.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  No puede ingresar tantas asistencias."
                        },
                        txttiempoJugado: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  el tiempo jugado es rerquerido.",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar como maximo 120 minutos.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros."
                        },
                        txtpartidosJugados: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Los partidos jugados son rerqueridos.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros"
                        },
                        txttarjetasRojas: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Los tarjetas rojas son rerqueridas.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingrese solo numeros",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar como maximo una tarjeta roja."
                        },
                        txttarjetasAmarillas: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Los tarjetas amarillas son rerqueridas.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar como maximo dos tarjetas amarillas."
                        },
                        txtCodigoJugador: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El codigo es rerquerido."
                        }
                    },
                    submitHandler: function (form) {
                        e.preventDefault();
                        var datos = $('#frm_Nuevo').serialize();
                        $("#frm_Nuevo")[0].reset();
                        $("#modalNuevo").modal("toggle");
                        $.ajax({
                            type: "POST",
                            url: "../../Rendimienton?accion=AgregarRendimiento",
                            data: datos,
                            success: function (r) {
                                if (r == 1) {
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
//**********************************************      FUNCION AJAX PARA ELIMINAR EL REGISTRO. ********************************************************************************                                                            
            $(document).on('click', 'a.btnEliminar', function (e) {
                var idRendimiento = $(this).attr('id');
                var fila = $(this).parent().parent();
                e.preventDefault();
                var data = {idRendimiento: idRendimiento};
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons.fire({
                    title: '¿Desea eliminar el registro con el ID ' + idRendimiento + ' ? ',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Si, Eliminar!',
                    cancelButtonText: 'No, Cancelar!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "../../Rendimienton?accion=EliminarRendimiento",
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
//*******************************************   METODO JQUERY PARA TRAER LOS DATOS EN EL MODAL DE EDITAR.   ********************************************************************************
            $(document).on('click', 'a.btnEditar', function (e) {
                fila = $(this).closest("tr");
                var idRendimientoR = fila.find('td:eq(0)').text();
                var golesR = fila.find('td:eq(1)').text();
                var asistenciasR = fila.find('td:eq(2)').text();
                var tiempojugado1 = fila.find('td:eq(3)').text();
                var partidosjugados1 = fila.find('td:eq(4)').text();
                var tarjetasRojas1 = fila.find('td:eq(5)').text();
                var tarjetasAmarillas1 = fila.find('td:eq(6)').text();
                var codigoJugadir = fila.find('td:eq(7)').text();
                var Comentario1 = fila.find('td:eq(8)').text();
                $('#idRendimientoR').val(idRendimientoR);
                $('#golesR').val(golesR);
                $('#asistenciasR').val(asistenciasR);
                $('#tiempojugado1').val(tiempojugado1);
                $('#partidosjugados1').val(partidosjugados1);
                $('#tarjetasRojas1').val(tarjetasRojas1);
                $('#tarjetasAmarillas1').val(tarjetasAmarillas1);
                $('#codigoJugadir').val(codigoJugadir);
                $('#Comentario1').val(Comentario1);
            });

//**************************************   FUNCCION AJAX PARA ACTUALIZAR.      *************************************************************************************
            $('#btnModificar').click(function (e) {
                $('#form_editar').validate({
                    rules: {
                        txtgoles1: {
                            required: true,
                            digits: true,
                            range: [0, 15]
                        },
                        txtasistencia1: {
                            required: true,
                            digits: true,
                            range: [0, 10]
                        },
                        txttiempoJugado1: {
                            required: true,
                            digits: true,
                            range: [0, 120]
                        },
                        txtpartidosJugados1: {
                            required: true,
                            digits: true
                        },
                        txttarjetasRojas1: {
                            required: true,
                            digits: true,
                            range: [0, 1]
                        },
                        txttarjetasAmarillas1: {
                            required: true,
                            digits: true,
                            range: [0, 2]
                        },
                        txtCodigoJugador1: {
                            required: true
                        }
                    },
                    messages: {
                        txtgoles1: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Los goles son rerqueridos.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  No puede ingresar tantos goles."
                        },
                        txtasistencia1: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Las asistencias son rerqueridas.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  No puede ingresar tantas asistencias."
                        },
                        txttiempoJugado1: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  el tiempo jugado es rerquerido.",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar como maximo 120 minutos.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros."
                        },
                        txtpartidosJugados1: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Los partidos jugados son rerqueridos.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros"
                        },
                        txttarjetasRojas1: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Los tarjetas rojas son rerqueridas.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingrese solo numeros",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar como maximo una tarjeta roja."
                        },
                        txttarjetasAmarillas1: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Los tarjetas amarillas son rerqueridas.",
                            digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros",
                            range: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar como maximo dos tarjetas amarillas."
                        },
                        txtCodigoJugador1: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El codigo es rerquerido."
                        }
                    },
                    submitHandler: function (form) {
                        e.preventDefault();
                        $("#modalEdicion").modal("toggle");
                        var idRendimientoR = document.getElementById('idRendimientoR').value;
                        var golesR = document.getElementById('golesR').value;
                        var asistenciasR = document.getElementById('asistenciasR').value;
                        var tiempojugado1 = document.getElementById('tiempojugado1').value;
                        var partidosjugados1 = document.getElementById('partidosjugados1').value;
                        var tarjetasRojas1 = document.getElementById('tarjetasRojas1').value;
                        var tarjetasAmarillas1 = document.getElementById('tarjetasAmarillas1').value;
                        var codigoJugadir = document.getElementById('codigoJugadir').value;
                        var Comentario1 = document.getElementById('Comentario1').value;
                        $.ajax({
                            url: "../../Rendimienton?accion=ActualizarRendimiento",
                            type: "POST",
                            data: {
                                idRendimientoR: idRendimientoR,
                                golesRR: golesR,
                                asistenciasRR: asistenciasR,
                                tiempojugadoRR: tiempojugado1,
                                partidosjugadosRR: partidosjugados1,
                                tarjetasRojasRR: tarjetasRojas1,
                                tarjetasAmarillasRR: tarjetasAmarillas1,
                                codigoJugadiRR: codigoJugadir,
                                ComentarioRR: Comentario1
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

//***************************************************** IDIOMA DEL DATATABLE. ********************************************************************************
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
</html>



