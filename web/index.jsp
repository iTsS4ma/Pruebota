<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Iniciar Sesión</title>
        <script src="js/main.js"></script>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/javas.js"></script>
    </head>
    <body>
        <br><br><br><br>
        <h1>Login</h1>
        <form action="IniciodeSesion" method="POST" id="forminicio">
            <div class="form-group">
                <label>Usuario</label>
                <input type="text" name="Nombre" id="txtusuario" class="field" >
            </div>          
            <br>
            <div class="form-group">
                <label>Contraseña</label>
                <input type="password" name="Password" id="txtpass" class="field" >
            </div>            
            <br>           
            <input type="submit" id="btniniciar" class="btn btn-primary">Iniciar Sesión</input>
        </form>
    <center><a href="Registro.jsp">¿Aún no estás registrado?</a></center>
        
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>    
</html>
