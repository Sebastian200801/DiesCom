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
        <title>DiesCom</title>
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
                <img src="Imagenes/principal.jpg">
                <div class="contenedor">
                    <div class="fondo-transparente">
                        <h2>Calidad y Excelencia en nuestros servicios</h2>
                        <p>¿Por qué tenemos un Sistema de tickets con gran calidad?</p>
                        <a href="nosotros.jsp">Leer más</a>
                    </div>
                </div>
            </section>

            <section id="bienvenidos">
                <div class="contenedor">
                    <h2>Bienvenidos a DiesCom</h2>
                    <p>Bienvenidos a DiesCom, empresa dedicado a brindar servicios de ticket a todas las pequeñas, medianas y grandes empresas que buscan maximizan su proceso de atención a los clientes atravez de un sistema organizado, estructurado y completo para facilitar tanto a los trabajadores para su gestión como a los clientes que les será sencillo su manipulación.</p>
                </div>
            </section>

            <section id="blog">
                <h3>Nuestro sistema brinda lo siguiente:</h3>
                <div class="contenedor">
                    <article>
                        <img src="Imagenes/calidad.jpg">
                        <h4>Calidad de Servicios</h4>
                    </article>
                    <article>
                        <img src="Imagenes/esquema.png">
                        <h4>Estructura Organizacional</h4>
                    </article>   
                    <article>
                        <img src="Imagenes/usuario.png">
                        <h4>Atención al Usuario</h4>
                    </article>   

                </div>
            </section>

            <section id="infe"> 
                <h3 align="center">Beneficios de nuestros servicios</h3>
                <div class="contenedor">  
                    <article>
                        <img src="Imagenes/problemas.jpg">
                        <h4>Solucion de problemas</h4>
                        <a href="servletPro?op=listar">Ver más</a>
                    </article>
                    <article>
                        <img src="Imagenes/crecimiento.jpg">
                        <h4>Crecimiento y logro de objetivos</h4>
                        <a href="servletPro?op=listar">Ver más</a>

                    </article>
                    <article>
                        <img src="Imagenes/TI.jpg">
                        <h4>Mejor uso de los datos</h4>
                        <a href="servletPro?op=listar">Ver más</a>
                    </article>
                </div>
            </section>

        </main>

        <jsp:include page="footer.jsp" flush="true"/>

    </body>
</html>
