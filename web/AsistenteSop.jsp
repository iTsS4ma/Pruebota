<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Asistonto</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div><center>
                <a href="AsistenteSop.jsp"><button class="btn btn-blue same-size">Asistente de Soporte</button></a>
                <a href="GerenteSop.jsp"><button class="btn btn-blue same-size">Gerente de Soporte</button></a>
                <a href="GerenteMan.jsp"><button class="btn btn-blue same-size">Gerente de Mantenimiento</button></a>
                <a href="IngenieroMan.jsp"><button class="btn btn-blue same-size">Ingeniero de Mantenimiento</button></a>
                <a href="IngenieroSop.jsp"><button class="btn btn-blue same-size">Ingeniero de Soporte</button></a>
                <a href="Editor.jsp"><button class="btn btn-blue same-size">Editor de FAQ´s</button></a>
            </center>
        </div><br>
    <center><h1>Reportes redactados</h1></center>
        <table border = "1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Area</th>
                    <th>Status</th>
                    <th>Fecha</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                    Context ctx = new InitialContext();
                    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
                    con = ds.getConnection();
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM reporte");
                    while(rs.next()){
                    String id = rs.getString("id");
                    String nombre = rs.getString("nombre");
                    String reporte = rs.getString("reporte");
                    String area = rs.getString("area");
                    String status = rs.getString("status");
                    String fecha = rs.getString("fecha");
                %>
                <tr>
                    <td><%=id%></td>
                    <td><%=nombre%></td>
                    <td><%=reporte%></td>
                    <td><%=area%></td>
                    <td><%=status%></td>
                    <td><%=fecha%></td>
                </tr>
                <%
                    }
} 
catch (Exception e) {
e.printStackTrace();
} 
finally {
try {
if(rs!=null) rs.close();
if(stmt!=null) stmt.close();
if(con!=null) con.close();
} 
catch(Exception e){
e.printStackTrace();
}
}
                %>
            </tbody>
        </table>
    <center><h2>Redactar reporte</h2></center>
	<form action="guardado.jsp" method="post">
            <label for="nombre">Nombre de Usuario:</label>
            <input type="nombre" name="nombre" class="field" required><br><br>
            <label for="reporte">Descripción:</label>
            <input type="reporte" name="reporte" class="field" required><br><br>
                <label for="area">Área:</label><br>
                <select name="area" id="area" disabled>
                    <option value="Gerente de Soporte" selected>Gerente de Soporte</option>
                </select>
                <input type="hidden" name="area" value="Gerente de Soporte"><br><br>
                <label for="status">Status</label><br>
                <select name="status" id="status" disabled>
                    <option value="Abierto" selected>Abierto</option>
                </select>
                <input type="hidden" name="status" value="Abierto">
                <input type="submit" class="btn btn-blue"value="Guardar">
	</form>
    </body>
</html>