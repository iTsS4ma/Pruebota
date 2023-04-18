package Servlet;

import Controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author luisc
 */
@WebServlet(name = "IniciodeSesion", urlPatterns = {"/IniciodeSesion"})
public class IniciodeSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Nombre = request.getParameter("Nombre");
        String Password = request.getParameter("Password");
        
        Consultas co = new Consultas();
        if(co.autenticacion(Nombre, Password)){
            HttpSession objsesion = request.getSession(true);
            objsesion.setAttribute("Nombre", Nombre);
            if(Nombre.equals("AsistenteS")){
                response.sendRedirect("AsistenteSop.jsp");
            }else if(Nombre.equals("GerenteS")){
                response.sendRedirect("GerenteSop.jsp");
            }else if(Nombre.equals("GerenteM")){
                response.sendRedirect("GerenteMan.jsp");
            }else if(Nombre.equals("IngenieroS")){
                response.sendRedirect("IngenieroSop.jsp");   
            }else if(Nombre.equals("IngenieroM")){
                response.sendRedirect("IngenieroMan.jsp");
            }else if(Nombre.equals("Editor")){
                response.sendRedirect("Editor.jsp");
            }
        }else{
            response.sendRedirect("index.jsp");
        }        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
