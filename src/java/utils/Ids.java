package utils;

import java.sql.*;

public class Ids {

    public static String[] aumentoId(String tipo) {
        int[] contar = new int[1];
        int[] contar1 = new int[1];
        int canper = 0;
        int canus = 0;
        String codper = "";
        String codgen = "";
        String codadm = "";
        try {
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select COUNT(*) as pe from personas;");
            ResultSet rs = psta.executeQuery();
            while (rs.next()) {
                contar[0] = rs.getInt("pe");
                canper = contar[0] + 1;
            }
            if (canper < 10) {
                codper = "PE00" + canper;
            } else if (canper < 100) {
                codper = "PE0" + canper;
            } else if (canper < 1000) {
                codper = "PE" + canper;
            }

            if (tipo.equals("usuario")) {
                PreparedStatement psta1 = ConexionDB.getConexion().prepareStatement("select COUNT(*) as us from usuarios;");
                ResultSet rs1 = psta1.executeQuery();
                while (rs1.next()) {
                    contar1[0] = rs1.getInt("us");
                    canus = contar1[0] + 1;
                }
                if (canus < 10) {
                    codgen = "US00" + canus;
                } else if (canus < 100) {
                    codgen = "US0" + canus;
                } else if (canus < 1000) {
                    codgen = "US" + canus;
                }
            } else if (tipo.equals("empleado")) {
                PreparedStatement psta1 = ConexionDB.getConexion().prepareStatement("select COUNT(*) as em from empleados;");
                ResultSet rs1 = psta1.executeQuery();
                while (rs1.next()) {
                    contar1[0] = rs1.getInt("em");
                    canus = contar1[0] + 1;
                }
                if (canus < 10) {
                    codgen = "EM00" + canus;
                } else if (canus < 100) {
                    codgen = "EM0" + canus;
                } else if (canus < 1000) {
                    codgen = "EM" + canus;
                }
            } else if (tipo.equals("solcitud")) {
                PreparedStatement psta1 = ConexionDB.getConexion().prepareStatement("select COUNT(*) as so  from solicitud;");
                ResultSet rs1 = psta1.executeQuery();
                while (rs1.next()) {
                    contar1[0] = rs1.getInt("so");
                    canus = contar1[0] + 1;
                }
                if (canus < 10) {
                    codgen = "SO00" + canus;
                } else if (canus < 100) {
                    codgen = "SO0" + canus;
                } else if (canus < 1000) {
                    codgen = "SO" + canus;
                }
            }/*else if(tipo.equals("admin")){
                PreparedStatement psta1 = ConexionDB.getConexion().prepareStatement("select COUNT(*) as em from empleados;");
                ResultSet rs1 = psta1.executeQuery();
                while(rs1.next()){
                    contar1[0]=rs1.getInt("em");
                    canus = contar1[0]+1;
                }
                if (canus < 10) {
                    codgen = "EM00" + canus;
                } else if (canus < 100) {
                    codgen = "EM0" + canus;
                } else if (canus < 1000) {
                    codgen = "EM" + canus;
                }
            }*/

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        String[] codigos = {codper, codgen, codadm};
        return codigos;
    }

    public static String aumentoIdSolicitud() {
        int[] contar1 = new int[1];
        int canus = 0;
        String codgen = "";
        try {
            PreparedStatement psta1 = ConexionDB.getConexion().prepareStatement("select COUNT(*) as so  from solicitud;");
            ResultSet rs1 = psta1.executeQuery();
            while (rs1.next()) {
                contar1[0] = rs1.getInt("so");
                canus = contar1[0] + 1;
            }
            if (canus < 10) {
                codgen = "SO00" + canus;
            } else if (canus < 100) {
                codgen = "SO0" + canus;
            } else if (canus < 1000) {
                codgen = "SO" + canus;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return codgen;
    }
}
