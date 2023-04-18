<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mostrar Reporte</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%
        String reporteId = request.getParameter("id");
        if (reporteId == null) {
            out.println("<h1>Error: falta el parámetro 'id'.</h1>");
            return;
        }

        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
            con = ds.getConnection();
            stmt = con.prepareStatement("SELECT * FROM Reporte WHERE id = ?");
            stmt.setString(1, reporteId);
            rs = stmt.executeQuery();

            if (!rs.next()) {
                out.println("<h1>Error: no se encontró el reporte con ID " + reporteId + ".</h1>");
                return;
            }

            String titulo = rs.getString("titulo");
            String descripcion = rs.getString("descripcion");
            String fechaCreacion = rs.getString("fecha_creacion");
            String estado = rs.getString("estado");
            String asignadoA = rs.getString("asignado_a");

            out.println("<h1>Reporte #" + reporteId + "</h1>");
            out.println("<p><strong>Título:</strong> " + titulo + "</p>");
            out.println("<p><strong>Descripción:</strong> " + descripcion + "</p>");
            out.println("<p><strong>Fecha de creación:</strong> " + fechaCreacion + "</p>");
            out.println("<p><strong>Estado:</strong> " + estado + "</p>");
            out.println("<p><strong>Asignado a:</strong> " + asignadoA + "</p>");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception e){
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
