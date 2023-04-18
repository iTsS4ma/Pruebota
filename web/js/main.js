/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

window.addEventListener('load', function (){
    document.getElementById('btniniciar').addEventListener('click', function (){
       var nombre = document.getElementById('txtusuario').value;
       var contraseña = document.getElementById('txtpass').value;
       
       var bandera = false;
       
       if(nombre.length > 0 && contraseña.length > 0){
           bandera = true;
       }
       
       if(bandera){
           document.getElementById('forminicio').submit();
       }else{
           alert('Por favor no deje vacíos los campos');
       }
    });
});
