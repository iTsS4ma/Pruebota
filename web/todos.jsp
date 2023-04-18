<link rel="stylesheet" href="style.css">
<%@ page import="java.sql.*" %>
<%
   String url = "jdbc:mysql://localhost/reportes";
   String username = "root";
   String password = "n0m3l0";
   Connection conn = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   try {
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(url, username, password);
       stmt = conn.prepareStatement("SELECT * FROM reporte");
       rs = stmt.executeQuery();
%>
       <table border="1">
           <tr>
               <th>Nombre</th>
               <th>Reporte</th>
               <th>Fecha</th>
               <th>Area</th>
               <th>Status</th>
               <th>Solución</th>
               <th>Pregunta</th>
               <th>Respuesta</th>
           </tr>
<%
           while (rs.next()) {
%>
               <tr>
                   <td><%= rs.getString("Nombre") %></td>
                   <td><%= rs.getString("Reporte") %></td>
                   <td><%= rs.getString("Fecha") %></td>
                   <td><%= rs.getString("Area") %></td>
                   <td><%= rs.getString("Status") %></td>
                   <td><%= rs.getString("Solucion") %></td>
                   <td><%= rs.getString("Pregunta") %></td>
                   <td><%= rs.getString("Respuesta") %></td>
               </tr>
<%
           }
%>
       </table>
<%
   } catch (Exception e) {
       e.printStackTrace();
   } finally {
       try { if (rs != null) rs.close(); } catch (Exception e) {};
       try { if (stmt != null) stmt.close(); } catch (Exception e) {};
       try { if (conn != null) conn.close(); } catch (Exception e) {};
   }
%>
