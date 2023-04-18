<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="form.css">
        <title>Solución Mantenimiento</title>
    </head>
    <body>
        <br><br><br>
            <form action="noguardarsol1.jsp" method="post" class="form">
                <h2 class="form_title">Reporte Solucionado</h2>
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
                        <span class="form_line"></span>
                    </div>
                    <div class="form_group">
                        <input type="hidden" class="form_input" placeholder=" " name="area" value="Gerente de Mantenimiento">
                        <label for="area" class="form_label">Área:</label>
                        <span class="form_line">Gerente de Mantenimiento</span>
                    </div>
                    <input type="submit" class="form_submit" value="Guardar solución">
                </div>
            </form>
    </body>
</html>
