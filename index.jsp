<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es"> 
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Rendimientodeportivo</title>
        <link rel="shortcut icon" href="img/logo.png">
        <link rel="stylesheet" href="animate.css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/resumen.otro.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/hola/css/form.css"/>
        <link href="css/resume.min.css" rel="stylesheet">
        <link href="alertifyjs/css/alertify.min.css" rel="stylesheet">
        <link rel="stylesheet" href="sweetAlert2/sweetalert2.min.css"/>
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
    </style>
    <body id="page-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">
                    <span class="d-block d-lg-none" id="MENÚ">MENÚ</span>
                    <span class="d-none d-lg-block">
                        <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/logo.png" alt="aqui va la foto">
                    </span>
                </a>
                <button class="navbar-toggler" dataId type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger " style="font-family: cursive" href="#" id="Inicio"> <i class="fas fa-home animated infinite tada" ></i> Inicio </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#portafolio" id="Portafolioo" > <i class="fas fa-briefcase animated infinite tada"></i> Portafolio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#quienes-somos" id="Quienes"> <i class="fas fa-users animated infinite tada"></i> Quienes Somos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#contact" id="Contactenos"> <i class="fas fa-mobile-alt animated infinite tada"></i> Contáctenos</a>
                        </li>
                        <li class="nav-item">
                            <a  href="vistas/Usuario/login.jsp"  id="Iniciar" class="nav-link js-scroll-trigger" > <i class="fas fa-user-lock animated infinite tada"></i> Iniciar sesión</a>
                        </li>   
                        <center>
                            <button type="button" class="btn btn-outline-dark" id="traducirIndexIngles" style="width: 35%">ING</button> 
                            <button type="button" class="btn btn-outline-dark" id="traducirIndexEspañol" style="width: 35%">ESP</button>
                        </center>
                    </ul>    
            </nav>

            <div class="container-fluid p-0">
                <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="about">
                    <div class="w-100">
                        <br>
                        <h1 class="mb-0 animated fadeInDownBig letraPr " style="font-size: 2.6em" id="SISTEMATitulo">SISTEMA DE RENDIMIENTO DEPORTIVO  
                            <span class="text-primary"></span>
                        </h1>
                        <div class="subheading mb-5">
                            <a href="mailto:name@email.com"></a>
                        </div><br>
                        <h5 class="lead w-100 animated fadeInUpBig letraPr" style="font-size: 2em" id="DEPORTIVOSubTitulo">CLUB DEPORTIVO INDEPENDIENTE CAPITAL F.C</h5> 
                        <div class="social-icons">
                            <a href="#">
                                <i class="fab fa-linkedin-in animated infinite heartBeat"></i>
                            </a>
                            <a href="#">
                                <i class="fab fa-github animated infinite heartBeat"></i>
                            </a>
                            <a href="#">
                                <i class="fab fa-twitter animated infinite heartBeat"></i>
                            </a>
                            <a href="#">
                                <i class="fab fa-facebook-f animated infinite heartBeat"></i>
                            </a>
                        </div>
                    </div>
                </section>
                <hr class="m-0">

                <aside>
                    <div id="portafolio" class="container-fluid">
                        <br>
                        <h2 class="section-heading text-uppercase text-center" id="Portafolio"> <i class="fas fa-briefcase animated infinite pulse"></i> Portafolio</h2>
                        <br>
                        <div class="row">
                            <div class="col-sm-12 center col-md-4 col-lg-4">
                                <a href="#" class="thumbnail">
                                    <h3 class="text-center img-responsive animated jello bounce" id="Administrador">Administrador</h3>
                                    <br>
                                    <img src="img/administracion.PNG" class="img1 " alt="NUESTRO EQUIPO" width="320px"  height="210px"> 
                                    <p id="responsable" class="animated zoomInUp">Es el responsable de llevar a cabo las actividades necesarias para alcanzar las metas organizacionales. Más específicamente, un administrador desempeña ciertas funciones básicas para que la organización cumpla los objetivos.</p>       
                                </a>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-4">
                                <a href="#" class="thumbnail">
                                    <h3 class="text-center img-responsive animated jello bounce" id="Entrenador">Entrenador</h3>
                                    <br>
                                    <img src="img/entrenador.PNG" class="img1" alt="PRESENCIA" width="320px"  height="210px" >
                                    <p id="persona" class="animated zoomInUp">Es la persona encargada de la dirección, instrucción y entrenamiento de un deportista individual o de un Grupo de deportistas. será el encargado de plasmar todo su esfuerza para el desarrollo del nivel deportivo del joven deportista.</p>
                                </a>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-4">
                                <a href="#" class="thumbnail">
                                    <h3 class="text-center img-responsive animated jello bounce" id="Jugador">Jugador</h3>
                                    <br>
                                    <img src="img/jugadores.jpg" class="img1" alt="NUESTRO EQUIPO" width="320px" height="210px">
                                    <p id="El" class="animated zoomInUp"> El jugador es la persona encargada de realizar las prácticas de entrenamientos y representarnos en los campeonatos, no solo como futbolista si no como una persona íntegra entregado a su labor.</p>      
                                </a>
                            </div>
                        </div>
                    </div>
                </aside>


                <!-- quienes somoss quienes somoss quienes somoss quienes somoss
                quienes somoss quienes somoss quienes somoss
                quienes somoss quienes somoss quienes somoss quienes somoss quienes somoss quienes somoss quienes somoss quienes somoss quienes somoss quienes somoss quienes somoss 
                quienes somoss -->
                <section >
                    <hr class="m-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 text-center" id="quienes-somos">
                                <br>
                                <h2 class="section-heading text-uppercase" id="Somos" > <i class="fas fa-users animated infinite pulse"></i> Quienes Somos</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <ul class="timeline">
                                    <li>
                                        <div class="timeline-image">
                                            <img class="rounded-circle img-fluid" src="img/quienes.jpg" alt="">
                                        </div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                            </div>
                                            <br>
                                            <div class="timeline-body">
                                                <p class="text-muted animated zoomInUp" id="club">El club deportivo independiente tintal es una escuela de formación deportiva especializada en fútbol con aval y reconocimiento deportivo del IDRD dirigida a niños y jóvenes entre los cuatro (4) y dieciocho (18) años de edad; con sedes en diferentes partes de la localidad y reconocida por la adecuada aplicación de procesos pedagógicos y metodológicos para la enseñanza del fútbol.</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="timeline-inverted">
                                        <div class="timeline-image">
                                            <img class="rounded-circle img-fluid img-responsive" src="img/mision.jpg" alt="">
                                        </div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h4 class="subheading animated jello bounce" id="Misión">Misión</h4>
                                            </div>
                                            <div class="timeline-body">
                                                <p class="text-muted2 animated zoomInUp" id="institución">Somos una institución deportiva con mejoramiento Continuo y dinámico en  procesos de formación y perfeccionamiento deportivo del fútbol, mediante la formulación de estrategias pedagógicas, didácticas y metodológicas innovadoras, con calidad y fundamentadas en el conocimiento, la ciencia y la tecnología, contribuyendo con nuestro País  en la formación de seres humanos íntegros, futbolistas de excelencia desde el punto de vista motor, físico, técnico, táctico y psicológico.</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="timeline-image">
                                            <img class="rounded-circle img-fluid" src="img/vision.jpg" alt="">
                                        </div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h4 class="subheading animated jello bounce" id="Visión">Visión</h4>
                                            </div>
                                            <div class="timeline-body">
                                                <p class="text-muted animated zoomInUp" id="Llegar">Llegar a ser en el año 2020 la Academia de Fútbol líder y referente en la ciudad, con mayor reconocimiento por logros deportivos alcanzados a nivel local y nacional  y por la continua innovación en el desarrollo de procesos formativos y de perfeccionamiento en el fútbol. Posicionarnos como una de lasmejores academias con proyección de futbolistas a clubes en la ciudad.</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="timeline-inverted">
                                        <div class="timeline-image">
                                            <img class="rounded-circle img-fluid" src="img/logros.png" alt="">
                                        </div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h4 class="subheading animated jello bounce" id="Logros">Logros</h4>
                                            </div>
                                            <div class="timeline-body">
                                                <p class="text-muted2 animated zoomInUp" id="Nuestro">Nuestro club ha logrado mantenerse en lo más alto rendimiento de los campeonatos y con el esfuerzo hemos logrado muchos trofeos y triunfos beneficiosos para el club, y esperamos seguir ganando muchas más cosas.</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="timeline-inverted">
                                        <div class="timeline-image">
                                            <h4 id="esfuerzo" class="animated infinite tada">Tu esfuerzo
                                                <br id="hace" class="animated zoomInUp">te hace
                                                <br id="grande" class="animated zoomInUp">grande</h4>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>


                <!-- contactenocsssssssssssssssssssssssssssssssssssssssssssss
                ssssssssssssssssssssssssssss
                sssssssssssssssssssssssss
                sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss -->
                <section >
                    <div class="container animated rubberBand">
                        <div class="row">
                            <div class="col-lg-12 " id="contact">
                                <br>
                                <h2 class="section-heading text-center" id="Contactenoss"> <i class="fas fa-mobile-alt animated infinite pulse"></i> Contactenos</h2>
                            </div>
                            <br>
                            <br>
                            <br>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12  col-xs-12">         
                                <form id="frm_PQRS" action="Usuario?menu=PQRS">
                                    <div class="form-group">
                                        <label id="Nombres">Nombre</label>
                                        <input style="background-color:  #e6f2e9" type="text" name="txtnombre" id="Nombre" class=" form-control"/><br>

                                        <label id="Apellido">Apellido</label>
                                        <input style="background-color:  #e6f2e9" type="text" name="txtapellido" id="Apellidos" class=" form-control"/><br>

                                        <label id="CorreoElectronico">Correo electronico</label>
                                        <input style="background-color:  #e6f2e9" type="text" name="txtcorreo" id="mail" class=" form-control"/><br>

                                        <label id="Telefono">Telefono</label>
                                        <input style="background-color:  #e6f2e9" type="text" name="txttelefono" id="Telefono" class=" form-control"/><br>                                       

                                        <label id="envianosmensaje"> Envianos un mensaje</label>
                                        <textarea style="background-color:  #e6f2e9" id="lim" type="text" name="txtmensaje" id="mensaje" class="campo4 form-control"  style="width: 100%;  height:100px"></textarea>
                                        <input type="hidden" name="txtrolpqrs" value="Invitado" id="" class=" form-control"/><br>
                                        <button id="btn_Enviar" type="submit"  class="btn btn-success">Enviar</button>
                                        <button type="reset" id="limpiar" class="btn btn-dark">Limpiar</button>                                        
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">              
                                <div class="borde div-arr">
                                    <br>
                                    <iframe class="animated rubberBand" src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3976.721368930688!2d-74.15802428420004!3d4.643709579921464!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2sco!4v1543475434003" width="420"  height="580" frameborder="0" style="border:0" allowfullscreen></iframe> 
                                </div>
                            </div>  
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="alertifyjs/js/alertify.min.js"></script>
        <script src="sweetAlert2/sweetalert2.all.min.js"></script>
        <script src="<%=request.getContextPath()%>/hola/dist/jquery.validate.min.js"></script>

        <!-- Custom scripts for this template -->
        <!-- script propios -->
        <script>
            //funccion ajax para enviar el formulario de contactenos y registrar el pqrs del invitado
            $(function () {
                $('#btn_Enviar').click(function (e) {
                    $('#frm_PQRS').validate({
                        rules: {
                            txtnombre: {
                                required: true
                            },
                            txtapellido: {
                                required: true
                            },
                            txtcorreo: {
                                required: true,
                                email: true
                            },
                            txttelefono: {
                                required: true,
                                digits: true
                            },
                            txtmensaje: {
                                required: true
                            }
                        },
                        messages: {
                            txtnombre: {
                                required: "<i class='fas fa-exclamation-triangle iconError'></i>  El nombre es rerquerida."
                            },
                            txtapellido: {
                                required: "<i class='fas fa-exclamation-triangle iconError'></i>  El apellido es rerquerido."
                            },
                            txtcorreo: {
                                required: "<i class='fas fa-exclamation-triangle iconError'></i>  El correo es rerquerida.",
                                email: "<i class='fas fa-exclamation-triangle iconError'></i>  ingrese un correo electronico valido."
                            },
                            txttelefono: {
                                required: "<i class='fas fa-exclamation-triangle iconError'></i>  telefono es rerquerida.",
                                digits: "<i class='fas fa-exclamation-triangle iconError'></i>  Ingrese solo numeros"
                            },
                            txtmensaje: {
                                required: "<i class='fas fa-exclamation-triangle iconError'></i>  El mensaje es rerquerida."
                            }
                        },
                        submitHandler: function (form) {
                            e.preventDefault();
                            var datos = $('#frm_PQRS').serialize();
                            $("#frm_PQRS")[0].reset();
                            $.ajax({
                                type: "POST",
                                url: "Usuarion?accion=AgregarPQRS",
                                data: datos,
                                success: function (r) {
//                                    $(':text', $('#frm_PQRS')).val('');
//                                    document.getElementById("lim").value = "";
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
                                        listar();
                                    }
                                }
                            });
                        }
                    });
                });
            });

            $('#traducirIndexIngles').click(function () {
                alertify.success('<a style="font-size: 0.95em">Translated into english</a>');
                $('#Inicio').html(' <i class="fas fa-home animated infinite tada" ></i> Start');
                $('#Quienes').html('<i class="fas fa-users animated infinite tada"></i>  About us');
                $('#Contactenos').html('<i class="fas fa-mobile-alt animated infinite tada"></i> Contact Us');
                $('#Iniciar').html('<i class="fas fa-user-lock animated infinite tada"></i> Log in ');
                $('#SISTEMATitulo').html('SPORTS PERFORMANCE SYSTEM');
                $('#DEPORTIVOSubTitulo').html('INDEPENDENT SPORTS CLUB CAPITAL F.C');
                $('#Administrador').html('Administrator');
                $('#responsable').html('He is responsible for carrying out the activities necessary to achieve organizational goals. More specifically, an administrator performs certain basic functions for the organization to meet the objectives.');
                $('#Entrenador').html('Coach');
                $('#persona').html('It is the person in charge of the direction, instruction and training of an individual athlete or a group of athletes. He will be responsible for expressing all his efforts to develop the sports level of the young athlete.');
                $('#Jugador').html('Player');
                $('#El').html('The player is the person in charge of performing the training practices and representing us in the championships, not only as a footballer but also as an integral person dedicated to his work.');
                $('#Somos').html('About us');
                $('#club').html('The independent sports club Tintal is a sports training school specialized in football with endorsement and sports recognition of the IDRD aimed at children and young people between four (4) and eighteen (18) years of age; with offices in different parts of the town and recognized for the appropriate application of pedagogical and methodological processes for teaching football.');
                $('#Misión').html('Mission');
                $('#institución').html('We are a sports institution with continuous and dynamic improvement in training and sports improvement processes of football, through the formulation of innovative pedagogical, didactic and methodological strategies, with quality and based on knowledge, science and technology, contributing to our Country in the formation of integral human beings, footballers of excellence from the motor, physical, technical, tactical and psychological point of view.');
                $('#Visión').html('View');
                $('#Llegar').html('To become in 2020 the leading Soccer Academy and reference in the city, with greater recognition for sports achievements achieved at local and national level and for the continuous innovation in the development of training and improvement processes in football. Position ourselves as one of the best academies with projection of soccer players to clubs in the city.');
                $('#Logros').html('Achievements');
                $('#Nuestro').html('Our club has managed to remain in the highest performance of the championships and with the effort we have achieved many trophies and triumphs beneficial to the club, and we hope to continue winning many more things.');
                $('#esfuerzo').html('Your effort <br> makes you <br> big.');
                $('#Contactenoss').html('Contact Us');
                $('#Nombres').html('Names');
                $('#Apellido').html('surnames');
                $('#CorreoElectronico').html('Email');
                $('#Telefono').html('Phone');
                $('#envianosmensaje').html('send us a message');
                $('#btn_Enviar').html('Submit');
                $('#limpiar').html('Clean');
            });
            $('#traducirIndexEspañol').click(function () {
                alertify.success('Traducido a español');
                $('#Inicio').html(' <i class="fas fa-home animated infinite tada" ></i> Inicio');
                $('#Quienes').html('<i class="fas fa-users animated infinite tada"></i>  Quienes Somos');
                $('#Contactenos').html('<i class="fas fa-mobile-alt animated infinite tada"></i> Contáctenos');
                $('#Iniciar').html('<i class="fas fa-user-lock animated infinite tada"></i> Iniciar sesión');
                $('#SISTEMATitulo').html('SISTEMA DE RENDIMIENTO DEPORTIVO');
                $('#DEPORTIVOSubTitulo').html('CLUB DEPORTIVO INDEPENDIENTE CAPITAL F.C');
                $('#Administrador').html('Administrador');
                $('#responsable').html('Es el responsable de llevar a cabo las actividades necesarias para alcanzar las metas organizacionales. Más específicamente, un administrador desempeña ciertas funciones básicas para que la organización cumpla los objetivos.');
                $('#Entrenador').html('Entrenador');
                $('#persona').html('Es la persona encargada de la dirección, instrucción y entrenamiento de un deportista individual o de un Grupo de deportistas. será el encargado de plasmar todo su esfuerza para el desarrollo del nivel deportivo del joven deportista. ');
                $('#Jugador').html('Jugador');
                $('#El').html('El jugador es la persona encargada de realizar las prácticas de entrenamientos y representarnos en los campeonatos, no solo como futbolista si no como una persona íntegra entregado a su labor.');
                $('#Somos').html('Quienes Somos');
                $('#club').html('El club deportivo independiente Tintal es una escuela de formación deportiva especializada en fútbol con aval y reconocimiento deportivo del IDRD dirigida a niños y jóvenes entre los cuatro (4) y dieciocho (18) años de edad; con sedes en diferentes partes de la localidad y reconocida por la adecuada aplicación de procesos pedagógicos y metodológicos para la enseñanza del fútbol. ');
                $('#Misión').html('Misión');
                $('#institución').html('Somos una institución deportiva con mejoramiento Continuo y dinámico en  procesos de formación y perfeccionamiento deportivo del fútbol, mediante la formulación de estrategias pedagógicas, didácticas y metodológicas innovadoras, con calidad y fundamentadas en el conocimiento, la ciencia y la tecnología, contribuyendo con nuestro País  en la formación de seres humanos íntegros, futbolistas de excelencia desde el punto de vista motor, físico, técnico, táctico y psicológico. ');
                $('#Visión').html('Visión ');
                $('#Llegar').html('Llegar a ser en el año 2020 la Academia de Fútbol líder y referente en la ciudad, con mayor reconocimiento por logros deportivos alcanzados a nivel local y nacional y por la continua innovación en el desarrollo de procesos formativos y de perfeccionamiento en el fútbol. Posicionarnos como una de las mejores academias con proyección de futbolistas a clubes en la ciudad.');
                $('#Logros').html('Logros ');
                $('#Nuestro').html('Nuestro club ha logrado mantenerse en lo más alto rendimiento de los campeonatos y con el esfuerzo hemos logrado muchos trofeos y triunfos beneficiosos para el club, y esperamos seguir ganando muchas más cosas. ');
                $('#esfuerzo').html('Tu esfuerzo  <br> te hace  <br> grande.');
                $('#Contactenoss').html('Contáctenos');
                $('#Nombres').html('Nombres');
                $('#Apellido').html('Apellidos');
                $('#CorreoElectronico').html('Correo electrónico');
                $('#Telefono').html('Teléfono');
                $('#envianosmensaje').html('Envíanos un mensaje');
                $('#btn_Enviar').html('Enviar');
                $('#limpiar').html('Limpiar');
            });

        </script>


    </body>

</html>