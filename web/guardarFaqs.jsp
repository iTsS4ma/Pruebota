<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Guardar cambios</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
		String id_reporte = request.getParameter("id");
		String reporte = "";
		String solucion = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
			con = ds.getConnection();

			// Buscamos los datos del reporte en la tabla reporte
			pstmt = con.prepareStatement("SELECT reporte, solucion FROM reporte WHERE id = ?");
			pstmt.setString(1, id_reporte);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				reporte = rs.getString("reporte");
				solucion = rs.getString("solucion");
			}

			// Insertamos los datos del reporte en la tabla faqs
			pstmt = con.prepareStatement("INSERT INTO faqs (pregunta, respuesta) VALUES (?, ?)");
			pstmt.setString(1, reporte);
			pstmt.setString(2, solucion);
			pstmt.executeUpdate();

			// Mostramos un mensaje de éxito y un enlace para volver a la página anterior
			out.println("<p>Se han guardado los cambios del reporte con ID " + id_reporte + ".</p><br>");
			out.println("<a href='reportesFinalizados.jsp'><p>Volver</p></a>");
		} catch (Exception e) {
			e.printStackTrace();
                        
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e){
				e.printStackTrace();
			}
                        response.sendRedirect("faqs.jsp"); 

		}
	%>
</body>
</html>
