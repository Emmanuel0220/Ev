<%-- 
    Document   : altapropiedades
    Created on : 21 mar 2023, 08:08:40
    Author     : alumno
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Statement stmt = null;%>
<%!ResultSet rs = null; %>
<%!Connection conn = null; %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String titulo = request.getParameter("titulo");
           Base bd = new Base ();
           try{
               bd.conectar();
               String subir = "select * from solicitud where tituloS = '"+titulo+"'";
               String strQryPer = "delete from solicitud where tituloS = '"+titulo+"'";
               ResultSet info = bd.consulta(subir);
               Class.forName("com.mysql.jdbc.Driver").newInstance ();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/escuelajdb2?user=root&password=n0m3l0");
                stmt = conn.createStatement();
               while (info.next()) {
                String Banos = info.getString("BanosS");
                System.out.println(Banos);
                String Habitaciones = info.getString("HabitacionesS"); 
                System.out.println(Habitaciones);
                String imagen = info.getString("ImagenS");
                System.out.println(imagen);
                String Costo = info.getString("CostoS");
                System.out.println(Costo);
                String infor = info.getString("InfoS");
                System.out.println(infor);
                String Titulo = info.getString("tituloS");
                System.out.println(Titulo);
                String garage = info.getString("garageS");
                System.out.println(garage);
                String tamano = info.getString("tamanoS");
                System.out.println(tamano);
                String usuario = info.getString("usuarioS");
                System.out.println(usuario);
                String Id = info.getString("Id_usuS");
                System.out.println(Id);
                stmt.executeUpdate("INSERT INTO publicacion (Banos,Habitaciones,Imagen,Costo,Info,titulo,garage,tamano,usuario, Id_prop) "
                + "VALUES("+"'" + Banos + "','"+ Habitaciones +"','"+ imagen +"','"+ Costo +"','"+infor+"','"
                + Titulo +"','"+ garage +"','"+ tamano +"','"+ usuario +"','"+ Id +"')");
            }
               int resultadoBorra = bd.borrar(strQryPer);
               response.sendRedirect("altas_Admin.jsp");
           }
           catch (Exception XD){
               
           }
       %>
       <p><%=titulo%></p>
    </body>
</html>
