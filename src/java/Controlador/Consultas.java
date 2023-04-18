package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Consultas extends Conexion{
    
    public boolean autenticacion(String Nombre, String Password){
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            String consulta = "SELECT * FROM usuarios WHERE Usuario = ? and Contraseña = ?";
            ps = ps = getConexion().prepareStatement(consulta, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setString(1, Nombre);
            ps.setString(2, Password);
            rs = ps.executeQuery();
            
            if(rs.absolute(1)){
                return true;
            }
            
        } catch (Exception e) {
            System.err.println("Error" + e);
        }finally{
            try {
                if(getConexion() != null) getConexion().close();
                if(ps != null) ps.close();
                if(rs != null) rs.close();
            } catch (Exception e) {
                System.err.println("Error" + e);
            }
        }   
        return false;
    }    
    public boolean registrar(String Nombre, String Correo, String Password, String Puesto){
        PreparedStatement ps = null;
        
        try {
            String consulta = "INSERT INTO usuarios(Usuario, Email, Contraseña, Rol) VALUES(?, ?, ?, ?)";
            ps = getConexion().prepareStatement(consulta, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setString(1, Nombre);
            ps.setString(2, Correo);
            ps.setString(3, Password);
            ps.setString(4, Puesto);            
            
            if(ps.executeUpdate() == 1){
                return true;
            }
                    
        } catch (Exception ex) {
            System.err.println("Error" + ex);
        }finally{
            try {
                if(getConexion() != null) getConexion().close();
                if(ps != null) ps.close();
            } catch (Exception e) {
                System.err.println("Error" + e);
            }
        }
        return false;
    }
}
