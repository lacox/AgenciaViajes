package BD;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase para gestionar la conexión a la base de datos MySQL 'agencia'.
 * Mejora: carga explícita del driver y parámetros recomendados en la URL.
 * @author Angel David Salas Mendoza
 */
public class ConexionBD {
    private static final String URL = "jdbc:mysql://localhost:3306/agencia";
    private static final String USER = "root";
    private static final String PASS = "";

    /**
     * Obtiene una conexión a la base de datos.
     * @return Connection activa a la base de datos 'agencia'
     * @throws SQLException si ocurre un error de conexión
     */
    public static Connection obtenerConexion() throws SQLException {
        try {
            // Carga explícita del driver para compatibilidad
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se encontró el driver de MySQL.", e);
        }
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
