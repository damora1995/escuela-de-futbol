<%@page import="ModeloDAO.UsuarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="es">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Login</title>
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/select.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Administrador/estilosModulos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilosTabla.css">
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet"> 
        <link rel="stylesheet" href="<%=request.getContextPath()%>/hola/css/form.css"/>
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Entrenador/cosasstablas.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/hola/css/form.css">
        <link rel="stylesheet" href="../../alertifyjs/css/alertify.min.css"/>
        <link rel="stylesheet" href="../../animate.css"/>
        <link rel="stylesheet" href="../../sweetAlert2/sweetalert2.min.css"/>

    </head>

    <body class="bg-darka">
        <div class="col-sm-6 col-sm-offset-3 myform-cont">
            <div class="Mysocial-login">
                <a id="paginaPrincipal" class="btn btn-dark" href="../../index.jsp"><i class="fas fa-arrow-left"></i>  Página principal</a>
            </div>
        </div>

        <div class="container"><br><br>
            <div class="card card-login mx-auto mt-4">
                <div class="card-header" id="IniciarSesion" style="font-size: 1.5em; font-family: cursive"><i class="fa fa-key"> </i> Iniciar sesión  </div>
                <div class="card-body">
                    <form id="frm-loginn" action="Login" method="POST" >
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-12">
                                    <label id="usuario" style="font-family: cursive" for="usuario"><i class="fas fa-user-circle"></i> Usuario</label>
                                    <input style="border: 2px solid black; border-radius: 10px; border: 1px solid green" type="text" name="txtNumeroDocumento" placeholder="usuario" class="form-control" id="usuario">
                                </div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-md-12">
                                <label id="contrasena" style="font-family: cursive" for="contraseña"><i class="fas fa-unlock-alt"></i> Contraseña</label>
                                <input style="border: 1px solid green" type="password" name="txtContraseniaLogin" placeholder="contraseña"  class="form-control" id="contraseña">
                            </div>
                        </div>
                        
                        <center>                        
                            <button id="ingresar" style="width: 80%; color: #000; font-family: cursive" id="buttonLogin" type="submit" class="btn btn-primary "  ><i class="fa fa-lock"></i> INGRESAR</button>
                        </center>
                        <br>
                        <center>                        
                            <button id="traducirLoginIngles" style="width: 25%; color: #fff; font-family: cursive" type="button" class="btn btn-dark ">ING</button>
                            <button id="traducirLoginEspañol" style="width: 25%; color: #fff; font-family: cursive" type="button" class="btn btn-dark ">ESP</button>
                        </center>
                        
                    </form> 
                </div>
            </div>
        </div>



        <!-- Bootstrap core JavaScript-->
        <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="<%=request.getContextPath()%>/hola/dist/jquery.validate.min.js"></script>
        <script src="<%=request.getContextPath()%>/alertifyjs/js/alertify.min.js"></script> 
        <script src="../../sweetAlert2/sweetalert2.all.min.js"></script>
        <script>
            $(function () {

                $('#frm-loginn').validate({
                    rules: {
                        txtNumeroDocumento: {
                            required: true
                        },
                        txtContraseniaLogin: {
                            required: true
                        }
                    },
                    messages: {
                        txtNumeroDocumento: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingrese su usuario."
                        },
                        txtContraseniaLogin: {
                            required: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingrese su contraseña."
                        }
                    },
                    submitHandler: function (form) {
                        var data = $('#frm-loginn').serialize();
                        $.post("../../Login", data, function (res, est, jqXHR) {

                            if (res === '1') {
                                setTimeout(function () {
                                    window.location = "../Entrenador/Entrenador.jsp";
                                }, 2000);
                                Swal.fire({
                                    type: 'success',
                                    title: '¡ Acceso concedido ! ',
                                    text: 'Bienvenido al sistema de rendimiento deportivo',
                                    width: 500,
                                    padding: '1em',
                                    confirmButtonColor: '#11a621',
                                    showConfirmButton: true,
                                    timer: 200
                                });
                            } else if (res === '2') {
                                setTimeout(function () {
                                    window.location = "../Administrador/Administrador.jsp";
                                }, 2000);
                                Swal.fire({
                                    type: 'success',
                                    title: '¡ Acceso concedido ! ',
                                    text: 'Bienvenido al sistema de rendimiento deportivo',
                                    width: 500,
                                    padding: '1em',
                                    confirmButtonColor: '#11a621',
                                    showConfirmButton: true,
                                    timer: 2000
                                });
                            } else if (res === '3') {
                                setTimeout(function () {
                                    window.location = "../Jugador/Jugador.jsp";
                                }, 2000);
                                Swal.fire({
                                    type: 'success',
                                    title: '¡ Acceso concedido ! ',
                                    text: 'Bienvenido al sistema de rendimiento deportivo',
                                    width: 500,
                                    padding: '1em',
                                    confirmButtonColor: '#11a621',
                                    showConfirmButton: true,
                                    timer: 2000
                                });
                            } else {
                                Swal.fire({
                                    type: 'error',
                                    title: '¡Error, credenciales incorrectas! ',
                                    text: 'Intentelo de nuevo.',
                                    width: 500,
                                    confirmButtonColor: '#d92b3f',
                                    padding: '1em',
                                    showConfirmButton: true,
                                    timer: 6000 //el tiempo que dura el mensaje en ms
                                });
//                                    alertify.success('Listo');  puede servir para mandar diferentes alertas diferentes y sencillas
                            }
                        });
                    }
                });
            });
            $('#traducirLoginIngles').click(function () {
                alertify.success('<h5 style="color: #fff;font-size: 1.3em">Translated into english</h5>');
                $('#paginaPrincipal').html('<i class="fas fa-arrow-left"></i> Homepage');
                $('#IniciarSesion').html('<i class="fa fa-key"> </i> Log in');
                $('#usuario').html('<i class="fas fa-user-circle"></i> User');
                $('#contrasena').html('<i class="fas fa-unlock-alt"></i> Password');
                $('#ingresar').html('<i class="fa fa-lock"></i> Enter');
            });
            $('#traducirLoginEspañol').click(function () {
                alertify.success('<h5 style="color: #fff;font-size: 1.5em;width: 500px">Traducido a español</h5>');
                $('#paginaPrincipal').html('<i class="fas fa-arrow-left"></i> Página principal');
                $('#IniciarSesion').html('<i class="fa fa-key"> </i> Iniciar sesión');
                $('#usuario').html('<i class="fas fa-user-circle"></i> Usuario');
                $('#contrasena').html('<i class="fas fa-unlock-alt"></i> Contraseña');
                $('#ingresar').html('<i class="fa fa-lock"></i> Ingresar');
            });
        </script>
    </body>
</html>
