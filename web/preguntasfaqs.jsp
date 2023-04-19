<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <title> ABC </title>

         <link rel="stylesheet" href="style.css">
        <script>
            var queryString = window.location.search;
            var urlParams = new URLSearchParams(queryString);
            var userParam = urlParams.get('admin');
            function inicio() {
                window.location.href = ("superG.html?admin=" + userParam);
            }
            function preguntas() {
                window.location.href = ("preguntass.jsp?admin=" + userParam);
            }
        </script>
    </head>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="page-content">

                        <!-- ***** Featured Start ***** -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="feature-banner header-text">
                                    <div class="row">
                                        <div class="col-lg-8">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ***** Featured End ***** -->

                        <!-- ***** Details Start ***** -->
                        <div class="game-details">
                            <div class="row">
                                
                                <div class="col-lg-12">
                                    <div class="content">
                                        <div class="row" style="color: white">
                                            <h1>FAQ's</h1>
                                            <br><br>
                                           

                                            <form action="registro_1.jsp" method="post" id="contact_form" name="form" >
                                                <div class="nombre">
                                                    <label for="pregunta"></label>
                                                    <h5>Ingresa tu pregunta</h5>
                                                    <br>
                                                    <input type="text" placeholder="Pregunta" name="Pregunta" pattern="^[a-zA-ZÀ-ÿ\u00f1\u00d1\u00E0-\u00FC]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1\u00E0-\u00FC]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1\u00E0-\u00FC]+$" id="name_input" required >
                                                </div>
                                                <div class="apellidos">
                                                    <label for="Respuesta"></label>
                                                    <h5>Ingresa tu respuesta</h5>
                                                    <br>
                                                    <input type="text" placeholder="Respuesta" name="Respuesta" pattern="^[a-zA-ZÀ-ÿ\u00f1\u00d1\u00E0-\u00FC]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1\u00E0-\u00FC]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1\u00E0-\u00FC]+$" required>
                                                </div>
                                                <input type="submit" value="Registrar" id="form_button" style="font-size: 14px;
                                                           color: #fff;
                                                           background-color: #76b6d6;
                                                           padding: 12px 30px;
                                                           display: inline-block;
                                                           border-radius: 25px;
                                                           font-weight: 400;
                                                           text-transform: capitalize;
                                                           letter-spacing: 0.5px;
                                                           transition: all .3s;
                                                           position: relative;
                                                           overflow: hidden;" />
                                        </div>
                                        </form><!-- // End form --> 
                                        <h2>Consulta de preguntas</h2>
                                        <br><br>
                                        <div class="main-button">
                                        <a  href="javascript:void(0)" onclick="preguntas()"> Historial de Preguntas </a>
                                        </div>
                                        <br>
                                       

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-button">


    </div>
</div>


</html>