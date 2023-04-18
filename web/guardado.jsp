<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guardar Reporte</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Guardar Reporte</h1>
    <%
        String reporte = request.getParameter("reporte");
        String area = request.getParameter("area");
        String nombre = request.getParameter("nombre");
        String status = request.getParameter("status");
        String url = "jdbc:mysql://localhost:3306/reportes";
        String user = "root";
        String password = "n0m3l0";
        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            String query = "INSERT INTO reporte (Reporte, Nombre, Fecha, Area, Status, Solucion, Pregunta, Respuesta) VALUES (?, ?, NOW(), ?, ?, 'No asignado', 'No asignado', 'No asignado')";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, reporte);
            pst.setString(2, nombre);
            pst.setString(3, area);
            pst.setString(4, status);
            pst.executeUpdate();
            conn.close();
            response.sendRedirect("AsistenteSop.jsp");
        } catch (SQLException e) {
            out.println("Error al guardar el reporte: " + e.getMessage());
        }
    %>
</body>
</html>
