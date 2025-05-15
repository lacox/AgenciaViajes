package BD;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author Angel David Salas Mendoza
 */
public class ConexionBD {
    private static final String URL = "jdbc:mysql://localhost:3306/agencia";
    private static final String USER = "root";
    private static final String PASS = "";
    
    public static Connection obtenerConexion() throws SQLException{
        return DriverManager.getConnection(URL,USER,PASS);
    }
}
