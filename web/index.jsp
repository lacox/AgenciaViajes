<%-- 
    Document   : index
    Created on : 14 may 2025, 17:20:07
    Author     : Angel David Salas Mendoza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Sitio web de una agencia de viajes">
        <meta name="keywords" content="Viajes, Turismo, Agencia, Reserva">
        <link rel="stylesheet" href="estilos.css"/>
        <title>Agencia de Viajes</title>
    </head>
    <body>
        <div id="Agrupar">
            <header id="cabecera">
                <h1>Agencia de Viajes - ¡Explora el mundo!</h1>
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
                    <header>
                        <hgroup>
                            <h1>¡Bienvenido!</h1>
                            <h2>Tu aventura empieza aquí</h2>
                        </hgroup>
                        <time datetime="2025-05-14">Publicado el 14-05-2025</time>
                    </header>
                    <p>
                        Descubre destinos increíbles al mejor precio. Reserva hoy tu
                        próximo viaje y vive una experiencia inolvidable.
                    </p>
                    <figure>
                        <img class="img1" src="img/playa.jpg" alt="Playa"/>
                        <figcaption>Disfruta de nuestras promociones</figcaption>
                    </figure>
                </article>
            </section>
            <aside id="columna">
                <blockquote>Descubre nuestras promociones exclusivas para esta temporada.</blockquote>
                <blockquote>Asesoría personalizada disponible las 24 horas, los 7 días de la semana.</blockquote>
            </aside>
            <footer id="pie">
                Derechos reservados &COPY;2025 Agencia de Viajes
            </footer>
        </div>
    </body>
</html>
