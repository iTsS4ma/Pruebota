<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
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
        String consulta = "SELECT * FROM preguntas";
        Statement statement = conexion.createStatement();
        ResultSet resultSet = statement.executeQuery(consulta);
        while (resultSet.next()) {
          String dato1 = resultSet.getString("Pregunta");
          String dato2 = resultSet.getString("Respuesta");
          System.out.println("Pregunta: " + dato1 + ", Respuesta: " + dato2);
    %>
    <div class="contenedor-pregunta">
      <div class="pregunta" data-respuesta="<%= dato2 %>">
        <p><%= dato1 %></p>
        <button class="mostrar-respuesta"><i class='fas fa-plus' style='font-size:36px'></i></button>
      </div>
      <div class="respuesta oculta"></div>
    </div>
    <% 
        }
      } catch (SQLException e) {
        System.out.println("Error: " + e.getMessage());
      }
    %>
  </div>
</div>
    </main>
<script>
  function toggleAnswer(element) {
  const respuesta = element.parentNode.querySelector(".respuesta");
  const textoRespuesta = element.getAttribute("data-respuesta");
  respuesta.textContent = textoRespuesta;
  respuesta.classList.toggle("oculta");
}


  const preguntas = document.querySelectorAll(".pregunta");
  preguntas.forEach((pregunta) => {
    pregunta.addEventListener("click", () => {
      toggleAnswer(pregunta);
    });
  });
</script>
</body>
</html>
