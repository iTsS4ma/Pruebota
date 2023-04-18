<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Guardar pregunta</title>
        <link rel="stylesheet" href="style.css">    
</head>
<body>
	<%
		String id_reporte = request.getParameter("id");
                String pregunta = request.getParameter("pregunta");
		String respuesta = request.getParameter("respuesta");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
                Context ctx = new InitialContext();
                DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
                con = ds.getConnection();
                pstmt = con.prepareStatement("UPDATE reporte SET Pregunta=?, Respuesta=?, Fecha=NOW() WHERE id=?");
                pstmt.setString(1, pregunta);
                pstmt.setString(2, respuesta);
                pstmt.setString(3, id_reporte);
                pstmt.executeUpdate();
        %>
        <p>Se ha guardado la pregunta del reporte con ID <%=id_reporte%>.</p>
        <a href = "Editor.jsp"><p>Volver</p></a>
        <%
            } catch (Exception e) {
e.printStackTrace();
} finally {
try {
if(pstmt!=null) pstmt.close();
if(con!=null) con.close();
} catch(Exception e){
e.printStackTrace();
}
}
        %>
</body>
</html>