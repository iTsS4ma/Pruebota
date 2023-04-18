<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="css/estilos.css">
    <title>Preguntas Frecuentes</title>
</head>
<body><br><br>
<center><a href="GerenteSop.jsp"><button class="btn btn-blue same-size">Gerente de Soporte</button></a>
                <a href="GerenteMan.jsp"><button class="btn btn-blue same-size">Gerente de Mantenimiento</button></a>
                <a href="IngenieroMan.jsp"><button class="btn btn-blue same-size">Ingeniero de Mantenimiento</button></a>
                <a href="IngenieroSop.jsp"><button class="btn btn-blue same-size">Ingeniero de Soporte</button></a>
                <a href="AsistenteSop.jsp"><button class="btn btn-blue same-size">Asistente de Soporte</button></a>
                <a href="Editor.jsp"><button class="btn btn-blue same-size">Editor de FAQ´s</button></a></center>
                
    <main>
        <h1 class="titulo">Preguntas Frecuentes</h1>
        <button onclick="window.location.href='preguntasfaqs.jsp'"">Altas FAQ'S</button>
        <div class="categorias" id="categorias">
            <div class="categoria" data-categoria="entregas">
                <svg viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M7 24h-5v-9h5v1.735c.638-.198 1.322-.495 1.765-.689.642-.28 1.259-.417 1.887-.417 1.214 0 2.205.499 4.303 1.205.64.214 1.076.716 1.175 1.306 1.124-.863 2.92-2.257 2.937-2.27.357-.284.773-.434 1.2-.434.952 0 1.751.763 1.751 1.708 0 .49-.219.977-.627 1.356-1.378 1.28-2.445 2.233-3.387 3.074-.56.501-1.066.952-1.548 1.393-.749.687-1.518 1.006-2.421 1.006-.405 0-.832-.065-1.308-.2-2.773-.783-4.484-1.036-5.727-1.105v1.332zm-1-8h-3v7h3v-7zm1 5.664c2.092.118 4.405.696 5.999 1.147.817.231 1.761.354 2.782-.581 1.279-1.172 2.722-2.413 4.929-4.463.824-.765-.178-1.783-1.022-1.113 0 0-2.961 2.299-3.689 2.843-.379.285-.695.519-1.148.519-.107 0-.223-.013-.349-.042-.655-.151-1.883-.425-2.755-.701-.575-.183-.371-.993.268-.858.447.093 1.594.35 2.201.52 1.017.281 1.276-.867.422-1.152-.562-.19-.537-.198-1.889-.665-1.301-.451-2.214-.753-3.585-.156-.639.278-1.432.616-2.164.814v3.888zm3.79-19.913l3.21-1.751 7 3.86v7.677l-7 3.735-7-3.735v-7.719l3.784-2.064.002-.005.004.002zm2.71 6.015l-5.5-2.864v6.035l5.5 2.935v-6.106zm1 .001v6.105l5.5-2.935v-6l-5.5 2.83zm1.77-2.035l-5.47-2.848-2.202 1.202 5.404 2.813 2.268-1.167zm-4.412-3.425l5.501 2.864 2.042-1.051-5.404-2.979-2.139 1.166z"/></svg>
                <p>FAQ´s</p>
            </div>
        </div>  
        <div class="preguntas">
            <div class="contenedor-pregunta" data-categoria="entregas">
                
                
                    
               
                
                <%
Connection conexion = null;
String url = "jdbc:mysql://localhost:3306/reportes";
String usuario = "root";
String contraseña = "n0m3l0";
try {
    conexion = DriverManager.getConnection(url, usuario, contraseña);
    String consulta = "SELECT * FROM reporte";
    Statement statement = conexion.createStatement();
    ResultSet resultSet = statement.executeQuery(consulta);
    while (resultSet.next()) {
        String dato1 = resultSet.getString("Pregunta");
        String dato2 = resultSet.getString("Respuesta");
        %>
        <div class="contenedor-pregunta">
            <p class="pregunta"><%= dato1 %><button onclick="mostrarVentana('<%=dato2%>')"><i class='fas fa-plus' style='font-size:36px'></button></i></p>
            <p class="respuesta"><%= dato2 %></p>
        </div>
        <% 
    }
} catch (SQLException e) {
    out.println("Error al conectar a la base de datos: " + e.getMessage());
} finally {
    try {
        if (conexion != null) {
            conexion.close();
        }
    } catch (SQLException e) {
        out.println("Error al cerrar la conexión: " + e.getMessage());
    }
}
%>

            </div>
        </div>
    </main>
    <div id="popup-container">
        <div id="popup-content"></div>
    </div>


    <script>
        function mostrarVentana(respuesta) {
            var popup = document.getElementById("popup-container");
            var popupContent = document.getElementById("popup-content");
            popup.style.display = "block";
            popupContent.innerHTML = respuesta;
        }
        window.onclick = function(event) {
            var popup = document.getElementById("popup-container");
            if (event.target == popup) {
                popup.style.display = "none";
            }
        }
    </script>
</body>
</html>

