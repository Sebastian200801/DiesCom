<%-- 
    Document   : index
    Created on : 9 feb. 2022, 14:42:56
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Nosotros</title>
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

        <main>
            <section id="banner">
                <img src="Imagenes/servicio-nosotros.webp">
                <div class="contenedor">
                    <div class="fondo-transparente">
                        <h2>Calidad y Excelencia en nuestros productos</h2>
                        <p>¿Por qué somos una tienda con gran calidad?</p>
                    </div>
                </div>
            </section>

            <section id="bienvenidos">
                <div class="contenedor">
                    <h2>Bienvenidos a DiesCom</h2>
                    <p>Un sistema de gestión de tickets es una herramienta tecnológica que ayuda a las empresas a administrar sus casos de soporte y de servicio al cliente. Este tipo de software permite el acceso a una cantidad ilimitada de solicitudes e incidentes de los clientes (lo que conocemos comúnmente como ticket de soporte o ticket de helpdesk) que provienen de diferentes canales, y gestionarlos a través de una única interfaz. </p>
                    <p> Contactanos y disfruta de nuestros mejores servicios.</p>
                </div>
                <div id="infe">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3902.485479438659!2d-77.08492728597716!3d-12.010061991491781!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105ce927b8ce891%3A0x59a145c783187e7d!2sFederico%20Blume%20169%2C%20Lima%2015108!5e0!3m2!1ses-419!2spe!4v1646363862867!5m2!1ses-419!2spe" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </section>
        </main>

        <jsp:include page="footer.jsp" flush="true"/>

    </body>
</html>
