<%-- 
    Document   : sesionadmin
    Created on : 10 feb. 2022, 09:05:08
    Author     : sebas
--%>

<%@page import="beans.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*" session="true"%>
<%@page import="beans.Empleado"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("nombre") != null) {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
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
    <body class="caja-bajo">
        <%-- Navbar --%>
        <header>
            <div class="contenedor">
                <h1><a class="a-heredar" href="index.jsp">DiesCom</a></h1>
                <img src="Imagenes/ticket-logo.png" class="tamaño-logo"/>
                <input type="checkbox" id="menu-bar">   
                <label class="icon-menu" for="menu-bar"></label>
                <nav class="menu">
                    <a aria-current="page" href="sesionadmin.jsp">Menu</a>
                    <a href="ServletUser?op=listarEmpleados">Empleados</a>
                    <a href="ServletUser?op=listarClientes">Clientes</a>
                    <a href="ServletUser?op=datosPersonales">Datos Personales</a>
                    <a href="ServletUser?op=cerrar">Cerrar Sesion</a>
                </nav>
            </div>
        </header>
        <%-- Lista de Empleados --%>
        <br>
        <div class="container caja">
            <%
                if (request.getAttribute("listaEmpleados") != null) {
            %>
            <h2 align="center">Listado de Empleados</h2>
            <table class="table">
                <tr class="table-dark">
                    <th>IdEm</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Edad</th>
                    <th>DNI</th>
                    <th>Password</th>
                    <th>Sueldo</th>
                    <th>IdPer</th>
                    <th></th>
                </tr>
                <%
                    ArrayList<Empleado> lista = (ArrayList<Empleado>) request.getAttribute("listaEmpleados");
                    for (int i = 0; i < lista.size(); i++) {
                        Empleado e = lista.get(i);
                %>
                <tr>
                    <td><%=e.getIdEmpleado()%></td>
                    <td><%=e.getNombre()%></td>
                    <td><%=e.getApellido()%></td>
                    <td><%=e.getEmail()%></td>
                    <td><%=e.getEdad()%></td>
                    <td><%=e.getDni()%></td>
                    <td><%=e.getPas()%></td>
                    <td><%=e.getSueldo()%></td>
                    <td><%=e.getIdPersona()%></td>
                    <td><a name="eliminarEmpleado" class="btn btn-danger" role="button" href="ServletUser?op=eliminarEmpleado&em=<%=e.getIdEmpleado()%>&per=<%=e.getIdPersona()%>">🗑️</a>
                        <a name="editarEmpleado" class="btn btn-warning" role="button" href="ServletUser?op=ventanaEditar&em=<%=e.getIdEmpleado()%>&per=<%=e.getIdPersona()%>&tipo=Empleado">✏️️</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <form action="ServletUser" method="post">
                <table class="table">
                    <tr class="table-dark">
                        <th>IdEm</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Edad</th>
                        <th>Password</th>
                        <th>Dni</th>
                        <th>Sueldo</th>
                        <th>IdPer</th>
                    </tr>
                    <tr>
                        <th></th>
                        <th><input type="text"  placeholder="Ingrese sus nombres" class="form-control" maxlength="30" name="txtNom"></th>
                        <th><input type="text"  placeholder="Ingrese sus apellidos" class="form-control" maxlength="30" name="txtApe"></th>
                        <th><input type="email"  placeholder="Ingrese su correo" class="form-control" maxlength="100" name="txtEmail"></th>
                        <th><input type="number"  placeholder="Ingrese su edad" class="form-control" max="100" name="txtEdad"></th>
                        <th><input type="password"  placeholder="**************" class="form-control" maxlength="30" name="txtCon"></th>
                        <th><input type="number"  placeholder="Ingrese su dni" class="form-control" maxlength="8" name="txtDni"></th>
                        <th><input type="number"  placeholder="Ingrese su sueldo" class="form-control" max="3000" name="txtSueldo"></th>
                        <th></th>
                    </tr>
                </table>
                <div class="container" align="center">
                    <input type="submit" class="btn btn-success" value="Agregar">
                    <input type="reset" class="btn btn-danger" value="Borrar">
                </div>
                <input type="hidden" name="op" value="crearEmpleado">
            </form>
        </div>
        <%-- Lista de Clientes --%>
        <div class="container caja caja-bajo">
            <%
                }
                if (request.getAttribute("listaClientes") != null) {
            %>
            <h2 align="center">Listado de Usuarios</h2>
            <table class="table">
                <tr class="table-dark">
                    <th>IdUs</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Edad</th>
                    <th>Direccion</th>
                    <th>IdPer</th>
                    <th></th>
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
        </div>
        <%-- Datos Personales --%>
        <div class="container caja caja-bajo">
            <%
                }
                if (request.getAttribute("datosPerfil") != null) {
                    ArrayList<Administrador> lista = (ArrayList<Administrador>) request.getAttribute("datosPerfil");
                    for (int i = 0; i < lista.size(); i++) {
                        Administrador a = lista.get(i);
            %>
            <h2 align="center">Datos Personales</h2>
            <table class="table" align="center">
                <tr>
                    <th>IdAd</th>
                    <td><%=a.getIdAdm()%></td>
                </tr>
                <tr>
                    <th>Nombre</th>
                    <td><%=a.getNombre()%></td>
                </tr>
                <tr>
                    <th>Apellido</th>
                    <td><%=a.getApellido()%></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%=a.getEmail()%></td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td><%=a.getPas()%></td>
                </tr>
                <tr>
                    <th>Edad</th>
                    <td><%=a.getEdad()%></td>
                </tr>
                <tr>
                    <th>Dni</th>
                    <td><%=a.getDni()%></td>
                </tr>
                <tr>
                    <th>Sueldo</th>
                    <td><%=a.getSueldo()%></td>
                </tr>
                <tr>
                    <th>IdEm</th>
                    <td><%=a.getIdEmpleado()%></td>
                </tr>
                <tr>
                    <th>IdPer</th>
                    <td><%=a.getIdPersona()%></td>
                </tr>
                <tr>
                    <td colspan="2"><div class="d-flex justify-content-center align-items-center"><a name="editarPerfil" class="btn btn-warning" role="button" href="ServletUser?op=ventanaEditar&tipo=Perfil&em=<%=a.getIdEmpleado()%>&per=<%=a.getIdPersona()%>&ad=<%=a.getIdAdm()%>">✏️️</a></div></td>
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
        <%-- Ventana Edicion de Empleados --%>
        <%
            if (request.getAttribute("listaCodigosEmpleados") != null) {
                String[] codigos = (String[]) request.getAttribute("listaCodigosEmpleados");
        %>
        <div class="modal" tabindex="-1" id="editarEmpleadoVentana">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Empleado</h5>
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
                                    <th><input type="number"  placeholder="Ingrese su dni" class="form-control" maxlength="8" name="txtDni"></th>
                                </tr>
                                <tr>
                                    <th>Sueldo</th>
                                    <th><input type="number"  placeholder="Ingrese su sueldo" class="form-control" max="3000" name="txtSueldo"></th>
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
                            <input type="hidden" name="op" value="editarEmpleado">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
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
                                    <th>IdAd</th>
                                    <th><input type="text" value="<%=codigos[2]%>" class="form-control" maxlength="30" name="txtCodAd"></th>
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
                                    <th>IdPer</th>
                                    <th><input type="text" value="<%=codigos[0]%>" class="form-control" maxlength="30" name="txtCodPer"></th>
                                </tr>
                                <tr>
                                    <th>IdEm</th>
                                    <th><input type="text" value="<%=codigos[1]%>" class="form-control" maxlength="30" name="txtCodEm"></th>
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
        <jsp:include page="page/footer.jsp"/>
    </body>
</html>
<%
    } else {
        request.setAttribute("msg", "Se cerro la sesion");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
