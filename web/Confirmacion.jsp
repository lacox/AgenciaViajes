<%-- 
    Document   : Confirmacion
    Created on : 14 may 2025, 9:30:48 p.m.
    Author     : aleja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmación de Reserva</title>
        <link rel="stylesheet" href="estilos.css"/>
    </head>
    <body>
        <div id="Agrupar">
            <header id="cabecera">
                <h1>¡Reserva y Pago Completados!</h1>
            </header>
            <section id="seccion">
                <article>
                    <h2>Detalles de su Billete</h2>
                    <p><b>Nombre del pasajero:</b> <%= request.getAttribute("nombre") != null ? request.getAttribute("nombre") : "-" %></p>
                    <p><b>Vuelo:</b> <%= request.getAttribute("vuelo") != null ? request.getAttribute("vuelo") : "-" %></p>
                    <p><b>Origen:</b> <%= request.getAttribute("origen") != null ? request.getAttribute("origen") : "-" %></p>
                    <p><b>Destino:</b> <%= request.getAttribute("destino") != null ? request.getAttribute("destino") : "-" %></p>
                    <p><b>Fecha:</b> <%= request.getAttribute("fecha") != null ? request.getAttribute("fecha") : "-" %></p>
                    <p><b>Referencia de pago:</b> <%= request.getAttribute("referencia") != null ? request.getAttribute("referencia") : "-" %></p>
                    <p style="color:green; font-weight:bold;">¡Su billete ha sido emitido exitosamente!</p>
                </article>
            </section>
            <aside id="columna">
                <p>Gracias por confiar en Agencia de Viajes XYZ.</p>
                <p>Le hemos enviado un correo con los detalles de su reserva.</p>
            </aside>
            <footer id="pie">&copy; 2025 Agencia de Viajes XYZ</footer>
        </div>
    </body>
</html>
