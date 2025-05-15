package objects;

/**
 * @author Angel David Salas Mendoza
 */
public class Vuelo {
    private int id;
    private int cupoMaximo;
    private String origen;
    private String destino;
    private double precio;
    
    public Vuelo(int id, String origen, String destino, double precio, int cupoMaximo){
        this.id = id;
        this.origen = origen;
        this.destino = destino;
        this.precio = precio;
        this.cupoMaximo = cupoMaximo;
    }

    public int getId() {
        return id;
    }

    public String getOrigen() {
        return origen;
    }

    public String getDestino() {
        return destino;
    }

    public double getPrecio() {
        return precio;
    }

    public int getCupoMaximo() {
        return cupoMaximo;
    }
}
