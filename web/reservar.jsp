<%-- 
    Document   : reservar
    Created on : 14 may 2025, 17:54:18
    Author     : Angel David Salas Mendoza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <<link rel="stylesheet" href="estilos.css"/>
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
                    <li><a href="#">Soporte</a></li>
                </ul>
            </nav>
            <section id="seccion">
                <article>
                    <form action="ReservaServlet" method="post">
                        <label for="nombre">Nombre: </label><br>
                        <input type="text" name="nombre" required><br><br>
                        
                        <label for="origen">Origen: </label><br>
                        <input type="text" name="origen" required><br><br>
                        
                        <label for="destino">Destino: </label><br>
                        <input type="text" name="destino" required><br><br>
                    </form>
                </article>
            </section>
            <aside id="columna">
                <blockquote>Destinos</blockquote>

            </aside>
            <footer id="pie">
                Derechos reservados &COPY; 2025 Agencia de Viajes
            </footer>
        </div>
    </body>
</html>
