/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aleja
 */
@WebServlet(urlPatterns = {"/pago"})
public class pago extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html lang='es'>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<title>Pago</title>");
            out.println("<link rel='stylesheet' href='estilos.css'>");
            out.println("<script>");
            out.println("function mostrarFormulario() {");
            out.println("  var metodo = document.querySelector('input[name=metodoPago]:checked').value;");
            out.println("  document.getElementById('tarjeta-formulario').style.display = metodo === 'tarjeta' ? 'block' : 'none';");
            out.println("  document.getElementById('transferencia-formulario').style.display = metodo === 'transferencia' ? 'block' : 'none';");
            out.println("}");
            out.println("window.onload = function() {");
            out.println("  var radios = document.getElementsByName('metodoPago');");
            out.println("  for(var i=0; i<radios.length; i++) { radios[i].onclick = mostrarFormulario; }");
            out.println("  mostrarFormulario();");
            out.println("};");
            out.println("</script>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='Agrupar'>");
            out.println("<header id='cabecera'>");
            out.println("<h1>Procesar Pago</h1>");
            out.println("</header>");
            out.println("<section id='seccion'>");
            out.println("<article>");
            out.println("<form action='pago' method='post'>");
            out.println("<div class='seleccionar'>");
            out.println("<h3>Método de Pago</h3>");
            out.println("<label><input type='radio' name='metodoPago' value='tarjeta' checked> Tarjeta Bancaria</label> ");
            out.println("<label style='margin-left:20px;'><input type='radio' name='metodoPago' value='transferencia'> Transferencia Bancaria</label>");
            out.println("</div>");
            // Formulario Tarjeta
            out.println("<div id='tarjeta-formulario'>");
            out.println("<div class='form-group'><label>Número de Tarjeta</label>");
            out.println("<input type='text' name='numeroTarjeta' maxlength='16' placeholder='1234 5678 9012 3456'></div>");
            out.println("<div style='display: flex; gap: 10px;'>");
            out.println("<div class='form-group' style='flex:1;'><label>Expiración</label>");
            out.println("<input type='text' name='fechaExpiracion' maxlength='5' placeholder='MM/AA'></div>");
            out.println("<div class='form-group' style='flex:1;'><label>CVV</label>");
            out.println("<input type='text' name='cvv' maxlength='3' placeholder='123'></div>");
            out.println("</div>");
            out.println("<div class='form-group'><label>Nombre del Titular</label>");
            out.println("<input type='text' name='titular' placeholder='Juan Pérez'></div>");
            out.println("</div>");
            // Formulario Transferencia
            out.println("<div id='transferencia-formulario' style='display:none;'>");
            out.println("<h4>Datos Bancarios</h4>");
            out.println("<p><b>Banco:</b> Santander</p>");
            out.println("<p><b>Cuenta:</b> 1234-5678-9012-3456</p>");
            out.println("<p><b>Titular:</b> Agencia de Viajes XYZ S.A.</p>");
            int referencia = (int)(Math.random() * 900000 + 100000);
            out.println("<p><b>Referencia:</b> REF-" + referencia + "</p>");
            out.println("<p style='color:#b77d00; font-size: 0.95em;'>Realice la transferencia y luego pulse 'Procesar Pago'.</p>");
            out.println("</div>");
            out.println("<div>");
            out.println("<input type='submit' value='Procesar Pago'>");
            out.println("</div>");
            out.println("</form>");
            out.println("</article>");
            out.println("</section>");
            out.println("<aside id='columna'>");
            out.println("<p>Elija su método de pago preferido y complete el formulario.</p>");
            out.println("<p>Los pagos por transferencia pueden tardar entre 24 y 48 horas en procesarse.</p>");
            out.println("</aside>");
            out.println("<footer id='pie'>&copy; 2024 Agencia de Viajes XYZ</footer>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet request
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
