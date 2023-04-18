<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>GerenteS</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function onChangeArea() {
    var area = document.getElementById("area").value;
    var status = document.getElementById("status");
    var status_label = document.getElementById("status_label");
    if (area === "Gerente de Soporte") {
        status.value = "Mantenimiento Finalizado";
        status_label.innerHTML = "Mantenimiento Finalizado";
    } else if (area === "Ingeniero de Mantenimiento") {
        status.value = "Programacion";
        status_label.innerHTML = "Programación";
    } else {
        status.value = "";
        status_label.innerHTML = "";
    }
}

    </script>
</head>
<body>
<div>
    <center>
        <a href="AsistenteSop.jsp"><button class="btn btn-blue same-size">Asistente de Soporte</button></a>
                <a href="GerenteSop.jsp"><button class="btn btn-blue same-size">Gerente de Soporte</button></a>
                <a href="GerenteMan.jsp"><button class="btn btn-blue same-size">Gerente de Mantenimiento</button></a>
                <a href="IngenieroMan.jsp"><button class="btn btn-blue same-size">Ingeniero de Mantenimiento</button></a>
                <a href="IngenieroSop.jsp"><button class="btn btn-blue same-size">Ingeniero de Soporte</button></a>
                <a href="Editor.jsp"><button class="btn btn-blue same-size">Editor de FAQ´s</button></a>
    </center>
</div>
<nr>
<center><h1>Reportes</h1></center>
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
            String area = rs.getString("area");
            String status = rs.getString("status");
        %>
        <%
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if(rs!=null) rs.close();
        if(stmt!=null) stmt.close();
        if(con!=null) con.close();
    } catch(Exception e){
        e.printStackTrace();
    }
}
%>
<center><h2>Editar reporte</h2></center>
<form action="guardar_solucion_1.jsp" method="post">
    <label for="id">ID del reporte:</label>
    <input type="text" name="id" value="<%= request.getParameter("id") %>" readonly><br><br>
    <label for="area">Área:</label>
    <select name="area" id="area" required onchange="onChangeArea()">
        <option value=""></option>
        <% 
try {
Context ctx = new InitialContext();
DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
con = ds.getConnection();
stmt = con.createStatement();
rs = stmt.executeQuery("SELECT usuario FROM usuarios WHERE usuario LIKE '%IngenieroM%'");
while(rs.next()){
String usuario = rs.getString("usuario");
        %>
        <option value="<%=usuario%>"><%=usuario%></option>
        <%
            }
} catch (Exception e) {
e.printStackTrace();
} finally {
try {
if(rs!=null) rs.close();
if(stmt!=null) stmt.close();
if(con!=null) con.close();
} catch(Exception e){
e.printStackTrace();
}
}
        %>
    </select><br><br>
    <input type="hidden" name="status" id="status" value="">
    <label for="status">Status: </label>
    <span id="status_label"></span><br><br>
    <input class="btn btn-blue" type="submit" value="Asignar">
</form>
</body>
</html>