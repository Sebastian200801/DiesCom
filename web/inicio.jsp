<%-- 
    Document   : inicio.jsp
    Created on : 9 feb. 2022, 12:37:37
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="icon" href="Imagenes/ticket-logo.ico" type="image/x-icon">
    </head>
    <body>
        <%-- Navbar --%>
        <header>
            <div class="contenedor">
                <h1><a class="a-heredar" href="index.jsp">DiesCom</a></h1>
                <img src="Imagenes/ticket-logo.png" class="tamaño-logo"/>
            </div>
        </header>
        <%-- Iniciar Sesion --%>
        <main>
            <section class="separacion-inicio fondo-sesion">
                <div class="container fondo-sdifuminado">
                    <h2 align="center">Iniciar Sesion</h2>
                    <table class="table-contacto"  align="center">
                        <td>
                            <form action="ServletUser" method="post">
                                <div class="mb-3">
                                    <label for="txtCorreo" class="form-label">Correo:</label>
                                    <input type="email" id="txtCorreo" name="txtCorreo" class="form-control" placeholder="Ingrese su correo" maxlength="100">
                                </div>
                                <div class="mb-3">
                                    <label for="txtPas" class="form-label">Contraseña:</label>
                                    <input type="password" id="txtPas" name="txtPas" class="form-control" placeholder="***************" maxlength="30">
                                </div>
                                <div class="mb-3">
                                    <p  align="center">
                                        <input type="submit" value="Iniciar" class="btn btn-success">
                                        <input type="reset" value="Borrar" class="btn btn-danger">
                                    </p>
                                </div>
                                <h6 align="center">¿No esta Registrado?<a href="registro.jsp"> ¡Registrate!</a></h6>
                                <%
                                    if (request.getAttribute("msg") != null) {
                                        String msg = request.getAttribute("msg").toString();
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <%=msg%>
                                </div>
                                <%
                                    }
                                %>
                                <input type="hidden" name="op" value="iniciar">
                            </form>
                        </td>
                    </table>
                </div>
            </section>
        </main>

        <jsp:include page="footer.jsp" flush="true"/>

    </body>
</html>