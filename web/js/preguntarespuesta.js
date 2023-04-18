function mostrarVentana() {
    // 2. Crear una ventana emergente
    var ventanaEmergente = window.open("", "Ventana emergente", "width=400,height=300");

    // 3. Establecer las propiedades de la ventana emergente
    ventanaEmergente.moveTo(500, 200);

    // 4. Escribir el contenido que deseas mostrar en la ventana emergente
    ventanaEmergente.document.write("<h1>Contenido de la ventana emergente</h1>");
    ventanaEmergente.document.write("<p>Esta es una ventana emergente que se abrió al hacer clic en un botón.</p>");

    // 5. Mostrar la ventana emergente
    ventanaEmergente.focus();
}