
package beans;


public class Empleado extends Persona{
    
    private String idEmpleado;
    private int dni;
    private double sueldo;

    public Empleado(String idEmpleado, int dni, double sueldo, String idPersona, 
            String nombre, String apellido, String email, String pas, int edad) {
        super(idPersona, nombre, apellido, email, pas, edad);
        this.idEmpleado = idEmpleado;
        this.dni = dni;
        this.sueldo = sueldo;
    }

    public String getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(String idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
}
