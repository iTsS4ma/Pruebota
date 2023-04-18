<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="form.css">
        <title>Solución Soporte</title>
    </head>
    <body>
        <br><br><br>
            <form action="guardarsol2.jsp" method="post" class="form">
                <h2 class="form_title">Agregar solución a reporte</h2>
                <div class="form_container">
                    <div class="form_group">
                        <label for="id">ID del reporte:</label>
                        <input type="text" class="form_input" placeholder="" name="id" value="<%= request.getParameter("id") %>" readonly><br><br>
                        <span class="form_line"></span>
                    </div>
                    <div class="form_group">
                        <input type="hidden" name="status" value="Cerrado">
                        <select name="status" class="form_input" placeholder=" " id="status" disabled>
                            <option value="Cerrado">Cerrado</option>
                        </select>
                        <label for="status" class="form_label">Status: </label>
                    </div>
                    <div class="form_group">
                        <input type="hidden" name="area" value="Editor">
                        <select name="area" class="form_input" placeholder=" " id="area" disabled>
                            <option value="Editor">Editor</option>
                        </select>
                        <label for="status" class="form_label">Status: </label>
                        <span class="form_line"></span>
                    </div>
                    <%
                        String id = request.getParameter("id");
                        Connection con = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        try {
                        Context ctx = new InitialContext();
                        DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
                        con = ds.getConnection();
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("SELECT solucion FROM reporte WHERE id='" + id + "'");
                        if (rs.next()) {
                        String solucion = rs.getString("solucion");
    if (solucion.equals("No asignado")) {
                    %>
                    <div class="form_group">
                        <textarea name="solucion" class="form_input" placeholder=" " required></textarea>
                        <label for="solucion" class="form_label">Solución:</label>
                        <span class="form_line"></span>
                    </div>
                    <%
                        } else {
                    %>
                    <div class="form_group">
                        <textarea name="solucion" class="form_input" placeholder="<%= solucion %>" readonly></textarea>
                        <label for="solucion" class="form_label">Solución:</label>
                        <span class="form_line"></span>
                    </div>
                    <%
                        }
}
} catch (Exception e) {
e.printStackTrace();
} finally {
try {
if (rs != null) rs.close();
if (stmt != null) stmt.close();
if (con != null) con.close();
} catch(Exception e) {
e.printStackTrace();
}
}
                    %>
                    <input type="submit" class="form_submit" value="Guardar solución">
                </div>
            </form>
    </body>
</html>