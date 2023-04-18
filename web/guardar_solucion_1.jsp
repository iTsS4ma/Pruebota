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
	<title>Guardar cambios</title>
        <link rel="stylesheet" href="style.css">
</head>
<body>
	<%
		String id_reporte = request.getParameter("id");
                String area = request.getParameter("area");
                String reporte = request.getParameter("reporte");
                String status = request.getParameter("status");
		String solucion = request.getParameter("solucion");
                String pregunta = request.getParameter("pregunta");
                String respuesta = request.getParameter("respuesta");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
                Context ctx = new InitialContext();
                DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
                con = ds.getConnection();
                pstmt = con.prepareStatement("UPDATE reporte SET Area=?, Status=?, Fecha=NOW()  WHERE id=?");
                pstmt.setString(1, area);
                pstmt.setString(2, status);
                pstmt.setString(3, id_reporte);
                pstmt.executeUpdate();
        %>
        <p>Se han guardado los cambios del reporte con ID <%=id_reporte%>.</p><br>
        <a href = "newgs.jsp"><p>Volver</p></a>
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
response.sendRedirect("GerenteMan.jsp"); 

        %>
</body>
</html>