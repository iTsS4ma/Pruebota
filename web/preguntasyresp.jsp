<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Redactar preguntas y respuestas</title>
    </head>
    <body>
        <br><br><br>
            <center><h2>Agregar solución a reporte</h2></center><br><br>
            <form action="guardarpr.jsp" method="post">
    <label for="id">ID del reporte:</label>
    <input type="text" name="id" value="<%= request.getParameter("id") %>" readonly><br><br>
    <label for="pregunta">Pregunta</label>
    <input type="text" class="field" name="pregunta" required><br><br>
    <label for="respuesta">Respuesta</label>
    <input type="text" class="field" name="respuesta" required><br><br>
    <input type="submit" class="btn btn-blue" value="Guardar">
</form>

    </body>
</html>
