

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error500</title>
        <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="../alertifyjs/css/alertify.min.css"/>
    </head>
    <style>
        body{
            background: url("../img/pasto9.jpg");
        }
    </style>
    <body>
        <!--        -->
        <div class="container">  
            <br>  <br>  <br> <br> <br> 
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12" >
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-8" style="">
                                <h1 id="error404" style="color: #fff; font-size: 6em; font-weight: 600;font-family: cursive;margin-right: 50px">Error 500</h1>
                                <h1 id="huyyy"style="color: #fff; font-size: 4.5em;font-family: cursive; font-weight: 500;margin-right: 50px">!Huuuuuyyyyyy¡</h1>
                                <h1 id="hasEstadoCerca"style="color: #fff; font-size: 2.7em;font-family: cursive;margin-top: 20px;margin-right: 50px">Algo ha fallado en el servidor, vuelvelo a intentar mas tarde...</h1>
                                <center>
                                    <a id="traducirIngles" style="color: #fff"class="btn btn-dark">Ing</a> 
                                    <a id="traducirEspañol" style="color: #fff"class="btn btn-dark">Esp</a> 
                                </center> 
                            </div>
                            <div class="col-md-4"><br> 
                                <img src="../img/error500.jpg" width="100%">
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>   
        <script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/sb-admin.min.js"></script>
        <script src="../alertifyjs/js/alertify.min.js"></script>
        <script>
            $('#traducirIngles').click(function () {
                alertify.success('<h5 style="color: #fff;font-size: 1.3em">Translated into english</h5>');               
                $('#huyyy').html('!oopssssssss¡');
                $('#hasEstadoCerca').html("Something failed on the server, try again later ...");
            });
            $('#traducirEspañol').click(function () {
                alertify.success('<h5 style="color: #fff;font-size: 1.3em">Traducido a español</h5>');                
                $('#huyyy').html('!Huuuuuyyyyyy¡');
                $('#hasEstadoCerca').html('Algo ha fallado en el servidor, vuelvelo a intentar mas tarde...');
            });
        </script>
    </body>
</html>
