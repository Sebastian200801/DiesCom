<%-- 
    Document   : sesion
    Created on : 9 feb. 2022, 14:43:45
    Author     : sebas
--%>

<%@page import="beans.Solicitud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("nombre") != null) {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="icon" href="Imagenes/ticket-logo.ico" type="image/x-icon">
        <style>
            #editarEmpleadoVentana{
                display: block;
            }
        </style>
        <script type="text/javascript">
            function editar(x, y) {
                document.getElementById('editarEmpleadoVentana').style.display = 'block';
                edicioncodper = x;
                edicioncodem = y;
            }
            function cerrar() {
                document.getElementById('editarEmpleadoVentana').style.display = 'none';
            }
        </script>
    </head>
    <body>
        <header>
            <div class="contenedor">
                <h1><a class="a-heredar" href="index.jsp">DiesCom</a></h1>
                <img src="Imagenes/ticket-logo.png" class="tamaño-logo"/>
                <input type="checkbox" id="menu-bar">   
                <label class="icon-menu" for="menu-bar"></label>
                <nav class="menu">
                    <a aria-current="page" href="ServletUser?op=formularioSolicitud">Menu</a>
                    <a aria-current="page" href="ServletUser?op=listaSolicitudesPersonales">Solicitudes Realizadas</a>
                    <a href="ServletUser?op=datosPersonales">Datos Personales</a>
                    <a href="ServletUser?op=cerrar">Cerrar Sesion</a>
                </nav>
            </div>
        </header>
        <br>
        <main>
            <%-- FORMULARIO SOLICITUD --%>

            <%
                if (request.getAttribute("formularioSolicitud") != null) {
            %>
            <section class="fondo-solicitud">
                <div class="container caja fondo-sdifuminado">
                    <h2 align="center">Enviar Solicitud</h2>
                    <table class="table" align="center">
                        <td>
                            <form action="ServletUser" method="post">
                                <div class="mb-3">
                                    <label for="txtMo" class="form-label">Motivo</label>
                                    <input type="text"  placeholder="Ingrese su motivo" class="form-control" maxlength="30" name="txtMo">
                                </div>
                                <div class="mb-3">
                                    <label for="txtDe" class="form-label">Detalle:</label>
                                    <textarea name="txtDe" placeholder="Ingrese el detalle" class="form-control" maxlength="255" type="text"></textarea>
                                </div>                        
                                <div class="mb-3">
                                    <p align="center">
                                        <input type="submit" value="Enviar" class="btn btn-success">
                                        <input type="reset" value="Borrar" class="btn btn-danger">
                                    </p>
                                </div>
                                <div class="mb-3">
                                    <input type="hidden" name="op" value="enviarSolicitud">
                                </div>
                            </form>
                        </td>
                    </table>
                </div>
            </section>
            <%
                }
                if (request.getAttribute("msg") != null) {
                    String msg = request.getAttribute("msg").toString();
            %>
            <div class="alert alert-danger" role="alert">
                <%=msg%>
            </div>

            <%
                }
            %>

            <%-- Lista de Solicitudes --%>
            <div class="container caja">
                <%
                    if (request.getAttribute("listaSolicitudesPersonales") != null) {
                %>
                <h2 align="center">Listado de Solicitudes Personales</h2>
                <table class="table">
                    <tr>
                        <th>IdSo</th>
                        <th>Motivo</th>
                        <th>Detalle</th>
                        <th>Estado</th>
                        <th>IdEm</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Solucion</th>
                        <th>Calificacion</th>
                    </tr>
                    <%
                        ArrayList<Solicitud> lista = (ArrayList<Solicitud>) request.getAttribute("listaSolicitudesPersonales");
                        for (int i = 0; i < lista.size(); i++) {
                            Solicitud s = lista.get(i);
                    %>
                    <tr>
                        <td><%=s.getIdSolicitud()%></td>
                        <td><%=s.getMotivo()%></td>
                        <td><%=s.getDetalle()%></td>
                        <td><%=s.getEstado()%></td>
                        <td><%=s.getIdCodigo()%></td>
                        <td><%=s.getNombre()%></td>
                        <td><%=s.getApellido()%></td>
                        <td><%=s.getSolucion()%></td>
                        <td><%=s.getCalificacion()%></td>
                        <td><a name="verSolicitud" class="btn btn-success" role="button" href="ServletUser?op=verSolicitud&sol=<%=s.getIdSolicitud()%>">Ver️</a></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <%
                    }
                %>    
            </div>

            <%-- Datos Personales --%>
            <div class="container caja">
                <%
                    if (request.getAttribute("datosPerfil") != null) {
                        ArrayList<Usuario> lista = (ArrayList<Usuario>) request.getAttribute("datosPerfil");
                        for (int i = 0; i < lista.size(); i++) {
                            Usuario u = lista.get(i);
                %>
                <h2 align="center">Datos Personales</h2>
                <table class="table" align="center">
                    <tr>
                        <th>IdPer</th>
                        <td><%=u.getIdPersona()%></td>
                    </tr>
                    <tr>
                        <th>Nombre</th>
                        <td><%=u.getNombre()%></td>
                    </tr>
                    <tr>
                        <th>Apellido</th>
                        <td><%=u.getApellido()%></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><%=u.getEmail()%></td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td><%=u.getPas()%></td>
                    </tr>
                    <tr>
                        <th>Edad</th>
                        <td><%=u.getEdad()%></td>
                    </tr>
                    <tr>
                        <th>Direccion</th>
                        <td><%=u.getDireccion()%></td>
                    </tr>
                    <tr>
                        <th>N° de Tarjeta</th>
                        <td><%=u.getNtarjeta()%></td>
                    </tr>
                    <tr>
                        <th>IsUs</th>
                        <td><%=u.getIdUsuario()%></td>
                    </tr>
                    <tr>
                        <td colspan="2"><div class="d-flex justify-content-center align-items-center"><a name="editarPerfil" class="btn btn-warning" role="button" href="ServletUser?op=ventanaEditar&tipo=Perfil&per=<%=u.getIdPersona()%>">✏️️</a></div></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <%
                    }
                    if (request.getAttribute("msg") != null) {
                        String msg = request.getAttribute("msg").toString();
                %>
                <div class="alert alert-danger" role="alert">
                    <%=msg%>
                </div>
                <%
                    }
                %>
            </div>
            <%-- Ventana Edicion Datos Personales --%>
            <%
                if (request.getAttribute("listaCodigosPerfil") != null) {
                    String[] codigos = (String[]) request.getAttribute("listaCodigosPerfil");
            %>
            <div class="modal" tabindex="-1" id="editarEmpleadoVentana">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Editar Perfil</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="cerrar()"></button>
                        </div>
                        <div class="modal-body">
                            <form action="ServletUser" method="post">
                                <table class="table">
                                    <tr>
                                        <th>IdPer</th>
                                        <th><input type="text" value="<%=codigos[0]%>" class="form-control" maxlength="30" name="txtCodPer"></th>
                                    </tr>
                                    <tr>
                                        <th>Nombre</th>
                                        <th><input type="text"  placeholder="Ingrese sus nombres" class="form-control" maxlength="30" name="txtNom"></th>
                                    </tr>
                                    <tr>
                                        <th>Apellido</th>
                                        <th><input type="text"  placeholder="Ingrese sus apellidos" class="form-control" maxlength="30" name="txtApe"></th>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <th><input type="email"  placeholder="Ingrese su correo" class="form-control" maxlength="100" name="txtEmail"></th>
                                    </tr>
                                    <tr>
                                        <th>Edad</th>
                                        <th><input type="number"  placeholder="Ingrese su edad" class="form-control" max="100" name="txtEdad"></th>
                                    </tr>
                                    <tr>
                                        <th>Password</th>
                                        <th><input type="password"  placeholder="**************" class="form-control" maxlength="30" name="txtCon"></th>
                                    </tr>
                                    <tr>
                                        <th>Direccion</th>
                                        <th><input type="number"  placeholder="Ingrese su direccion" class="form-control" maxlength="8" name="txtDireccion"></th>
                                    </tr>
                                    <tr>
                                        <th>Tarjeta</th>
                                        <th><input type="number"  placeholder="Ingrese su tarjeta" class="form-control" max="3000" name="txtTarjeta"></th>
                                    </tr>
                                </table>
                                <div class="container" align="center">
                                    <input type="submit" class="btn btn-warning" value="Guardar">
                                    <input type="reset" class="btn btn-danger" value="Borrar">
                                </div>
                                <input type="hidden" name="op" value="editarDatosPersonales">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>

            <%-- Ventana Ver Solicitud --%>
            <%
                if (request.getAttribute("verSolicitud") != null) {
                    ArrayList<Solicitud> lista = (ArrayList<Solicitud>) request.getAttribute("verSolicitud");
                    for (int i = 0; i < lista.size(); i++) {
                        Solicitud s = lista.get(i);
            %>
            <div class="modal" tabindex="-1" id="editarEmpleadoVentana">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Solicitud</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="cerrar()"></button>
                        </div>
                        <div class="modal-body">
                            <form action="ServletUser" method="post">
                                <table class="table">
                                    <tr>
                                        <th>IdSol</th>
                                        <th><%=s.getIdSolicitud()%></th>
                                    </tr>
                                    <tr>
                                        <th>Motivo:</th>
                                        <th><%=s.getMotivo()%></th>
                                    </tr>
                                    <tr>
                                        <th>Detalle:</th>
                                        <th><%=s.getDetalle()%></th>
                                    </tr>
                                    <tr>
                                        <th>Solucion:</th>
                                        <th><%=s.getSolucion()%></th>
                                    </tr>
                                    <tr align="center">
                                        <th align="center">
                                            <input type="number" placeholder="puntuación" class="form-control" min="0" max="10" name="txtCalificacion">
                                        </th>
                                        <th align="center">
                                            <input type="submit" class="btn btn-success" value="Enviar Calificacion">
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="hidden" name="txtCodSo" value="<%=s.getIdSolicitud()%>"></th>
                                        <th><input type="hidden" name="op" value="enviarCalificacion"></th>
                                    </tr>
                                    <% } %>
                                </table>
                                <%
                                    }
                                    if (request.getAttribute("msg") != null) {
                                        String msg = request.getAttribute("msg").toString();
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <%=msg%>
                                </div>


                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </main>
        <jsp:include page="page/footer.jsp"/>
    </body>
</html>
<%
    } else {
        request.setAttribute("msg", "Se cerro la sesion");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
