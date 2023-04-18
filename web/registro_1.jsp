<%@page  import="java.sql.*"%>
<%@page import="java.lang.Math"%>
<%@page  import="java.sql.*"%>
<%@page  import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: black">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
        <title>Formulario FAQS</title>
    </head>
    <body style="font-family: sans-serif; color: black; background-image:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('img/login.png');">
        <%
            String nom=new String(request.getParameter("Pregunta").getBytes("ISO-8859-1"), "UTF-8");
            String ape=new String(request.getParameter("Respuesta").getBytes("ISO-8859-1"), "UTF-8");
            
            
            Random random = new Random();
            int cod = random.nextInt(1000000000)+1;
            
            Connection conx=null;
            Statement sta=null;
            ResultSet results=null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conx=DriverManager.getConnection("jdbc:mysql://localhost/reportes?autoReconnect=true&useSSL=false","root","n0m3l0");
                sta=conx.createStatement();
            }
            catch(SQLException error){
            out.print(error.toString());
            }
            try{
             
                
               
                sta.executeUpdate("insert into preguntas values('"+cod+"','"+nom+"','"+ape+"');");
                %>
               <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>  
               <script>alert('Pregunta Dada de Alta')</script> 
               <script type="text/javascript">
                       //Redireccionamiento tras 5 segundos
                       setTimeout( function() { window.location.href = "preguntas.jsp"; }, 1600 );
                    </script> 
                <%
                
                conx.close();
                sta.close();
            }
            catch(SQLException error){
            out.print(error.toString());
            }
        %>
    
    </body>
</html>