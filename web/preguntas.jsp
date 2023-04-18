<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*,java.io.*"%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="style.css">

        
    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            

                           
                                <span>Consultas</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->

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
                                    <h2> FAQ's</h2>
                                </div>
                                <div class="col-lg-12">
                                    <div class="content">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <%
                                                    String admin = request.getParameter("admin");

                                                    Connection conx = null;
                                                    Statement stat = null;
                                                    ResultSet result = null;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        conx = DriverManager.getConnection("jdbc:mysql://localhost/reportes?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                                                        stat = conx.createStatement();
                                                    } catch (SQLException error) {
                                                        out.print(error.toString());
                                                    }
                                                    finally {
                                                        result = stat.executeQuery("select*from preguntas");
                                                        while (result.next()) {

                                                %>
                                                            <div class="col-lg-6" style="float: center; margin-left: 10px; ">
                                                                <div class="left-info" style="width: 600px;height: 400px; margin-left: 40%">
                                                                    <h3 style="text-align: center"><%=result.getString("pregunta")%> </h3>
                                                                    <p><%=result.getString("respuesta")%></p>
                                                                  
                                                                    <a href="eliminar-pregunta.jsp?paso=<%=result.getString("id_pregunta")%>&admin=<%=admin%>">
                                                                        <h5 style="color: white; font-family: sans-serif; text-align: justify; float: right">ELIMINAR</h5>
                                                                    </a>
                                                                </div>

                                                            </div>
                                                           



                                                        </div>


                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                        
                                    </div>

                                    <footer>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <p>  </p>
                                                </div>
                                            </div>
                                        </div>
                                    </footer>


                                    <!-- Scripts -->
                                    <!-- Bootstrap core JavaScript -->
                                    <script src="vendor/jquery/jquery.min.js"></script>
                                    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

                                    <script src="assets/js/isotope.min.js"></script>
                                    <script src="assets/js/owl-carousel.js"></script>
                                    <script src="assets/js/tabs.js"></script>
                                    <script src="assets/js/popup.js"></script>
                                    <script src="assets/js/custom.js"></script>


                                    </body>

                                    </html>
