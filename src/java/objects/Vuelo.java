package objects;

/**
 * @author Angel David Salas Mendoza
 */
public class Vuelo {
    private final int id;
    private final int cupoMaximo;
    private final String origen;
    private final String destino;
    private final double precio;
    
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
