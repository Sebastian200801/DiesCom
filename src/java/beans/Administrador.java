
package beans;


public class Administrador extends Empleado{
    private String idAdm;

    public Administrador(String idAdm, String idEmpledo, int dni, int sueldo, String idPersona, String nombre, String apellido, String email, String pas, int edad) {
        super(idEmpledo, dni, sueldo, idPersona, nombre, apellido, email, pas, edad);
        this.idAdm = idAdm;
    }

    public String getIdAdm() {
        return idAdm;
    }

    public void setIdAdm(String idAdm) {
        this.idAdm = idAdm;
    }
    
}
