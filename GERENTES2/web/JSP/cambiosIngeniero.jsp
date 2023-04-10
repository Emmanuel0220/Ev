<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<!DOCTYPE html>


<%! int Id_Reporte = 0;%>
<%! String Solucion = null;%>

<%!Statement stmt = null;%>
<%!ResultSet rs = null;%>
<%!Connection con = null;%>

<%    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    stmt = con.createStatement();
    /// rs = stmt.executeQuery("SELECT * FROM Reporte WHERE Estado = 'En proceso' " );
    
    Id_Reporte = Integer.parseInt(request.getParameter("Id_Reporte"));
    Solucion = request.getParameter("Solucion");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACTUALIZACION</title>
        <link rel="stylesheet" href="../VisualizaciónCSS.css">
        <META HTTP-EQUIV="REFRESH" CONTENT="2;URL=RespuestaVisibilidad.jsp">
    </head>
    <body>
        <center>
        <nav class="nav">
            <p>INGENIERO DE SOPORTE</p>
        </nav>
        
        <%
            if(Solucion.equals("")){
            stmt.executeUpdate("update Reporte set Id_Admini=4, Estado='Abierto', Solucion='' WHERE Id_Reporte=" + Id_Reporte + ";" );
            out.println("<br><h2> Ya que no brindo una solución ha sido reenviado con exito al Gerente de Soporte </h2><br>");
            }
            else {
            stmt.executeUpdate("update Reporte set Id_Admini=4, Estado='Cerrado', Solucion='" + Solucion + "' WHERE Id_Reporte=" + Id_Reporte + ";" );
            out.println("<br><h2> Se ha enviado tu solución al usuario </h2><br>");
            }
            %>
        
        <br><br><br><br></center>
    </body>
</html>
