<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <title>Contacto</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no,initial-scale=1.0, maximum-scale=1, minimun-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="icon" href="Imagenes/ticket-logo.ico" type="image/x-icon">
    </head>
    <body>
        <%
            HttpSession sesionOk = request.getSession();
            String nombre = "";
        %>

        <jsp:include page="header.jsp" flush="true"/>

        <main id="contacto">
            <table class="table-contacto" align="center">
                <td width="100%" align="center">
                    <br>
                    <form class="form-contacto" action="ServletEnviar" method="POST">
                        <h2>CONTACTO</h2>
                        <h3>Bienvenido al area de contacto de la empresa DiesCom, acá puedes dejar todas tus dudas y consultas, seran respondidas a la brevedad.</h3>
                        <h3>Gracias por su visita</h3>
                        <input type="text" name="Nombre" placeholder="Nombre" class="form-text">
                        <input type="text" name="Correo" placeholder="Correo" class="form-text">
                        <input type="text" name="Telefono" placeholder="Telefono" class="form-text">
                        <textarea name="Mensaje" placeholder="Escriba aqui su mensaje" class="form-text form-text2"></textarea>
                        <input  type="button" value="ENVIAR" id="boton" class="form-text">
                    </form>
                </td>
            </table>
        </main>
        <%
        %>

        <jsp:include page="footer.jsp" flush="true"/>

    </body>
</html>
