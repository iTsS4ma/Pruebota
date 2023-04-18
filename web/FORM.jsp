<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Reporte de Mantenimiento/Soporte</title>
        <link rel="stylesheet" href="style.css">
</head>
<body>
    <br>
	<h1 class="h1">Reporte de Mantenimiento/Soporte</h1>
        <br><br>
	<form action="guardado.jsp" method="post">
		<label for="nombre">Nombreaaaaaaaaaaaaaaaaaaaaaaaaa:</label>
		<input type="text" name="nombre" id="nombre" required><br><br>
		<label for="reporte">Reporte:</label>
		<textarea name="reporte" id="reporte" rows="1" required></textarea><br><br>
		<label for="area">Área:</label>
		<select name="area" id="area" required>
                    <option value=""></option>
                    <option value="Asistente de Soporte">Asistente deaaaaaaaaaa Soporte</option>
                    <option value="Gerente de Soporte">Gerente de Soporte</option>
                    <option value="Gerente de Mantenimiento">Gerente de Mantenimiento</option>
                    <option value="Ingeniero de Soporte">Ingeniero de Soporte</option>
                    <option value="Ingeniero de Mantenimiento">Ingeniero de Mantenimiento</option>
                    <option value="Editor">Editor</option>
		</select><br><br>
                <label for="nombre">Status</label>
                <input type="text" name="status" id="status" required><br><br>
                <input type="submit" value="Guardar">
	</form>
</body>
</html>
