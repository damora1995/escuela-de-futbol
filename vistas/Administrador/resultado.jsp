<%-- 
    Document   : resultado
    Created on : 8/09/2019, 05:03:11 PM
    Author     : Fernando
--%>

<%@page import="Modelo.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RESULTADO CORREO ELECTRONICO</title>
    </head>
    <body>

        <%

            Email email = new Email();

            String de = request.getParameter("de");
            String clave = request.getParameter("clave");
            String para = request.getParameter("para");
            String mensaje = request.getParameter("mensaje");
            String asunto = request.getParameter("asunto");

            /* 
                
                String[] direcciones = {"correo numero 1","correo numero 2","correo numero 3","correo ..."}
                boolean resultado = email.enviarCorreo(de, clave, direcciones, mensaje, asunto);
            
             */
            boolean resultado = email.enviarCorreo(de, clave, para, mensaje, asunto);

            if (resultado) {
                out.print("1");
            } else {
                out.print("0");
            }

        %>

    </body>
</html>