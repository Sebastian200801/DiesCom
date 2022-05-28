package utils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Sesion {

    public static String[] iniciarSesion(String email, String contraseña) {
        String valores[] = new String[2];
        try {
            //Mandar consulta
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select * from personas where email=? and pas=?");
            psta.setString(1, email);
            psta.setString(2, contraseña);
            ResultSet rs = psta.executeQuery();
            if (rs.next()) {
                valores[0] = rs.getString(1);
                valores[1] = rs.getString(2);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return valores;
    }

    public static String tipoDeUsuario(String codigo) {
        String tipo = "";
        try {
            int cantus = 0;
            int cantem = 0;
            int cantad = 0;

            PreparedStatement pstaus = ConexionDB.getConexion().prepareStatement("select count(*) as conus from usuarios where idPe=?");
            pstaus.setString(1, codigo);
            ResultSet rsus = pstaus.executeQuery();
            while (rsus.next()) {
                cantus = rsus.getInt("conus");
            }

            PreparedStatement pstaem = ConexionDB.getConexion().prepareStatement("select count(*) as conem from empleados where idPe=?");
            pstaem.setString(1, codigo);
            ResultSet rsem = pstaem.executeQuery();
            while (rsem.next()) {
                cantem = rsem.getInt("conem");
            }

            PreparedStatement pstabusem = ConexionDB.getConexion().prepareStatement("select idEm as empleado from empleados where idPe=?");
            pstabusem.setString(1, codigo);
            ResultSet rsbusem = pstabusem.executeQuery();
            String busem = "";
            while (rsbusem.next()) {
                busem = rsbusem.getString("empleado");
            }
            PreparedStatement pstaad = ConexionDB.getConexion().prepareStatement("select count(*) as conad from admin where idEm=?");
            pstaad.setString(1, busem);
            ResultSet rsad = pstaad.executeQuery();
            while (rsad.next()) {
                cantad = rsad.getInt("conad");
            }

            if (cantad == 1) {
                tipo = "admin";
            } else if (cantem == 1) {
                tipo = "empleado";
            } else if (cantus == 1) {
                tipo = "usuario";
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return tipo;
    }

    public static void registrar(String nombre, String apellido, String email, String contraseña, String direccion, int edad, int tarjeta) {
        try {
            String[] codigos = Ids.aumentoId("usuario");
            PreparedStatement psta3 = ConexionDB.getConexion().prepareStatement("insert into personas values(?,?,?,?,?,?);");
            psta3.setString(1, codigos[0]);
            psta3.setString(2, nombre);
            psta3.setString(3, apellido);
            psta3.setString(4, email);
            psta3.setString(5, contraseña);
            psta3.setInt(6, edad);
            psta3.executeUpdate();
            PreparedStatement psta4 = ConexionDB.getConexion().prepareStatement("insert into usuarios values(?,?,?,?);");
            psta4.setString(1, codigos[1]);
            psta4.setString(2, codigos[0]);
            psta4.setString(3, direccion);
            psta4.setInt(4, tarjeta);
            psta4.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }
}
