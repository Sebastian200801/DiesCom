package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import beans.*;
import utils.ConexionDB;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import utils.Actualizar;
import utils.Ids;
import utils.Listas;
import utils.Sesion;

/**
 *
 * @author sebas
 */
@WebServlet(name = "ServletUser", urlPatterns = {"/ServletUser"})
public class ServletUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String op = request.getParameter("op");

        //Elegir accion
        if (op.equals("listarEmpleados")) {
            try {
                //Mandar llamar metodo listar empleados
                ArrayList<Empleado> lista = Listas.listarEmpleados();
                request.setAttribute("listaEmpleados", lista);
                request.getRequestDispatcher("sesionadmin.jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("listarClientes")) {
            try {
                //Llamar metodo listar clientes
                ArrayList<Usuario> lista = Listas.listarClientes();
                //Enviar lista
                request.setAttribute("listaClientes", lista);
                HttpSession sesionOk = request.getSession();
                String tipo = (String) sesionOk.getAttribute("tipo");
                if (tipo.equals("admin") || tipo.equals("empleado")) {
                    request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
                }
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminarEmpleado")) {
            String empleado = request.getParameter("em");
            String persona = request.getParameter("per");
            try {
                Actualizar.eliminarEmpleado(empleado, persona);
                HttpSession sesionOk = request.getSession();
                String tipo = (String) sesionOk.getAttribute("tipo");
                //Llamar metodo listar Empleado
                ArrayList<Empleado> lista = Listas.listarEmpleados();
                //Dirigir
                request.setAttribute("listaEmpleados", lista);
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
                HttpSession sesionOk = request.getSession();
                String tipo = (String) sesionOk.getAttribute("tipo");
                request.setAttribute("msg", "No se pudo eliminar");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            }
        } else if (op.equals("eliminarCliente")) {
            String empleado = request.getParameter("cli");
            String persona = request.getParameter("per");
            HttpSession sesionOk = request.getSession();
            try {
                //Llamar metodo eliminar cliente
                Actualizar.eliminarCliente(empleado, persona);
                String tipo = (String) sesionOk.getAttribute("tipo");
                //Llamar metodo listar clientes
                ArrayList<Usuario> lista = Listas.listarClientes();
                //Enviar lista
                request.setAttribute("listaClientes", lista);
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
                String tipo = (String) sesionOk.getAttribute("tipo");
                //Llamar metodo listar clientes
                ArrayList<Usuario> lista = Listas.listarClientes();
                //Enviar lista
                request.setAttribute("listaClientes", lista);
                request.setAttribute("msg", "No se pudo eliminar");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            }
        } else if (op.equals("datosPersonales")) {
            HttpSession sesionOk = request.getSession();
            try {
                String tipo = (String) sesionOk.getAttribute("tipo");
                String codigo = (String) sesionOk.getAttribute("codigo");
                if (tipo.equals("admin")) {
                    //Llamar metodo datos personales
                    ArrayList<Administrador> lista = Listas.datosPersonalesAdmin(codigo);
                    //Enviar lista
                    request.setAttribute("datosPerfil", lista);
                } else if (tipo.equals("empleado")) {
                    //Llamar metodo datos personales
                    ArrayList<Empleado> lista = Listas.datosPersonalesEmpleado(codigo);
                    //Enviar lista
                    request.setAttribute("datosPerfil", lista);
                } else if (tipo.equals("usuario")) {
                    //Llamar metodo datos personales
                    ArrayList<Usuario> lista = Listas.datosPersonalesCliente(codigo);
                    //Enviar lista
                    request.setAttribute("datosPerfil", lista);
                }
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
                String tipo = (String) sesionOk.getAttribute("tipo");
                request.setAttribute("msg", "No se pudo obtner lista");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            }
        } else if (op.equals("formularioSolicitud")) {
            HttpSession sesionOk = request.getSession();
            try {
                String tipo = (String) sesionOk.getAttribute("tipo");
                String codigo = (String) sesionOk.getAttribute("codigo");

                request.setAttribute("formularioSolicitud", "permitido");

                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
                String tipo = (String) sesionOk.getAttribute("tipo");
                request.setAttribute("msg", "No se pudo obtner formulario");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            }
        } else if (op.equals("listaSolicitudesPersonales")) {
            HttpSession sesionOk = request.getSession();
            try {
                String codigo = (String) sesionOk.getAttribute("codigo");
                //Llamar metodo listar clientes
                ArrayList<Solicitud> lista = Listas.listaSolicitudesPersonales(codigo);
                //Enviar lista
                request.setAttribute("listaSolicitudesPersonales", lista);
                String tipo = (String) sesionOk.getAttribute("tipo");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);

            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("listarSolicitudesClientes")) {
            HttpSession sesionOk = request.getSession();
            try {
                //Llamar metodo listar clientes
                ArrayList<Solicitud> lista = Listas.listarSolicitudesClientes();
                //Enviar lista
                request.setAttribute("listarSolicitudesClientes", lista);
                String tipo = (String) sesionOk.getAttribute("tipo");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);

            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("ventanaEditar")) {
            String tipo = request.getParameter("tipo");
            HttpSession sesionOk = request.getSession();
            if (tipo.equals("Empleado")) {
                String codigoPersona = request.getParameter("per");
                String codigoEmpleado = request.getParameter("em");
                String[] codigos = {codigoPersona, codigoEmpleado};
                //Llamar metodo listar Empleado
                try {
                    ArrayList<Empleado> lista = Listas.listarEmpleados();
                    //Dirigir
                    request.setAttribute("listaEmpleados", lista);
                    request.setAttribute("listaCodigosEmpleados", codigos);
                    request.getRequestDispatcher("sesionadmin.jsp").forward(request, response);
                } catch (IOException | ServletException e) {
                    System.out.println("Error: " + e);
                }
            } else if (tipo.equals("Cliente")) {
                String codigoPersona = request.getParameter("per");
                String codigoUsuario = request.getParameter("us");
                String[] codigos = {codigoPersona, codigoUsuario};
                //Llamar metodo listar Empleado
                try {
                    ArrayList<Usuario> lista = Listas.listarClientes();
                    //Dirigir
                    request.setAttribute("listaClientes", lista);
                    request.setAttribute("listaCodigosUsuarios", codigos);
                    request.getRequestDispatcher("sesion" + (String) sesionOk.getAttribute("tipo") + ".jsp").forward(request, response);
                } catch (IOException | ServletException e) {
                    System.out.println("Error: " + e);
                }
            } else if (tipo.equals("Perfil")) {
                String codigoPersona = request.getParameter("per");
                String codigoEmpleado = request.getParameter("em");
                String codigoAdm = request.getParameter("ad");
                String tiposesion = (String) sesionOk.getAttribute("tipo");
                String[] codigos = {codigoPersona, codigoEmpleado, codigoAdm};
                if (tiposesion.equals("admin")) {
                    try {
                        //Llamar metodo listar Empleado
                        ArrayList<Administrador> lista = Listas.datosPersonalesAdmin(codigoPersona);
                        //Dirigir
                        request.setAttribute("datosPerfil", lista);
                        request.setAttribute("listaCodigosPerfil", codigos);
                        request.getRequestDispatcher("sesion" + (tiposesion) + ".jsp").forward(request, response);
                    } catch (IOException | ServletException e) {
                        System.out.println("Error: " + e);
                    }
                } else if (tiposesion.equals("empleado")) {
                    try {
                        //Llamar metodo listar Empleado
                        ArrayList<Empleado> lista = Listas.datosPersonalesEmpleado(codigoPersona);
                        //Dirigir
                        request.setAttribute("datosPerfil", lista);
                        request.setAttribute("listaCodigosPerfil", codigos);
                        request.getRequestDispatcher("sesion" + (tiposesion) + ".jsp").forward(request, response);
                    } catch (IOException | ServletException e) {
                        System.out.println("Error: " + e);
                    }
                } else if (tiposesion.equals("usuario")) {
                    try {
                        //Llamar metodo listar Empleado
                        ArrayList<Usuario> lista = Listas.datosPersonalesCliente(codigoPersona);
                        //Dirigir
                        request.setAttribute("datosPerfil", lista);
                        request.setAttribute("listaCodigosPerfil", codigos);
                        request.getRequestDispatcher("sesion" + (tiposesion) + ".jsp").forward(request, response);
                    } catch (IOException | ServletException e) {
                        System.out.println("Error: " + e);
                    }
                }
            }
        } else if (op.equals("enlaceuser")) {
            HttpSession sesionOk = request.getSession();
            String tipo = (String) sesionOk.getAttribute("tipo");
            request.setAttribute("formularioSolicitud", "permitido");
            request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
        } else if (op.equals("cerrar")) {//FALTA--------------------------------------
            HttpSession sesionOk = request.getSession();
            sesionOk.invalidate();
            request.setAttribute("msg", "Se cerro la sesion");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (op.equals("verSolicitud")) {

            String codsol = request.getParameter("sol");
            HttpSession sesionOk = request.getSession();

            String codigo = (String) sesionOk.getAttribute("codigo");
            //Llamar metodo listar clientes
            ArrayList<Solicitud> lista2 = Listas.listaSolicitudesPersonales(codigo);
            //Enviar lista
            request.setAttribute("listaSolicitudesPersonales", lista2);

            String tiposesion = (String) sesionOk.getAttribute("tipo");
            //Llamar metodo listar Empleado
            ArrayList<Solicitud> lista = Listas.listaDatosSolicitud(codsol);
            //Dirigir
            request.setAttribute("verSolicitud", lista);
            request.getRequestDispatcher("sesion" + (tiposesion) + ".jsp").forward(request, response);
        } else if (op.equals("verSolicitudCliente")) {
            HttpSession sesionOk = request.getSession();
            
            String tiposesion = (String) sesionOk.getAttribute("tipo");
            
            String codsol = request.getParameter("sol");
            String codigo = (String) sesionOk.getAttribute("codigo");

            
            
            ArrayList<Solicitud> lista = Listas.listaDatosSolicitud(codsol);
            request.setAttribute("verSolicitudCliente", lista);

            ArrayList<Solicitud> lista2 = Listas.listarSolicitudesClientes();
            request.setAttribute("listarSolicitudesClientes", lista2);
            
            request.getRequestDispatcher("sesion" + (tiposesion) + ".jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String op = request.getParameter("op");

        //INICIAR SESION
        if (op.equals("iniciar")) {
            //Obtener Datos del Iniciar Sesion
            String usu = request.getParameter("txtCorreo");
            String pas = request.getParameter("txtPas");
            try {
                //Mandar consulta con el metodo iniciar sesion
                String[] sesion = Sesion.iniciarSesion(usu, pas);
                // Metodo tipo de usuario
                String tipo = Sesion.tipoDeUsuario(sesion[0]);
                HttpSession sesionOk = request.getSession();
                sesionOk.setAttribute("codigo", sesion[0]);
                sesionOk.setAttribute("nombre", sesion[1]);
                sesionOk.setAttribute("tipo", tipo);
                request.setAttribute("formularioSolicitud", "permitido");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
            }
        } //REGITRARSE
        else if (op.equals("registro")) {
            String nombre = request.getParameter("txtNom");
            String apellido = request.getParameter("txtApe");
            int edad = Integer.parseInt(request.getParameter("txtEdad"));
            String email = request.getParameter("txtEmail");
            String direccion = request.getParameter("txtDir");
            String contraseña = request.getParameter("txtCon");
            int tarjeta = 0;
            try {
                //MEtodo para registro
                Sesion.registrar(nombre, apellido, email, contraseña, direccion, edad, tarjeta);
                request.setAttribute("msg", "El usuarios se registrado con exito");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
            }
        } //CREAR EMPLEADO -> ADMIN
        else if (op.equals("crearEmpleado")) {
            try {
                //Obtener Datos
                String[] codigos = Ids.aumentoId("empleado");
                String nombre = request.getParameter("txtNom");
                String apellido = request.getParameter("txtApe");
                String email = request.getParameter("txtEmail");
                String contraseña = request.getParameter("txtCon");
                int edad = Integer.parseInt(request.getParameter("txtEdad"));
                int dni = Integer.parseInt(request.getParameter("txtDni"));
                double sueldo = Double.parseDouble(request.getParameter("txtSueldo"));
                //Llamar metodo crear Empleado
                Actualizar.crearEmpleado(codigos[0], codigos[1], nombre, apellido, email, contraseña, edad, dni, sueldo);
                //Llamar metodo listar Empleado
                ArrayList<Empleado> lista = Listas.listarEmpleados();
                //Dirigir
                request.setAttribute("listaEmpleados", lista);
                request.getRequestDispatcher("sesionadmin.jsp").forward(request, response);
            } catch (IOException | NumberFormatException | SQLException | ServletException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editarEmpleado")) {
            try {
                //Obtener Datos
                String codigoPersona = request.getParameter("txtCodPer");
                String nombre = request.getParameter("txtNom");
                String apellido = request.getParameter("txtApe");
                String email = request.getParameter("txtEmail");
                String contraseña = request.getParameter("txtCon");
                String edad = request.getParameter("txtEdad");
                String dni = request.getParameter("txtDni");
                String sueldo = request.getParameter("txtSueldo");
                //Llamar metodo editarEmpleado
                Actualizar.editarEmpleado(codigoPersona, nombre, apellido, email, contraseña, edad, dni, sueldo);
                //Llamar metodo listar Empleado
                ArrayList<Empleado> lista = Listas.listarEmpleados();
                //Dirigir
                request.setAttribute("listaEmpleados", lista);
                request.getRequestDispatcher("sesionadmin.jsp").forward(request, response);
            } catch (IOException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editarCliente")) {
            HttpSession sesionOk = request.getSession();
            try {
                //Obtener Datos
                String codigoPersona = request.getParameter("txtCodPer");
                String nombre = request.getParameter("txtNom");
                String apellido = request.getParameter("txtApe");
                String email = request.getParameter("txtEmail");
                String contraseña = request.getParameter("txtCon");
                String edad = request.getParameter("txtEdad");
                String direccion = request.getParameter("txtDireccion");
                String tarjeta = request.getParameter("txtTarjeta");
                //Llamar metodo editarEmpleado
                Actualizar.editarCliente(codigoPersona, nombre, apellido, email, contraseña, edad, direccion, tarjeta);
                //Llamar metodo listar Empleado
                ArrayList<Usuario> lista = Listas.listarClientes();
                //Dirigir
                request.setAttribute("listaClientes", lista);
                request.getRequestDispatcher("sesion" + (String) sesionOk.getAttribute("tipo") + ".jsp").forward(request, response);
            } catch (IOException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editarDatosPersonales")) {
            try {
                //Obtener Datos
                String codigoPersona = request.getParameter("txtCodPer");
                String nombre = request.getParameter("txtNom");
                String apellido = request.getParameter("txtApe");
                String email = request.getParameter("txtEmail");
                String contraseña = request.getParameter("txtCon");
                String edad = request.getParameter("txtEdad");
                String direccion = request.getParameter("txtDireccion");
                String tarjeta = request.getParameter("txtTarjeta");
                String dni = request.getParameter("txtDni");
                String sueldo = request.getParameter("txtSueldo");
                //Llamar metodo editarEmpleado

                //Llamar metodo listar Empleado
                HttpSession sesionOk = request.getSession();
                String codigo = (String) sesionOk.getAttribute("codigo");
                String tiposesion = (String) sesionOk.getAttribute("tipo");
                if (tiposesion.equals("admin")) {
                    //Llamar metodo datos personales
                    Actualizar.editarEmpleado(codigoPersona, nombre, apellido, email, contraseña, edad, dni, sueldo);
                    ArrayList<Administrador> lista = Listas.datosPersonalesAdmin(codigo);
                    request.setAttribute("datosPerfil", lista);
                } else if (tiposesion.equals("empleado")) {
                    Actualizar.editarEmpleado(codigoPersona, nombre, apellido, email, contraseña, edad, dni, sueldo);
                    ArrayList<Empleado> lista = Listas.datosPersonalesEmpleado(codigo);
                    request.setAttribute("datosPerfil", lista);
                } else if (tiposesion.equals("usuario")) {
                    Actualizar.editarEmpleado(codigoPersona, nombre, apellido, email, contraseña, edad, direccion, tarjeta);
                    ArrayList<Usuario> lista = Listas.datosPersonalesCliente(codigo);
                    request.setAttribute("datosPerfil", lista);
                }
                //Enviar lista
                request.getRequestDispatcher("sesion" + tiposesion + ".jsp").forward(request, response);
            } catch (IOException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("enviarSolicitud")) {
            HttpSession sesionOk = request.getSession();
            try {
                //Obtener Datos
                String codigoper = (String) sesionOk.getAttribute("codigo");
                String motivo = request.getParameter("txtMo");
                String detalle = request.getParameter("txtDe");
                //Llamar metodo editarEmpleado
                Actualizar.crearSolicitud(codigoper, motivo, detalle);
                //Llamar metodo listar Empleado
                ArrayList<Solicitud> lista = Listas.listaSolicitudesPersonales(codigoper);
                //Enviar lista
                request.setAttribute("listaSolicitudesPersonales", lista);
                String tipo = (String) sesionOk.getAttribute("tipo");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
            } catch (SQLException ex) {
                Logger.getLogger(ServletUser.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (op.equals("enviarSolucion")) {
            HttpSession sesionOk = request.getSession();
            try {
                //Obtener Datos
                String codigoper = (String) sesionOk.getAttribute("codigo");
                String solucion = request.getParameter("txtSo");
                String codigosol = request.getParameter("txtCodSo");

                //Llamar metodo editarEmpleado
                /*Actualizar.enviarSolucion(codigosol, codigoper, solucion);*/
                Actualizar.enviarSolucion(codigoper, codigosol, solucion);
                //Llamar metodo listar clientes
                ArrayList<Solicitud> lista = Listas.listarSolicitudesClientes();
                //Enviar lista
                request.setAttribute("listarSolicitudesClientes", lista);
                String tipo = (String) sesionOk.getAttribute("tipo");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("enviarCalificacion")) {
            HttpSession sesionOk = request.getSession();
            try {
                //Obtener Datos
                String codigoper = (String) sesionOk.getAttribute("codigo");
                int calificacion = Integer.parseInt(request.getParameter("txtCalificacion"));
                String codigosol = request.getParameter("txtCodSo");
                //Llamar metodo editarEmpleado
                Actualizar.enviarCalificacion(codigosol, calificacion);
                //Llamar metodo listar clientes
                ArrayList<Solicitud> lista = Listas.listaSolicitudesPersonales(codigoper);
                //Enviar lista
                request.setAttribute("listaSolicitudesPersonales", lista);
                String tipo = (String) sesionOk.getAttribute("tipo");
                request.getRequestDispatcher("sesion" + tipo + ".jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println("Error: " + e);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
