<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<!DOCTYPE html>

<%! int Id_Reporte = 0;%>
<%! int Id_Usu = 0;%>
<%! int Id_Admi = 0;%>
<%! String Descripcion = null;%>
<%! String Fecha = null;%>
<%! String Hora = null;%>
<%! String Estado = null;%>
<%! String Solucion = null;%>


<%!Statement stmt = null;%>
<%!ResultSet rs = null;%>
<%!Connection con = null;%>

<%    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT * FROM Reporte WHERE Estado = 'En proceso' " );
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VISUALIZAR REPORTES</title>
        <link rel="stylesheet" href="../VisualizaciónCSS.css">
    </head>
    <body>
        <nav class="nav">
            <center><p>INGENIERO DE SOPORTE</p></center>
        </nav>
        
        <br><br><br><br>
        
    <center>
        <%
            out.println("<P><TABLE cellspacing=1 cellpadding=10 border=3>");
            out.println("<TR align=center>");
            out.println("<TH>" + "Reporte" + "</TH>");
            out.println("<TH>" + "Usuario" + "</TH>");
            out.println("<TH>" + "Encargado" + "</TH>");
            out.println("<TH>" + "Descripción" + "</TH>");
            out.println("<TH>" + "Fecha y Hora" + "</TH>");
            out.println("<TH>" + "Status" + "</TH>");
            out.println("<TH width=400px>" + "Solucion" + "</TH>");
            out.println("</TR>");
            
            while (rs.next()) {
                out.println("<TR align=center>");
                
                Id_Reporte = rs.getInt("Id_Reporte");
                out.println("<TD>" + Id_Reporte + "</TD>");
                
                Id_Usu = rs.getInt("Id_Usu");
                out.println("<TD>" + Id_Usu + "</TD>");
                
                Id_Admi = rs.getInt("Id_Admini");
                out.println("<TD>" + Id_Admi + "</TD>");
                
                Descripcion = rs.getString("Descripcion");
                out.println("<TD width=400px>" + Descripcion + "</TD>");
                
                Fecha = rs.getString("Fecha");
                Hora = rs.getString("Hora");
                out.println("<TD>" + Fecha + "  " + Hora + "</TD>");
                
                out.println("<TD>" + "En proceso"+ "</TD>");
                
                if(rs.getString("Solucion").equals("")){
                out.println("<TD background=black> </TD>");
                } else {
                Solucion = rs.getString("Solucion");
                out.println("<TD>" + Solucion + "</TD>");
                }
                
                out.println("</TR>");
            }
            out.println("</TABLE>");
            out.println("<form action='cambiosIngeniero.jsp'>");
            out.println("<br><br><br><hr size=5 color=black>");
        
            out.println("<br><h3> Si desea tratar alguno de estos por favor complete los campos de abajo </h3><br>");
            out.println("<label>Id del Reporte: </label><br>");
            out.println("<select name='Id_Reporte'>");
        
            rs = stmt.executeQuery("SELECT * FROM Reporte WHERE Estado = 'En proceso' " );
        
            while (rs.next()) {
            Id_Reporte = rs.getInt("Id_Reporte");
            out.println("<option value=" + Id_Reporte + ">" + Id_Reporte + "</option>");
            }
            out.println("</select><br><br><br>");
            out.println("<label>Solución a enviar (opcional): </label><br><br>");
            out.println("<input type=text placeholder='Agrega una solución o copiala' name='Solucion'> </label><br>");
            
            out.println("<br><br><input type='Subir' title='Actualizar'> </form>");
            try {
                con.close();
            } catch (SQLException sqlEx) {
            };
        %>
    
    <br><br><br><br><br><br><br>
    </center>
    </body>
</html>
