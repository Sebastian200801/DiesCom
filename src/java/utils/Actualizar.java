package utils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static utils.Ids.aumentoIdSolicitud;

public class Actualizar {

    public static void crearEmpleado(String codper, String codem, String nombre,
            String apellido, String email, String contraseña, int edad, int dni, double sueldo) throws SQLException {
        PreparedStatement psta3 = ConexionDB.getConexion().prepareStatement("insert into personas values(?,?,?,?,?,?);");
        psta3.setString(1, codper);
        psta3.setString(2, nombre);
        psta3.setString(3, apellido);
        psta3.setString(4, email);
        psta3.setString(5, contraseña);
        psta3.setInt(6, edad);
        psta3.executeUpdate();
        PreparedStatement psta4 = ConexionDB.getConexion().prepareStatement("insert into empleados values(?,?,?,?);");
        psta4.setString(1, codem);
        psta4.setString(2, codper);
        psta4.setInt(3, dni);
        psta4.setDouble(4, sueldo);
        psta4.executeUpdate();
    }

    public static void eliminarEmpleado(String empleado, String persona) {
        try {
            PreparedStatement psta1 = ConexionDB.getConexion().prepareStatement("delete from empleados where idEm=?;");
            psta1.setString(1, empleado);
            psta1.executeUpdate();
            PreparedStatement psta2 = ConexionDB.getConexion().prepareStatement("delete from personas where idPe=?;");
            psta2.setString(1, persona);
            psta2.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }

    public static void editarEmpleado(String codper, String nombre, String apellido, 
            String email, String contraseña, String edad, String dni, String sueldo) {
        try {
             if (!nombre.equals("")) {
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET nombres=? WHERE idPe=?;");
                psta.setString(1, nombre);
                psta.setString(2, codper);
                psta.executeUpdate();
            }
            if (!apellido.equals("")) {
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET apellidos=? WHERE idPe=?;");
                psta.setString(1, apellido);
                psta.setString(2, codper);
                psta.executeUpdate();
            }
            if (!email.equals("")) {
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET email=? WHERE idPe=?;");
                psta.setString(1, email);
                psta.setString(2, codper);
                psta.executeUpdate();
            }
            if (!edad.equals("")) {
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET edad=? WHERE idPe=?;");
                psta.setInt(1, Integer.parseInt(edad));
                psta.setString(2, codper);
                psta.executeUpdate();
            }
            if (!contraseña.equals("")) {
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET pas=? WHERE idPe=?;");
                psta.setString(1, contraseña);
                psta.setString(2, codper);
                psta.executeUpdate();
            }
            if (!dni.equals("")) {
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE empleados SET dni=? WHERE idPe=?;");
                psta.setInt(1, Integer.parseInt(dni));
                psta.setString(2, codper);
                psta.executeUpdate();
            }
            if (!sueldo.equals("")) {
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE empleados SET sueldo=? WHERE idPe=?;");
                psta.setDouble(1, Double.parseDouble(sueldo));
                psta.setString(2, codper);
                psta.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }

    public static void eliminarCliente(String empleado, String persona) {
        try {
            PreparedStatement psta1 = ConexionDB.getConexion().prepareStatement("delete from usuarios where idUs=?;");
            psta1.setString(1, empleado);
            psta1.executeUpdate();
            PreparedStatement psta2 = ConexionDB.getConexion().prepareStatement("delete from personas where idPe=?;");
            psta2.setString(1, persona);
            psta2.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }

    public static void editarCliente(String codper, String nombre,
            String apellido, String email, String contraseña, String edad, String direccion, String tarjeta) {
        try {
            if(!nombre.equals("")){
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET nombres=? WHERE idPe=?;");
            psta.setString(1, nombre);
            psta.setString(2, codper);
            psta.executeUpdate();
            }
            if(!apellido.equals("")){
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET apellidos=? WHERE idPe=?;");
            psta.setString(1, apellido);
            psta.setString(2, codper);
            psta.executeUpdate();
            }
            if(!email.equals("")){
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET email=? WHERE idPe=?;");
            psta.setString(1, email);
            psta.setString(2, codper);
            psta.executeUpdate();
            }
            if(!edad.equals("")){
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET edad=? WHERE idPe=?;");
            psta.setInt(1, Integer.parseInt(edad));
            psta.setString(2, codper);
            psta.executeUpdate();
            }
            if(!contraseña.equals("")){
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE personas SET pas=? WHERE idPe=?;");
            psta.setString(1, contraseña);
            psta.setString(2, codper);
            psta.executeUpdate();
            }
            if(!direccion.equals("")){
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE usuarios SET direccion=? WHERE idPe=?;");
            psta.setInt(1, Integer.parseInt(direccion));
            psta.setString(2, codper);
            psta.executeUpdate();
            }
            if(!tarjeta.equals("")){
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("UPDATE usuarios SET ntarjeta=? WHERE idPe=?;");
            psta.setInt(1, Integer.parseInt(tarjeta));
            psta.setString(2, codper);
            psta.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }

    public static void editarDatosPersonales() {
    }
    public static void crearSolicitud(String codper, String motivo, String detalle) throws SQLException {
        String codigosso = aumentoIdSolicitud();
        PreparedStatement psta3 = ConexionDB.getConexion().prepareStatement("insert into solicitud(idSo,idPe,motivo,descripcion,estado) values(?,?,?,?,?);");
        psta3.setString(1, codigosso);
        psta3.setString(2, codper);
        psta3.setString(3, motivo);
        psta3.setString(4, detalle);
        psta3.setString(5, "PENDIENTE");
        psta3.executeUpdate();
    }
    
    public static void enviarSolucion(String codper, String codsol, String solucion) {
        try {

            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select idEm FROM empleados WHERE idPe=?;");
            psta.setString(1, codper);
            ResultSet rs = psta.executeQuery();
            //Crear Lista
            String codem="";
            while (rs.next()) {
                codem = rs.getString(1);
            }
            PreparedStatement psta2 = ConexionDB.getConexion().prepareStatement("UPDATE solicitud SET estado=?, idEm=?, solucion=? WHERE idSo=?;");
            psta2.setString(1, "SOLUCIONADO");
            psta2.setString(2, codem);
            psta2.setString(3, solucion);
            psta2.setString(4, codsol);
            psta2.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }
    public static void enviarCalificacion(String codsol, int calificacion) {
        try {
            /*
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select idEm FROM empleados WHERE idPe=?;");
            psta.setString(1, codper);
            ResultSet rs = psta.executeQuery();
            //Crear Lista
            String codem="";
            while (rs.next()) {
                codem = rs.getString(1);
            }
            */
            PreparedStatement psta2 = ConexionDB.getConexion().prepareStatement("UPDATE solicitud SET calificacion=? WHERE idSo=?;");
            psta2.setInt(1, calificacion);
            psta2.setString(2, codsol);
            psta2.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }
}
