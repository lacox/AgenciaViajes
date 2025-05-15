<%-- 
    Document   : reservar
    Created on : 14 may 2025, 17:54:18
    Author     : Angel David Salas Mendoza
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="BD.ConexionBD" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos.css"/>
        <title>Reservar Pasaje</title>
    </head>
    <body>
        <div id="Agrupar">
            <header id="cabecera">
                <h1>Reservar Pasaje</h1>
            </header>
            <nav id="menu">
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="reservar.jsp">Reservar Pasaje</a></li>
                    <li><a href="soporte.jsp">Soporte</a></li>
                </ul>
            </nav>
            <section id="seccion">
                <article>
                    <form action="ReservaServlet" method="post">
                        <label for="nombre">Nombre: </label><br>
                        <input type="text" name="nombre" required><br><br>
                        
                        <label for="origen">Origen: </label><br>
                        <select name="origen" required>
                            <option value="" disabled selected>Selecciona el origen</option>
                            <%
                                Connection conn = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    conn = ConexionBD.obtenerConexion();// Usar la clase ConexionBD para obtener la conexión
                                    ps = conn.prepareStatement("SELECT DISTINCT origen FROM vuelos");
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                            %>
                                        <option value="<%= rs.getString("origen")%>"><%= rs.getString("origen")%></option>
                            <%
                                    }
                                } catch (Exception e) {
                            %>
                                    <option style="color:red;">Error al cargar origenes: <%= e.getMessage()%></option>
                            <%
                                } finally {
                                    if (rs != null) try {
                                        rs.close();
                                    } catch (Exception e) {
                                    }
                                    if (ps != null) try {
                                        ps.close();
                                    } catch (Exception e) {
                                    }
                                }
                            %>
                        </select><br><br>

                        <label for="destino">Destino: </label><br>
                        <select name="destino" required>
                            <option value="" disabled selected>Selecciona el destino</option>
                            <%
                                try {
                                    ps = conn.prepareStatement("SELECT DISTINCT destino FROM vuelos");
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                            %>
                                        <option value="<%= rs.getString("destino")%>"><%= rs.getString("destino")%></option>
                            <%
                                    }
                                } catch (Exception e) {
                            %>
                                    <option style="color:red;">Error al cargar destinos: <%= e.getMessage()%></option>
                            <%
                                } finally {
                                    if (rs != null) try {
                                        rs.close();
                                    } catch (Exception e) {
                                    }
                                    if (ps != null) try {
                                        ps.close();
                                    } catch (Exception e) {
                                    }
                                }
                            %>
                        </select><br><br>
                        <input type="submit" value="Buscar Vuelos">
                    </form>
                    <span id="ruta-warning" style="display:none;color:orange;">
                        La ruta seleccionada no es válida o no existe. Por favor, selecciona una combinación válida de origen y destino.
                    </span>
                </article>
            </section>
            <aside id="columna">
                <h3>Destinos Disponibles</h3>
                <p>Consulta los destinos a los que puedes viajar con nosotros:</p>  
                <ul>
                    <%
                        try {
                            ps = conn.prepareStatement("SELECT DISTINCT destino FROM vuelos");
                            rs = ps.executeQuery();
                            boolean hayDestinos = false;
                            while (rs.next()) {
                                hayDestinos = true;
                    %>
                                <li><%= rs.getString("destino") %></li>
                    <%
                            }
                            if (!hayDestinos) {
                    %>
                                <li>No hay destinos disponibles en este momento.</li>
                    <%
                            }
                        } catch (Exception e) {
                    %>
                            <li style="color:red;">Error al cargar destinos: <%= e.getMessage() %></li>
                    <%
                        } finally {
                            if (rs != null) try { rs.close(); } catch (Exception e) {}
                            if (ps != null) try { ps.close(); } catch (Exception e) {}
                            if (conn != null) try { conn.close(); } catch (Exception e) {}
                        }
                    %>
                </ul>
            </aside>
            <footer id="pie">
                Derechos reservados &COPY; 2025 Agencia de Viajes
            </footer>
        </div>
        <%
            // Cargar todas las rutas válidas en un array de JavaScript
            StringBuilder rutasValidas = new StringBuilder("[");
            try {
                conn = ConexionBD.obtenerConexion();
                ps = conn.prepareStatement("SELECT origen, destino FROM vuelos");
                rs = ps.executeQuery();
                boolean primero = true;
                while (rs.next()) {
                    if (!primero) rutasValidas.append(",");
                    rutasValidas.append("{o:'")
                        .append(rs.getString("origen").replace("'", "\\'"))
                        .append("',d:'")
                        .append(rs.getString("destino").replace("'", "\\'"))
                        .append("'}");
                    primero = false;
                }
            } catch (Exception e) {
                // Ignorar aquí, ya que la validación es solo de ayuda visual
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (ps != null) try { ps.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
            rutasValidas.append("]");
        %>
        <script>
            const rutasValidas = <%= rutasValidas.toString() %>;
            function validarRuta() {
                const origen = document.querySelector('select[name="origen"]').value;
                const destino = document.querySelector('select[name="destino"]').value;
                const warning = document.getElementById('ruta-warning');
                const existe = rutasValidas.some(r => r.o === origen && r.d === destino);
                if (!existe) {
                    warning.style.display = 'block';
                    return false;
                } else {
                    warning.style.display = 'none';
                    return true;
                }
            }
            document.addEventListener('DOMContentLoaded', function() {
                document.querySelector('form').addEventListener('submit', function(e) {
                    if (!validarRuta()) {
                        e.preventDefault();
                    }
                });
                document.querySelector('select[name="origen"]').addEventListener('change', validarRuta);
                document.querySelector('select[name="destino"]').addEventListener('change', validarRuta);
            });
        </script>
    </body>
</html>
