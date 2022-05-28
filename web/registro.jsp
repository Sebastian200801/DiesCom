<%-- 
    Document   : registro
    Created on : 9 feb. 2022, 12:37:48
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
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
        <%-- Registrar --%>
        <main class="separacion-inicio fondo-sesion">
            <div class="container fondo-sdifuminado">
                <h2 align="center">Registrar</h2>
                <table class="table-contacto" align="center">
                    <td>
                        <form action="ServletUser" method="post">
                            <div class="mb-3">
                                <label for="txtCorreo" class="form-label">Nombres:</label>
                                <input type="text"  placeholder="Ingrese sus nombres" class="form-control" maxlength="30" name="txtNom">
                            </div>
                            <div class="mb-3">
                                <label for="txtCorreo" class="form-label">Apellidos:</label>
                                <input type="text"  placeholder="Ingrese sus apellidos" class="form-control" maxlength="30" name="txtApe">
                            </div>
                            <div class="mb-3">
                                <label for="txtCorreo" class="form-label">Edad:</label>
                                <input type="number"  placeholder="Ingrese su edad" class="form-control" max="100" name="txtEdad">
                            </div>
                            <div class="mb-3">
                                <label for="txtCorreo" class="form-label">Email:</label>
                                <input type="email"  placeholder="Ingrese su correo" class="form-control" maxlength="100" name="txtEmail">
                            </div>
                            <div class="mb-3">
                                <label for="txtCorreo" class="form-label">Dirección:</label>
                                <input type="text"  placeholder="Ingrese su dirección" class="form-control" maxlength="100" name="txtDir">
                            </div>
                            <div class="mb-3">
                                <label for="txtCorreo" class="form-label">Contraseña:</label>
                                <input type="password"  placeholder="**************" class="form-control" maxlength="30" name="txtCon">
                            </div>
                            <div class="mb-3">
                                <p  align="center">
                                <input type="submit" value="Resgitrase" class="btn btn-success">
                                <input type="reset" value="Borrar" class="btn btn-danger">
                                </p>
                            </div>
                            <h6 align="center">¿Ya esta Registrado?<a href="inicio.jsp"> ¡Inicia Sesión!</a></h6>
                            <div class="mb-3">
                                <input type="hidden" name="op" value="registro">
                            </div>
                        </form>
                    </td>
                </table>
            </div>
        </main>

        <jsp:include page="footer.jsp" flush="true"/>

    </body>
</html>
