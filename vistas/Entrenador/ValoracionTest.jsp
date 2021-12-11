<%@page import="ControladorL.C_Login"%>
<%@page import="Modelo.M_Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Entrenador/ValoracionTestt</title>
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
                        <img src="">
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

            <!--Variable que recupera el parametro que esta en la url, esta variable es la que permite traer el codigo que esta en la url, para luego--> 
            <!--mandarla por el ajax como parametro hacia el controlador rendimiento.-->
            <%
                String codigorendi = request.getParameter("codigo");
            %>

            <!-- ***************         AREA DE TRABAJO  **************************    -->
            <div id="content-wrapper">
                <a  id="perfiljugadortest" class="btn btn-outline-success letraPr" href="ConsultarPerfilJugador.jsp?codigo=<%=codigorendi%>"> <i class="fas fa-arrow-left"> </i> Perfil jugador</a>
                <br>
                <br>
                <div class="container-fluid"> 
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12" >
                            <div class="my-form-top">
                                <div class="myform-top-left">
                                    <h3 id="RegistrarTest"style="font-family: cursive; font-weight: 600; font-size: 2.1em">Registrar test.</h3>
                                </div>  
                                <div class="Myform-top-right">
                                    <i class="fas fa-handshake"></i>
                                </div>
                            </div>
                            <div class="my-form-botton">
                                <div class="ancho">
                                    <div class="table-responsive">
                                        <table id="example" class="table col-md-12 table-condensed table-hover table-striped table-bordered text-center" style="width: 100%">
                                            <br> 
                                            <button id="RegistrarnuevoTest" class="btn btn-primary letra" data-toggle="modal" data-target="#modalNuevo"> Registrar nuevo Test <i  class="fas fa-plus-circle"></i></button> 
                                            <br><br><br>
                                            <thead class="letra">                                                       
                                                <tr>
                                                    <th id="idvaloracion">Id valoracion</th>
                                                    <th id="nombretestest">Nombre test</th>
                                                    <th id="res">Resultado</th>
                                                    <th id="fechatest">Fecha</th>
                                                    <th id="comentarioTest"style="width: 26%">Comentario</th>
                                                    <th id="fechatest">Valoracion</th>
                                                    <!--<th id="codigojugadortest">Código jugador</th>-->
                                                    <th id="editarTest">Editar</th>
                                                    <th id="eliminarTest">Eliminar</th>
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

            <!--     MODAL NUEVO   -->
            <div class="modal fade" id="modalNuevo" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg"  role="document">
                    <div class="modal-content" >
                        <div class="modal-body">
                            <div class="container">
                                <div class="card card-register mx-auto mt-4" style="border: none">
                                    <div class="my-form-top">
                                        <div class="myform-top-left">
                                            <h3 id="nuevtestre" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Nuevo test.</h3>
                                        </div>
                                        <div class="Myform-top-right">
                                            <i class="fas fa-trophy"></i>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <form id="frm_Nuevo" action="Rendimiento?menu=valoracion" method="POST">
                                            <center>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <label id="nombretestRe"class="letra">Nombre test</label>
                                                            <select style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px" name="txtTest" required=""> 
                                                                <option value="" disabled="" selected="">******************** ******************</option>
                                                                <option value="Test Velocidad" id="testvelocidadRe">Test Velocidad</option>
                                                                <option value="Test fuerza" id="Testfuerzare">Test fuerza</option>
                                                                <option value="Test Resistencia" id="TestResistenciare">Test Resistencia</option>
                                                                <option value="Test Coordinacion" id="TestCoordinacionre">Test Coordinación</option>
                                                                <option value="Test Pase" id="TestPasere">Test Pase</option>
                                                                <option value="Test Conduccion" id="TestConduccionre">Test Conducción </option>
                                                                <option value="Test Cabeceo" id="TestCabeceore">Test Cabeceo</option>
                                                                <option value="Test Tiro" id="TestTirore">Test Tiro</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="letra" id="iresultadoTestmo" for="inputPassword1">Resultado</label>
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" id="inputPassword1"  name="txtResultado" class="form-control" placeholder="Resultado" required="required">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-12">
                                                            <label class="letra" id="fechatestRe" for="FechaTes1t">Fecha Test</label>
                                                            <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" type="date" id="FechaTest1" name="txtfecha" class="form-control" placeholder="Fecha Test" required="required">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" value="<%=codigorendi%>" type="hidden" id="ugagorCodigo" name="txtjugagorCodigo" class="form-control" placeholder="codigo Jugador" required="required">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="form-row">                                                
                                                        <div class="col-md-12">
                                                            <label class="letra" id="comentariotestre" for="comentarioooooo">Comentario</label>
                                                            <textarea style="font-weight: 600; font-size: 1em;font-family: sans-serif; height: 38px"  type="text" id="comentario1" name="txtComentario" class="form-control" placeholder="Comentario"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </center>
                                            <div class="modal-footer">
                                                <button id="limiartestRe" type="reset" class="btn btn-outline-info">
                                                    Limpiar
                                                </button>
                                                <button id="cancelartestre" type="button" data-dismiss="modal" class="btn btn-outline-danger">
                                                    Cancelar
                                                </button>
                                                <button  type="submit" id="btn_registrar" class="btn btn-outline-success agregartestre">
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

            <!--     MODAL EDITAR   -->
            <div class="modal fade" id="modalEdicion" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg"  role="document">
                    <div class="modal-content" >
                        <div class="modal-body">
                            <div class="container">
                                <div class="card card-register mx-auto mt-4" style="border: none">
                                    <div class="my-form-top">
                                        <div class="myform-top-left">
                                            <h3 id="modificartestmo" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Modificar test.</h3>
                                        </div>
                                        <div class="Myform-top-right">
                                            <i class="fas fa-trophy"></i>
                                        </div>
                                    </div>

                                    <form id="form_editar">
                                        <br>
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">                                            
                                                    <div class="col-md-6">
                                                        <label class="letra" for="idRendimientoV">Id</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" id="idRendimientoV" readonly="readonly" name="txtValoracionIdV" class="form-control" placeholder="Password" >
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="nombretestMo" class="letra">Nombre test</label>
                                                        <select style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" name="txtTestvaloracion1" id="NombreTestV">                                                         
                                                            <option value="" disabled="" selected="">******************** ******************</option>
                                                            <option value="Test Velocidad" id="testvelocidadMo">Test Velocidad</option>
                                                            <option value="Test fuerza" id="TestfuerzaMo">Test fuerza</option>
                                                            <option value="Test Resistencia" id="TestResistenciaMo">Test Resistencia</option>
                                                            <option value="Test Coordinacion" id="TestCoordinacionMo">Test Coordinación</option>
                                                            <option value="Test Pase" id="TestPaseMo">Test Pase</option>
                                                            <option value="Test Conduccion" id="TestConduccionMo">Test Conducción </option>
                                                            <option value="Test Cabeceo" id="TestCabeceoMo">Test Cabeceo</option>
                                                            <option value="Test Tiro" id="TestTiroMo">Test Tiro</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="fechaTestMo" class="letra" for="FechaTestV">Fecha Test</label>
                                                        <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" type="date" id="FechaTestV" name="txtfechav1" class="form-control" placeholder="Fecha test" required="required">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="resultadotestmo" class="letra" for="resultadoV">Resultado</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" id="resultadoV" value="${valoracionT.getResultadoTest()}" name="txtResultadov1" class="form-control" placeholder="Resultado" required="required">
                                                    </div>                                                 
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">                                                
                                                    <div class="col-md-6">
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" value="<%=codigorendi%>" type="hidden"  readonly="readonly" name="txtjugagorCodigo" class="form-control" placeholder="Codigo jugador" id="jugagorCodigoV">
                                                    </div>  
                                                    <div class="col-md-12">
                                                        <label id="comentariotestmo" class="letra" for="comentarioV">Comentario</label>
                                                        <textarea style="font-weight: 600; font-size: 1em;font-family: sans-serif;  height: 38px" type="text"  id="comentarioValoracion" name="comentarioValoracion" class="form-control" placeholder="Comentario" required="required"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </center>

                                        <div class="modal-footer">
                                            <button id="cancelartestmo" type="submit" class="btn btn-outline-danger" data-dismiss="modal">Cancelar</button>
                                            <button type="submit" id="btnModificar" class="btn btn-outline-success actualizartestmo">Actualizar</button>  
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
            <script src="../../sweetAlert2/sweetalert2.all.min.js"></script>
            <script src="../../js/Traductor/TraduciEntrenador.js"></script>
            <script src="../../alertifyjs/js/alertify.min.js"></script>
    </body>
    <script>
        $(document).ready(function () {
            listar();
        });
