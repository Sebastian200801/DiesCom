package beans;

public class Producto {

private int cod;
private String nom;
private String des;
private double precio;
private String img;
private int stock;

    public Producto() {
    }

    public Producto(int cod, String nom, String des, double precio, String img,int stock) {
        this.cod = cod;
        this.nom = nom;
        this.des = des;
        this.precio = precio;
        this.img = img;
this.stock=stock;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }


    
}
