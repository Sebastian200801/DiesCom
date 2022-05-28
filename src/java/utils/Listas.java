package utils;

import beans.Administrador;
import beans.Empleado;
import beans.Solicitud;
import beans.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Listas {

    public static ArrayList<Empleado> listarEmpleados() {
        ArrayList<Empleado> lista = new ArrayList<>();
        try {
            //Mandar consulta
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select p.idPe, p.nombres, p.apellidos, p.email, p.pas, p.edad, e.dni, e.sueldo, e.idEm from empleados as e inner join personas as p on e.idPe=p.idPe;");
            ResultSet rs = psta.executeQuery();
            //Crear Lista de Empleados
            while (rs.next()) {
                Empleado e = new Empleado(rs.getString(9), rs.getInt(7), rs.getDouble(8), rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                lista.add(e);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return lista;
    }

    public static ArrayList<Usuario> listarClientes() {
        int x = 0;
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            //Mandar consulta
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("SELECT p.idPe, p.nombres, p.apellidos, p.email, p.pas, p.edad, u.direccion, u.idUs FROM usuarios AS u INNER JOIN personas AS p ON u.idPe = p.idPe");
            ResultSet rs = psta.executeQuery();
            //Crear lista
            while (rs.next()) {
                Usuario u = new Usuario(rs.getString(8), rs.getString(7), x, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                lista.add(u);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return lista;
    }

    public static ArrayList datosPersonalesAdmin(String codigoper) {
        ArrayList<Administrador> lista = new ArrayList<>();
        try {
            //Mandar Consulta
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select p.idPe, p.nombres, p.apellidos, p.email, p.pas, p.edad, e.dni, e.sueldo, a.idAd, e.idEm FROM personas AS p INNER JOIN empleados AS e ON p.idPe=e.idPe INNER JOIN admin AS a ON a.idEm=e.idEm WHERE p.idPe=?;");
            psta.setString(1, codigoper);
            ResultSet rs = psta.executeQuery();
            //Crear Lista

            while (rs.next()) {
                Administrador a = new Administrador(rs.getString(9), rs.getString(10), rs.getInt(7), rs.getInt(8), rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                lista.add(a);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return lista;
    }
    
    public static ArrayList datosPersonalesEmpleado(String codigoper) {
        ArrayList<Empleado> lista = new ArrayList<>();
        try {
            //Mandar Consulta
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select p.idPe, p.nombres, p.apellidos, p.email, p.pas, p.edad, e.dni, e.sueldo, e.idEm FROM personas AS p INNER JOIN empleados AS e ON p.idPe=e.idPe WHERE p.idPe=?;");
            psta.setString(1, codigoper);
            ResultSet rs = psta.executeQuery();
            //Crear Lista

            while (rs.next()) {
                Empleado e = new Empleado(rs.getString(9), rs.getInt(7), rs.getInt(8), rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                lista.add(e);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return lista;
    }
    
    public static ArrayList datosPersonalesCliente(String codigoper) {
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            //Mandar Consulta
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select p.idPe, p.nombres, p.apellidos, p.email, p.pas, p.edad, u.direccion, u.ntarjeta, u.idUs FROM personas AS p INNER JOIN usuarios AS u ON p.idPe=u.idPe WHERE p.idPe=?;");
            psta.setString(1, codigoper);
            ResultSet rs = psta.executeQuery();
            //Crear Lista

            while (rs.next()) {
                Usuario u = new Usuario(rs.getString(9), rs.getString(7), rs.getInt(8), rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                lista.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return lista;
    }
    
    public static ArrayList listaSolicitudesPersonales(String codigoper) {
        ArrayList<Solicitud> lista = new ArrayList<>();
        try {
            
            PreparedStatement psta2 = ConexionDB.getConexion().prepareStatement("SELECT * FROM solicitud WHERE idPe=? AND estado='PENDIENTE';");
            psta2.setString(1, codigoper);
            ResultSet rs2 = psta2.executeQuery();
            while (rs2.next()) {
                Solicitud s2 = new Solicitud(rs2.getString(1), rs2.getString(3), rs2.getString(4), rs2.getString(5),"","","","",0);
                lista.add(s2);
            }

            //Mandar Consulta
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select s.idSo,s.motivo,s.descripcion,s.estado,e.idEm,p.nombres,p.apellidos,s.solucion,s.calificacion FROM solicitud AS s INNER JOIN empleados AS e ON e.idEm=s.idEm INNER JOIN personas AS p ON p.idPe=e.idPe WHERE s.idPe=?;");
            psta.setString(1, codigoper);
            ResultSet rs = psta.executeQuery();
            //Crear Lista

            while (rs.next()) {
                Solicitud s = new Solicitud(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6),rs.getString(7), rs.getString(8), rs.getInt(9));
                lista.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return lista;
    }
    
    public static ArrayList listarSolicitudesClientes() {
        ArrayList<Solicitud> lista = new ArrayList<>();
        try {

            //Mandar Consulta
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select s.idSo,s.motivo,s.descripcion,s.estado,p.idPe,p.nombres,p.apellidos,s.solucion,s.calificacion FROM solicitud AS s INNER JOIN personas AS p ON p.idPe=s.idPe;");
            ResultSet rs = psta.executeQuery();
            //Crear Lista
            while (rs.next()) {
                Solicitud s = new Solicitud(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6),rs.getString(7), rs.getString(8), rs.getInt(9));
                lista.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return lista;
    }
    
    public static ArrayList listaDatosSolicitud(String codigosol) {
        ArrayList<Solicitud> lista = new ArrayList<>();
        try {

            //Mandar Consulta
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select s.idSo,s.motivo,s.descripcion,s.solucion FROM solicitud AS s WHERE idSo=?;");
             psta.setString(1, codigosol);
            ResultSet rs = psta.executeQuery();
            //Crear Lista
            while (rs.next()) {
                Solicitud s = new Solicitud(rs.getString(1),rs.getString(2),rs.getString(3),"","","","",rs.getString(4), 0);
                lista.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return lista;
    }
    
}
