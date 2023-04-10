<%-- 
    Document   : registrar
    Created on : 31 mar. 2023, 23:28:39
    Author     : Define PC
--%>

<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.Date.*" %>

<%! String id_reporte = null; %>
<%! String descripcion = null; %>
<%! String fechahoraR = null; %>
<%! String solucion = null; %>
<%! String fechahoraS = null; %>
<%! String estado = null; %>
<%! String id_usu = null; %>
<%! String id_admin = null; %>

<%! Statement stmt = null; %>
<%! ResultSet rs = null; %>
<%! Connection conn = null; %>
<%! String query = "select * from Reporte where Estado='abierto'"; %>

<%
    java.util.Calendar calendario = java.util.Calendar.getInstance();
    java.util.Date fechaHoraActual2 = calendario.getTime();
    java.text.SimpleDateFormat formatoHora = new java.text.SimpleDateFormat("hh:mm:ss");
    String horaActual = formatoHora.format(fechaHoraActual2);
    
    java.util.Date fechaHoraActual = new java.util.Date();
    java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("dd/MM/yyyy");
    String fechaHoraString = formato.format(fechaHoraActual);
    
   
    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    stmt = conn.createStatement();
    
    //id_reporte = request.getParameter("id_reporteForm");
    //int reporte = Integer.parseInt(id_reporte);
    
    descripcion = request.getParameter("descripcionForm");
    
    ////fechahoraR = request.getParameter("fechahoraRForm");
    ////int fechaR = Integer.parseInt(fechahoraR);
    
    solucion = request.getParameter("solucionForm");
    
    ////fechahoraS = request.getParameter("fechahoraSForm");
    ///int fechaS = Integer.parseInt(fechahoraS);
    
    ////estado = request.getParameter("estadoForm");
    
    //id_usu = request.getParameter("id_usuForm");
    
    //id_admin = request.getParameter("id_adminForm");
    
    stmt.execute("INSERT INTO Reporte (Descripcion, Fecha, Hora, Estado, Id_Usu, Id_Admini) VALUES ("+"'" + descripcion + "','" + fechaHoraActual + "','" + horaActual + "','" + "abierto" + "','" + "1" +"','" + "2" + "')");
    rs = stmt.executeQuery(query);
    out.println("<br>SE HA CREADO UN REPORTE NUEVO");
    
%>

<html>
    <head>
        <title>Reporte</title>
        <link rel="stylesheet" type="text/css" href="../css/tablaR.css">
    </head>
    <body>
        <%
            //out.println("<div align=center><strong>Lista de reportes</strong></div>");
        out.println("<p><table width=650 height=60 border=1 align=center>");
            out.println("<tr align=center bgcolor=#FFFFCC>");
            out.println("<td>" + "Id_reporte2" + "</td>");
            out.println("<td>" + "Descripcion" + "</td>");
            out.println("<td>" + "Fecha" + "</td>");
            out.println("<td>" + "Solucion" + "</td>");
            out.println("<td>" + "Hora" + "</td>");
            out.println("<td>" + "Estado" + "</td>");
            out.println("<td>" + "Id_Usu" + "</td>");
            out.println("<td>" + "Id_Admin" + "</td>");
            out.println("</tr>"); //
            while (rs.next()) {
            out.println("<tr>");
            id_reporte = rs.getString("id_reporte");
            out.println ("<td>" + id_reporte + "</td>");
            descripcion = rs.getString("descripcion");
            out.println ("<td>" + descripcion + "</td>");
           // horita= rs.getString("hora");
            out.println ("<td>" + fechaHoraString + "</td>");
            solucion = rs.getString("solucion");
            out.println ("<td>" + solucion + "</td>");
           // fechahoraS = rs.getString("fechahoraS");
            out.println ("<td>" +  horaActual + "</td>");
            estado = rs.getString("estado");
            out.println ("<td>" + estado + "</td>");
            id_usu = rs.getString("id_usu");
            out.println ("<td>" + id_usu + "</td>");
            id_admin = rs.getString("id_reporte");
            out.println ("<td>" + id_admin + "</td>");
            }
            out.println("</table>");
            
            out.println ("<td>"+ "<a href=" + " ../html/registrar.html" + " >" + "Registrar</a></td>");
            //out.println ("<td>"+ "<a href=" + " ConsultaGral.jsp" + " >" + "Tablachida</a></td>");
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch(SQLException sqlEx){
            };
            
%>          
    </body>
</html>
