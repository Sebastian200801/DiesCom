
package beans;


public class Usuario extends Persona{

    String idUsuario, direccion;
    int ntarjeta;

    public Usuario(String idUsuario, String direccion, int ntarjeta, String idPersona, 
            String nombre, String apellido, String email, String pas, int edad) {
        super(idPersona, nombre, apellido, email, pas, edad);
        this.idUsuario = idUsuario;
        this.direccion = direccion;
        this.ntarjeta = ntarjeta;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getNtarjeta() {
        return ntarjeta;
    }

    public void setNtarjeta(int ntarjeta) {
        this.ntarjeta = ntarjeta;
    }
    
}
