<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editor</title>
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
                <a href="faqs.jsp"><button class="btn btn-blue same-size">FAQ´s</button></a>
            </center>
        </div><br>
    <center><h1>Reportes cerrados/finalizados</h1></center>
        <table border = "1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descrpción</th>
                    <th>Solución</th>
                    <th></th>
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
                    rs = stmt.executeQuery("SELECT * FROM reporte WHERE Area='Editor'");
                    while(rs.next()){
                    String id = rs.getString("id");
                    String reporte = rs.getString("reporte");
                    String solucion = rs.getString("solucion");                
                %>
                <tr>
                    <td><%=id%></td>
                    <td><%=reporte%></td>
                    <td><%=solucion%></td>
                    <td>
                        <a href="guardarFaqs.jsp?id=<%=id%>">
                            <button class="btn">Subir</button>
                        </a>
                    </td>
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
    </body>
</html>