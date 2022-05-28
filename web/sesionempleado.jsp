<%-- 
    Document   : sesion
    Created on : 9 feb. 2022, 14:43:45
    Author     : sebas
--%>

<%@page import="beans.Solicitud"%>
<%@page import="beans.Empleado"%>
<%@page import="beans.Administrador"%>
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
        <title>Empleado</title>
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
        <%-- Navbar --%>
        <header>
            <div class="contenedor">
                <h1><a class="a-heredar" href="index.jsp">DiesCom</a></h1>
                <img src="Imagenes/ticket-logo.png" class="tamaño-logo"/>
                <input type="checkbox" id="menu-bar">   
                <label class="icon-menu" for="menu-bar"></label>
                <nav class="menu">
                    <a aria-current="page" href="sesionempleado.jsp">Menu</a>
                    <a href="ServletUser?op=listarSolicitudesClientes">Solicitudes de Clientes</a>
                    <a href="ServletUser?op=listarClientes">Clientes</a>
                    <a href="ServletUser?op=datosPersonales">Datos Personales</a>
                    <a href="ServletUser?op=cerrar">Cerrar Sesion</a>
                </nav>
            </div>
        </header>
        <br>

        <%-- Lista de Solicitudes --%>
        <div class="container caja">
            <%
                if (request.getAttribute("listarSolicitudesClientes") != null) {
            %>
            <h2 align="center">Listado de Solicitudes de los Clientes</h2>
            <table class="table">
                <tr>
                    <th>IdSo</th>
                    <th>Motivo</th>
                    <th>Detalle</th>
                    <th>Estado</th>
                    <th>IdPe</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Solucion</th>
                    <th>Calificacion</th>
                </tr>
                <%
                    ArrayList<Solicitud> lista = (ArrayList<Solicitud>) request.getAttribute("listarSolicitudesClientes");
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
                    <td><a name="solucionarProblema" class="btn btn-success" role="button" href="ServletUser?op=verSolicitudCliente&sol=<%=s.getIdSolicitud()%>">Solucionar️</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                }
            %>    
        </div>

        <%-- Lista de Clientes --%>
        <div class="container caja">
            <%
                if (request.getAttribute("listaClientes") != null) {
            %>
            <h2 align="center">Listado de Usuarios</h2>
            <table class="table">
                <tr>
                    <th>IdUs</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Edad</th>
                    <th>Direccion</th>
                    <th>IdPer</th>
                </tr>
                <%
                    ArrayList<Usuario> lista = (ArrayList<Usuario>) request.getAttribute("listaClientes");
                    for (int i = 0; i < lista.size(); i++) {
                        Usuario u = lista.get(i);
                %>
                <tr>
                    <td><%=u.getIdUsuario()%></td>
                    <td><%=u.getNombre()%></td>
                    <td><%=u.getApellido()%></td>
                    <td><%=u.getEmail()%></td>
                    <td><%=u.getPas()%></td>
                    <td><%=u.getEdad()%></td>
                    <td><%=u.getDireccion()%></td>
                    <td><%=u.getIdPersona()%></td>
                    <td><a name="eliminarCliente" class="btn btn-danger" role="button" href="ServletUser?op=eliminarCliente&cli=<%=u.getIdUsuario()%>&per=<%=u.getIdPersona()%>">🗑️</a>
                        <a name="editarCliente" class="btn btn-warning" role="button" href="ServletUser?op=ventanaEditar&us=<%=u.getIdUsuario()%>&per=<%=u.getIdPersona()%>&tipo=Cliente">✏️️</a></td>
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
                    ArrayList<Empleado> lista = (ArrayList<Empleado>) request.getAttribute("datosPerfil");
                    for (int i = 0; i < lista.size(); i++) {
                        Empleado e = lista.get(i);
            %>
            <h2 align="center">Datos Personales</h2>
            <table class="table" align="center">
                <tr>
                    <th>IdEm</th>
                    <td><%=e.getIdEmpleado()%></td>
                </tr>
                <tr>
                    <th>Nombre</th>
                    <td><%=e.getNombre()%></td>
                </tr>
                <tr>
                    <th>Apellido</th>
                    <td><%=e.getApellido()%></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%=e.getEmail()%></td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td><%=e.getPas()%></td>
                </tr>
                <tr>
                    <th>Edad</th>
                    <td><%=e.getEdad()%></td>
                </tr>
                <tr>
                    <th>Dni</th>
                    <td><%=e.getDni()%></td>
                </tr>
                <tr>
                    <th>Sueldo</th>
                    <td><%=e.getSueldo()%></td>
                </tr>
                <tr>
                    <th>IdPer</th>
                    <td><%=e.getIdPersona()%></td>
                </tr>
                <tr>
                    <td colspan="2"><div class="d-flex justify-content-center align-items-center"><a name="editarPerfil" class="btn btn-warning" role="button" href="ServletUser?op=ventanaEditar&tipo=Perfil&em=<%=e.getIdEmpleado()%>&per=<%=e.getIdPersona()%>">✏️️</a></div></td>
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
        <%-- Ventana Edicion de Clientes --%>
        <%
            if (request.getAttribute("listaCodigosUsuarios") != null) {
                String[] codigos = (String[]) request.getAttribute("listaCodigosUsuarios");
        %>
        <div class="modal" tabindex="-1" id="editarEmpleadoVentana">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="cerrar()"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ServletUser" method="post">
                            <table class="table">
                                <tr>
                                    <th>IdUs</th>
                                    <th><input type="text" value="<%=codigos[1]%>" class="form-control" maxlength="30" name="txtCodEm"></th>
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
                                <tr>
                                    <th>IdPer</th>
                                    <th><input type="text" value="<%=codigos[0]%>" class="form-control" maxlength="30" name="txtCodPer"></th>
                                </tr>
                            </table>
                            <div class="container" align="center">
                                <input type="submit" class="btn btn-warning" value="Guardar">
                                <input type="reset" class="btn btn-danger" value="Borrar">
                            </div>
                            <input type="hidden" name="op" value="editarCliente">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
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
                                    <th>IdEm</th>
                                    <th><input type="text" value="<%=codigos[1]%>" class="form-control" maxlength="30" name="txtCodEm"></th>
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
                                    <th>Dni</th>
                                    <th><input type="number"  placeholder="Ingrese su direccion" class="form-control" maxlength="8" name="txtDni"></th>
                                </tr>
                                <tr>
                                    <th>Sueldo</th>
                                    <th><input type="number"  placeholder="Ingrese su sueldo" class="form-control" max="3000" name="txtSueldo"></th>
                                </tr>
                                <tr>
                                    <th>Tarjeta</th>
                                    <th><input type="number"  placeholder="Ingrese su tarjeta" class="form-control" max="3000" name="txtTarjeta"></th>
                                </tr>
                                <tr>
                                    <th>IdPer</th>
                                    <th><input type="text" value="<%=codigos[0]%>" class="form-control" maxlength="30" name="txtCodPer"></th>
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
            if (request.getAttribute("verSolicitudCliente") != null) {
                ArrayList<Solicitud> lista = (ArrayList<Solicitud>) request.getAttribute("verSolicitudCliente");
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
                                    <th><textarea name="txtSo" placeholder="Ingrese solucion" class="form-control" maxlength="255" type="text"></textarea></th>
                                </tr>
                                <tr align="center">
                                    <th align="center">
                                        <input type="submit" class="btn btn-success" value="Enviar Solucion">
                                    </th>
                                    <th><input type="reset" value="Borrar" class="btn btn-danger"></th>
                                </tr>
                                <tr> 
                                    <th><input type="hidden" name="txtCodSo" value="<%=s.getIdSolicitud()%>"></th>
                                    <th><input type="hidden" name="op" value="enviarSolucion"></th>
                                </tr>  
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

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <jsp:include page="page/footer.jsp"/>
    </body>
</html>
<%
    } else {
        request.setAttribute("msg", "Se cerro la sesion");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

