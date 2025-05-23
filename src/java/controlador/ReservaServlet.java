package controlador;
import objects.Vuelo;
import objects.VueloDAO;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Angel David Salas Mendoza
 */

public class ReservaServlet extends HttpServlet {
    /*
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String origen = request.getParameter("origen");
        String destino = request.getParameter("destino");
        String nombre = request.getParameter("nombre");
        
        List<Vuelo> vuelos = VueloDAO.buscarVuelos(origen, destino);
        
        request.setAttribute("vuelos", vuelos);
        request.setAttribute("nombre", nombre);
        request.getRequestDispatcher("vuelos.jsp").forward(request, response);
    }
}
