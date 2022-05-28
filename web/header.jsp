<%-- 
    Document   : header
    Created on : 18 may. 2022, 14:23:33
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        HttpSession sesionOk = request.getSession();
        String nombre = "";
    %>
    <header>
        <div class="contenedor">
            <h1><a class="a-heredar" href="index.jsp">DiesCom</a></h1>
            <img src="Imagenes/ticket-logo.png" class="tamaño-logo"/>
            <input type="checkbox" id="menu-bar">   
            <label class="icon-menu" for="menu-bar"></label>
            <nav class="menu">
                <a href="index.jsp">Inicio</a>
                <a href="servletPro?op=listar">Servicios</a>
                <a href="nosotros.jsp">Nosotros</a>
                <a href="contacto.jsp">Contacto</a>
                <%
                    if (sesionOk.getAttribute("nombre") == null) {
                %>
                <a href="registro.jsp">Registrar</a>
                <a href="inicio.jsp">Iniciar Sesion</a>
                <%
                } else {
                    nombre = (String) sesionOk.getAttribute("nombre");
                %>
                <a href="ServletUser?op=enlaceuser">Cuenta</a>
                <div class="d-flex justify-content-center align-items-center">
                    Bienvenido
                    <%=nombre%>👤
                </div>
                <%
                    }
                %>
            </nav>
        </div>
    </header>
</html>
