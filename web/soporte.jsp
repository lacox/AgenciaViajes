<%-- 
    Document   : soporte
    Created on : 14 may 2025, 11:22:34 p.m.
    Author     : aleja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Soporte al Cliente - Agencia de Viajes</title>
        <link rel="stylesheet" href="estilos.css"/>
    </head>
    <body>
        <div id="Agrupar">
            <header id="cabecera">
                <h1>Soporte al Cliente</h1>
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
                    <h2>¿Necesitas ayuda?</h2>
                    <p>Por favor, llena el siguiente formulario y nuestro equipo de soporte se pondrá en contacto contigo lo antes posible.</p>
                    <form action="SoporteServlet" method="post">
                        <label for="nombre">Nombre:</label><br>
                        <input type="text" id="nombre" name="nombre" required><br><br>
                        <label for="email">Correo electrónico:</label><br>
                        <input type="email" id="email" name="email" required><br><br>
                        <label for="mensaje">Mensaje:</label><br>
                        <textarea id="mensaje" name="mensaje" rows="5" cols="40" required></textarea><br><br>
                        <input type="submit" value="Enviar">
                    </form>
                </article>
            </section>
            <aside id="columna">
                <h3>Contacto directo</h3>
                <p><strong>Teléfono:</strong> 01 800 123 4567</p>
                <p><strong>Email:</strong> soporte@agenciadeviajes.com</p>
                <p>Horario de atención: Lunes a Viernes, 9:00 a 18:00</p>
            </aside>
            <footer id="pie">
                Derechos reservados &COPY;2025 Agencia de Viajes
            </footer>
        </div>
    </body>
</html>
