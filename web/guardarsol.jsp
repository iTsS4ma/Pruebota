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
	<title>Guardar solución</title>
        <link rel="stylesheet" href="style.css">
</head>
<body>
	<%
		String id_reporte = request.getParameter("id");
                String status = request.getParameter("status");
                String area = request.getParameter("area");
		String solucion = request.getParameter("solucion");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
                Context ctx = new InitialContext();
                DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
                con = ds.getConnection();
                pstmt = con.prepareStatement("UPDATE reporte SET Status=?, Area=?, Solucion=?, Fecha=NOW() WHERE id=?");
                pstmt.setString(1, status);
                pstmt.setString(2, area);
                pstmt.setString(3, solucion);
                pstmt.setString(4, id_reporte);
                pstmt.executeUpdate();
        %>
        <p>Se han guardado los cambios del reporte con ID <%=id_reporte%>.</p>
        <a href = "IngenieroMan.jsp"><p>Volver</p></a>
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