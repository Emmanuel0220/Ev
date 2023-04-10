<%-- 
    Document   : solicitudes3
    Created on : 4 abr 2023, 22:27:07
    Author     : Dylan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%!Statement stmt_consul = null;%>
<%!Connection conn = null;%>
<%!ResultSet rs = null; %>
<% String Id_Administrador = null; %>

<% String Descripcion = null; %>
<% String Hora = null; %>
<% String Fecha = null; %>

<% String contra = null; %>
<% String Estado = null; %>

<%Statement stmt = null;%>
<%! String Id_Reporte = null; %>
<% String Id_Usu = null; %>
<% String Solucion = null; %>

<%!ResultSet rs2 = null;%>
<%!Connection con = null;%>
<%--
<%!ResultSet rs3 = null;%>
<%!Connection connn = null;%>
--%>
<html>
    <head>
        <%--<link rel="stylesheet" href="../estilos.css">--%>
        <TITLE>Soli </TITLE> 
        
        
    </head>
    <%
    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
    int idPersona = (int) (miSessiondelUsuario.getAttribute("Id_Admini") == null ? 0 : miSessiondelUsuario.getAttribute("Id_Admini"));
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    //connn = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    stmt_consul = conn.createStatement();
    stmt = con.createStatement();
    rs = stmt_consul.executeQuery("SELECT * FROM Admini where Id_Admini ='"+idPersona+"'");
    while (rs.next()) {                 
            Id_Administrador = rs.getString("Tipo_Admin");
        }
          

            //cerrar  la conexi?n
            try {
                conn.close();
            } catch (SQLException sqlEx) {
            };
    rs2 = stmt.executeQuery("SELECT * FROM Reporte where Estado='En Programacion'");
    //rs3 = stmt.executeQuery("SELECT * FROM Reporte where Estado='En Programacion'");
    %>
    <body style="background-color: #D1E7FF;">
        <right> <a href="salir.jsp">Cerrar Sesi&oacute;n</a></right>
        <center><div>
                <h1 class="letrabl">Bienvenido administrador <%out.print(Id_Administrador);%>, estas son tus solicitudes pendientes.</h1>
         </div> </center> 
        <form action="datosEditar_2.jsp" method="post" name="altas"> 
        <TABLE width=90% height=52 border=1 align=center>
            <TR align=center bgcolor=#40A5FF>
                <TD width=80>Id reporte</TD>
                <TD>Descripcion</TD>
                <TD width=100>Fecha</TD>
                <TD width=100>Hora</TD>
                <TD width=200Estado</TD>
                <TD>Solucion</TD>
                <TD width=80>Id Usuario</TD>
                <TD width=80>Id Admin</TD>
            </TR>
<%
    while (rs2.next()) {
        Id_Administrador = rs2.getString("Id_Admini");
        Id_Reporte = rs2.getString("Id_Reporte");
        Descripcion = rs2.getString("Descripcion");
        Estado = rs2.getString("Estado");
        Fecha = rs2.getString("Fecha");
        Hora = rs2.getString("Hora");
        Solucion = rs2.getString("Solucion");
        Id_Usu = rs2.getString("Id_Usu");
                
                out.println("<TR align=center bgcolor=#FFFFFF>");
                out.println("<TD>" + Id_Reporte + "</TD>");
                out.println("<TD>" + Descripcion + "</TD>");
                out.println("<TD>" + Fecha + "</TD>");
                out.println("<TD>" + Hora + "</TD>");
                out.println("<TD>" + Estado + "</TD>");
                out.println("<TD>" + Solucion + "</TD>");
                out.println("<TD>" + Id_Usu + "</TD>");
                out.println("<TD>" + Id_Administrador + "</TD>");
                out.println("</TR>");
    }
                out.println("</TABLE>");
%>

            <BR>
            <CENTER>
            <H2>Selecciona el ID de Reporte a modificar:</H2>
            <select name="Id Reporte">
<%
    rs2 = stmt.executeQuery("SELECT * FROM Reporte where Estado='En Programacion'");
    while(rs2.next()){
        Id_Reporte = rs2.getString("Id_Reporte");
        out.println("<option value="+Id_Reporte+">"+Id_Reporte+"</option>");
    }
%>
            </select>
            <h2>Solución Implementada:</h2>
            <input style="width: 500px;" type="text" name="Solucion" placeholder="Ingresaa la solución implementada" required><span style="color: #264476;"></input></span>
            <input class="boton" name="boton" type="submit" value="Actualizar" />
            </CENTER>
        </form>
<%//cerrar  la conexión
            try {
                con.close();
            } catch (SQLException sqlEx) {
            };
%>
    </body>
</html>