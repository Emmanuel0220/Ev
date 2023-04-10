
<%@page import="conexion.Base"%>
<%@page import="java.sql.ResultSet"%>

<%
            
            String usr = request.getParameter("Tipo_Admin");
            String pswd = request.getParameter("Contrasena_Vend");
            Base bd = new Base();
                   
                    String strQry="Select*from Admini where Tipo_Admin='"+usr+"' and Contrasena_Vend = '"+pswd+"'";
                    ResultSet rsValidarUsr = null;
            switch(usr) {
                case "GerenteS":
                   
                    bd.conectar();
                    rsValidarUsr = bd.consulta(strQry);
                    if(rsValidarUsr.next()){
                    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                    int idPersona= rsValidarUsr.getInt("Id_Admini");
                    String correo = rsValidarUsr.getString("Contrasena_Vend");
                    miSessiondelUsuario.setAttribute("Id_Admini", idPersona);                                   
                    miSessiondelUsuario.setAttribute("Contrasena_Vend", correo);
                    response.sendRedirect("solicitudes.jsp");
            }
                break;
                    
                case "GerenteM":
                    
                    bd.conectar();
                    rsValidarUsr = bd.consulta(strQry);
                    if(rsValidarUsr.next()){
                    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                    int idPersona= rsValidarUsr.getInt("Id_Admini");
                    String correo = rsValidarUsr.getString("Contrasena_Vend");
                    miSessiondelUsuario.setAttribute("Id_Admini", idPersona);                                   
                    miSessiondelUsuario.setAttribute("Contrasena_Vend", correo);
                    response.sendRedirect("solicitudes2.jsp");
            }
                break;
                    
                case "IngenieroS":
                   
                    bd.conectar();
                    rsValidarUsr = bd.consulta(strQry);
                    if(rsValidarUsr.next()){
                    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                    int idPersona= rsValidarUsr.getInt("Id_Admini");
                    String correo = rsValidarUsr.getString("Contrasena_Vend");
                    miSessiondelUsuario.setAttribute("Id_Admini", idPersona);                                   
                    miSessiondelUsuario.setAttribute("Contrasena_Vend", correo);
                    response.sendRedirect("RespuestaVisibilidad.jsp");
            }
                break;
                    
                case "IngenieroM":
                   
                    bd.conectar();
                    rsValidarUsr = bd.consulta(strQry);
                    if(rsValidarUsr.next()){
                    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                    int idPersona= rsValidarUsr.getInt("Id_Admini");
                    String correo = rsValidarUsr.getString("Contrasena_Vend");
                    miSessiondelUsuario.setAttribute("Id_Admini", idPersona);                                   
                    miSessiondelUsuario.setAttribute("Contrasena_Vend", correo);
                    response.sendRedirect("solicitudes3.jsp");
            }
                break;    
                    
                case "Asistente":
                   
                    bd.conectar();
                    rsValidarUsr = bd.consulta(strQry);
                    if(rsValidarUsr.next()){
                    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                    int idPersona= rsValidarUsr.getInt("Id_Admini");
                    String correo = rsValidarUsr.getString("Contrasena_Vend");
                    miSessiondelUsuario.setAttribute("Id_Admini", idPersona);                                   
                    miSessiondelUsuario.setAttribute("Contrasena_Vend", correo);
                    response.sendRedirect("../html/registrar.html");
            }
                break;     
                    
                default:
                    response.sendRedirect("Login.jsp");
                break;
            }
            
%>            
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         
                 <style>
    @import url('https://fonts.googleapis.com/css2?family=Mulish:wght@300&display=swap');
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equivocado</title>
        <header>
		<a class="logo" href="/"><img src="../Imagenes/LogoB.png" alt="logo" width="100px" height="100px"></a>
		
	</header>
    </head>
    <body><center>
        <br><br><br>
        <h1 class="contenedor">Usuario no reconocido, vuelve a intentarlo</h1>
        <br><br><br>
        <button ><a href="Login.jsp">Regresar</a></button>
    </body>
</html>

