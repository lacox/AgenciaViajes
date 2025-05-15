package objects;

import BD.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lacox
 */
public class ReservaDAO {
    public static void realizarReserva(String nombre, int vueloId) {
        String sql = "INSERT INTO reservas (nombre, vuelo_id) VALUES (?, ?)";

        try (Connection con = ConexionBD.obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nombre);
            ps.setInt(2, vueloId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static boolean hayCupo(int vueloId) {
        String sql = "SELECT COUNT(*) AS total FROM reservas WHERE vuelo_id = ?";
        String sqlCupo = "SELECT cupo_maximo FROM vuelos WHERE id = ?";
        try (Connection con = ConexionBD.obtenerConexion(); PreparedStatement ps1 = con.prepareStatement(sql); PreparedStatement ps2 = con.prepareStatement(sqlCupo)) {
            ps1.setInt(1, vueloId);
            ResultSet rs1 = ps1.executeQuery();
            ps2.setInt(1, vueloId);
            ResultSet rs2 = ps2.executeQuery();

            if (rs1.next() && rs2.next()) {
                int reservados = rs1.getInt("total");
                int max = rs2.getInt("cupo_maximo");
                return reservados < max;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

