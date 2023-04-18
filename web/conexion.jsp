<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost/reportes";
    String username = "root";
    String password = "n0m3l0";
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        out.println("Conexión establecida");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error al conectar a la base de datos");
    } finally {
        try { if (conn != null) conn.close(); } catch (Exception e) {};
    }
%>