//      ****************************************     FUNCION PARA LISTAR LOS DATOS EN EL DATATABLE.      ********************************************************************************
        var listar = function () {
            var codigorendimiento = <%=codigorendi%>
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
                    url: "../../Rendimienton?accion=ListarValoracion&codigorendimiento=" + codigorendimiento + "",
                    dataSrc: "datos"
                },
                columns: [
                    {data: "idValoracionTest"},
                    {data: "nombreTest"},
                    {data: "resultadoTest"},
                    {data: "fechaTest"},
                    {data: "comentariossss"},
                    {data: "Resultado"},
//                    {data: "jugadorCodigo"},
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
                        txtResultado: {
                            required: true,
                            number: true
                        },
                        txtTest: {
                            required: true
                        },
                        txtfecha: {
                            required: true
                        },
                        txtjugagorCodigo: {
                            required: true
                        }
                    },
                    messages: {
                        txtResultado: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El resultado es rerqueridos.",
                            number: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros."
                        },
                        txtTest: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  El nombre test es rerquerido."

                        },
                        txtfecha: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  La fecha es requerida    ."
                        },
                        txtjugagorCodigo: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Los partidos jugados son rerqueridos."
                        }
                    },
                    submitHandler: function (form) {
                        e.preventDefault();
                        var datos = $('#frm_Nuevo').serialize($('#frm_Nuevo')[0]);
                        $("#frm_Nuevo")[0].reset();
                        $("#modalNuevo").modal("toggle");
                        $.ajax({
                            type: "POST",
                            url: "../../Rendimienton?accion=AgregarValoracion",
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
// ***************************** FUNCION AJAX PARA ELIMINAR EL REGISTRO. ********************************************************************************
            $(document).on('click', 'a.btnEliminar', function (e) {
                var idValoracion = $(this).attr('id');
                var fila = $(this).parent().parent();
                e.preventDefault();
                var data = {idValoracion: idValoracion};
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons.fire({
                    title: '¿Desea eliminar el registro con el ID ' + idValoracion + ' ? ',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Si, Eliminar!',
                    cancelButtonText: 'No, Cancelar!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "../../Rendimienton?accion=EliminarValoracion",
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
//  ********************************   METODO JQUERY PARA TRAER LOS DATOS EN EL MODAL DE EDITAR.   ********************************************************************************
            $(document).on('click', 'a.btnEditar', function (e) {
                fila = $(this).closest("tr");
                var idRendimientoV = fila.find('td:eq(0)').text();
                var NombreTestV = fila.find('td:eq(1)').text();
                var resultadoV = fila.find('td:eq(2)').text();
                var FechaTestV = fila.find('td:eq(3)').text();
                var comentarioV = fila.find('td:eq(4)').text();
//                var jugagorCodigoV = fila.find('td:eq(5)').text();
                $('#idRendimientoV').val(idRendimientoV);
                $('#NombreTestV').val(NombreTestV);
                $('#resultadoV').val(resultadoV);
                $('#FechaTestV').val(FechaTestV);
//                $('#jugagorCodigoV').val(jugagorCodigoV);
                $('#comentarioValoracion').val(comentarioV);
            });
        }
        );
// **************************************   FUNCCION AJAX PARA ACTUALIZAR.      *************************************************************************************
        $('#btnModificar').click(function (e) {
            $('#form_editar').validate({
                rules: {
                    txtValoracionIdV: {
                        required: true
                    },
                    txtTestvaloracion1: {
                        required: true
                    },
                    txtfechav1: {
                        required: true
                    },
                    txtResultadov1: {
                        required: true,
                        number: true
                    }
                },
                messages: {
                    txtValoracionIdV: {
                        required: "<i class='fas fa-exclamation-triangle iconError'></i>  El id es rerqueridos."
                    },
                    txtTestvaloracion1: {
                        required: "<i class='fas fa-exclamation-triangle iconError'></i>  El nombre del test es rerqueridos."
                    },
                    txtfechav1: {
                        required: "<i class='fas fa-exclamation-triangle iconError'></i>  La fecha es requerida."
                    },
                    txtResultadov1: {
                        required: "<i class='fas fa-exclamation-triangle iconError'></i>  El resultado es requerido.",
                        number: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingresar solo numeros."
                    }
                },
                submitHandler: function (form) {
                    e.preventDefault();
                    $("#modalEdicion").modal("toggle");
                    var idRendimientoV = document.getElementById('idRendimientoV').value;
                    var NombreTestV = document.getElementById('NombreTestV').value;
                    var resultadoV = document.getElementById('resultadoV').value;
                    var FechaTestV = document.getElementById('FechaTestV').value;
                    var comentarioValoracion = document.getElementById('comentarioValoracion').value;
                    var jugagorCodigoV = document.getElementById('jugagorCodigoV').value;
                    $.ajax({
                        url: "../../Rendimienton?accion=ActualizarValoracion",
                        type: "POST",
                        data: {
                            idRendimientoV: idRendimientoV,
                            NombreTestV: NombreTestV,
                            resultadoV: resultadoV,
                            FechaTestV: FechaTestV,
                            jugagorCodigoV: jugagorCodigoV,
                            comentarioValoracion: comentarioValoracion
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

        //**************************************** IDIOMA DEL DATATABLE. ********************************************************************************
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

