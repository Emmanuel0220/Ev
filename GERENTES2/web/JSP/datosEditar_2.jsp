<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<%! String Id_Reporte = null;%>
<%! String Solucion = null;%>

<%!Statement stmt = null;%>
<%!ResultSet rs = null;%>
<%!Connection con = null;%>

<%    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    stmt = con.createStatement();
    Id_Reporte = request.getParameter("Id Reporte");
    Solucion = request.getParameter("Solucion");
    System.out.println(Id_Reporte);
    
    Date fechaHoraActual = new Date();
    SimpleDateFormat dateFormatFecha = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat dateFormatHora = new SimpleDateFormat("HH:mm:ss");
    String FechaNueva = dateFormatFecha.format(fechaHoraActual);
    String HoraNueva = dateFormatHora.format(fechaHoraActual);
    
    stmt.executeUpdate("UPDATE Reporte SET  Fecha='"+FechaNueva+"',Hora='"+HoraNueva+"',Estado='Programacion Finalizada', Solucion='" + Solucion + "' WHERE Id_Reporte=" + Id_Reporte + ";" );
    out.println("<br><h2> Se ha enviado tu solución al usuario </h2><br>");
    response.sendRedirect("solicitudes3.jsp");

%>
