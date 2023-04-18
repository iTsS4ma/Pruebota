<%@page  import="java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String cod=request.getParameter("paso");
            String admin=request.getParameter("admin");
            Connection cnx=null;
            Statement sta=null;
            ResultSet rs=null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                cnx=DriverManager.getConnection("jdbc:mysql://localhost/reportes?autoReconnect=true&useSSL=false","root","n0m3l0");
                sta=cnx.createStatement();
                sta.executeUpdate("delete from preguntas where id_pregunta='"+cod+"';");
                request.getRequestDispatcher("preguntas.jsp?admin="+admin).forward(request,response);
                sta.close();
                rs.close();
                cnx.close();
            }
            catch(SQLException error){
            out.print(error.toString());
            }
        %>
    </body>
</html>
