package objects;
import BD.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Angel David Salas Mendoza
 */
public class VueloDAO {
    public static List<Vuelo> buscarVuelos(String origen, String destino){
        List<Vuelo> lista = new ArrayList<>();
        
        String sql = "SELECT * FROM vuelos WHERE origen = ? AND destino = ?";
        
        try{
            Connection con = ConexionBD.obtenerConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, origen);
            ps.setString(2, destino);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Vuelo v = new Vuelo(
                    rs.getInt("id"),
                    rs.getString("origen"),
                    rs.getString("destino"),
                    rs.getDouble("precio"),
                    rs.getInt("cupo_maximo")
                );
                lista.add(v);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return lista;
    }
    
    public static Vuelo obtenerVueloPorId(int id) {
        String sql = "SELECT * FROM vuelos WHERE id = ?";
        try (Connection con = ConexionBD.obtenerConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Vuelo(
                        rs.getInt("id"),
                        rs.getString("origen"),
                        rs.getString("destino"),
                        rs.getDouble("precio"),
                        rs.getInt("cupo_maximo")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
