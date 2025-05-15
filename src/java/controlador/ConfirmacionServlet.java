package controlador;
import objects.ReservaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import objects.Vuelo;
import objects.VueloDAO;

/**
 *
 * @author lacox
 */
public class ConfirmacionServlet extends HttpServlet {
    /**
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
        int vueloId = Integer.parseInt(request.getParameter("vueloId"));
        String nombre = request.getParameter("nombre");
        String metodo = request.getParameter("metodoPago");
        
        // Validar cupo y realizar reserva
        if (ReservaDAO.hayCupo(vueloId)) {
            ReservaDAO.realizarReserva(nombre, vueloId);
            
            Vuelo vuelo = VueloDAO.obtenerVueloPorId(vueloId); // busca el vuelo desde la BD
            
             // Mandar datos al JSP
            request.setAttribute("nombre", nombre);
            request.setAttribute("vuelo", "Vuelo #" + vuelo.getId());
            request.setAttribute("origen", vuelo.getOrigen());
            request.setAttribute("destino", vuelo.getDestino());
            request.setAttribute("metodo", metodo);
            
            request.getRequestDispatcher("confirmacion.jsp").forward(request, response);
        } else {
            response.sendRedirect("reservar.jsp?error=cupo");
        }
    }
}
