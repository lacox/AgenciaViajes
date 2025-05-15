<%-- 
    Document   : vuelos
    Created on : 14 may 2025, 20:56:49
    Author     : lacox
--%>

<%@page import="java.util.List" %>
<%@page import="objects.Vuelo" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <<link rel="stylesheet" href="estilos.css"/>
        <title>Vuelos Disponibles</title>
    </head>
    <body>
        <div id="Agrupar">
            <header id="cabecera">
                <h1>Vuelos Disponibles</h1>
            </header>
            <nav id="menu">
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="reservar.jsp">Reservar Pasaje</a></li>
                    <li><a href="#">Soporte</a></li>
                </ul>
            </nav>
            <section id="seccion">
                <article>
                    <%
                        List<Vuelo> vuelos = (List<Vuelo>) request.getAttribute("vuelos");
                        String nombre = (String) request.getAttribute("nombre");
                    %>
                    <form action="PagoServlet" method="POST">
                        <input type="hidden" name="nombre" value="<%= nombre %>">
                        <label>Selecciona un vuelo: </label><br>
                        <select name="vueloId" required>
                            <%for(Vuelo v : vuelos){%>
                            <option value="<%= v.getId() %>">
                                <%= v.getOrigen() %> -> <%= v.getDestino() %> - <%= v.getPrecio() %> (Cupo: <%= v.getCupoMaximo() %>)
                            </option>
                            <% } %>
                        </select> <br><br>
                        <input type="submit" value="Seleccionar y Pagar">
                    </form>
                </article>
            </section>
            <footer id="pie">
                Derechos reservados &COPY;2025 Agencia de Viajes
            </footer>
        </div>
    </body>
</html>
