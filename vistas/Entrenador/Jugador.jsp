<%@page import="ControladorL.C_Login"%>
<%@page import="Modelo.M_Usuario"%>
<%@page import="Controlador.Rendimiento_C"%>
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
        <title>Entrenador/ConsultarJugador</title>
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/estilosModulos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilosTabla.css">
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Entrenador/consultarJugador.css"/>
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
            font-family: initial;                
        }
        .foto{
            transition: all 0.6s linear;
        }
        .foto:hover{
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
                        <img class="foto" src="../../<%=ro %>" width="25" height="25" style="border-radius: 40px">
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

                <div class="container mt-4">
                    <div class="row">
                        <div class="col-lg-12">
                            <h5 id="consultarJugadorJugador"  style="text-align: center; font-family: cursive; font-weight: 500;font-size: 2.3em">Consultar jugador</h5>
                        </div>
                    </div> <br><br>
                    <div class="row">
                        <div class="col-sm-8 cosa"></div>
                        <div class="col-sm-4 cosa">
                            <label id="buscador" class="letra">Buscador...</label>
                            <br>
                            <input style=" border-radius: 0px;  border: 1px solid #ddd; height: 40px; width: 100%" placeholder="Seleccione un jugador"type="text" class="oro1 letraPr" id="txtBuscar" onkeyup="buscar()"></button>
                        </div>
                    </div> 
                    <br>
                    <div class="row">
                        <% Rendimiento_C  re = new Rendimiento_C (); %>
                        <%= re.jugadorPrint(request) %>
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
            <script src="../../js/Traductor/TraduciEntrenador.js"></script>
            <script src="../../alertifyjs/js/alertify.min.js"></script>
            <script src="../../sweetAlert2/sweetalert2.all.min.js"></script>
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
    </body>
</html>



