<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String Descripcion = null; %>
<% String Hora = null; %>
<% String Fecha = null; %>
<% String contra = null; %>
<% String Estado = null; %>

<%Statement stmt = null;%>
<% String Id_Reporte = null; %>
<% String Solucion = null; %>

<%!ResultSet rs2 = null;%>
<%!Connection con = null;%>

<%!ResultSet rs = null; %>
<%!Connection conn = null; %>
<%!Statement stmt_consul = null;%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilos.css">
        <link rel="stylesheet" href="../css/estilo1.css">
        <title>Nueva info</title>
      
    </head>
    <body>
                <%
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();

            int idPersona = (int) (miSessiondelUsuario.getAttribute("Id_Admini") == null ? 0 : miSessiondelUsuario.getAttribute("Id_Admini"));
            Base bd = new Base();
            String titulo = request.getParameter("Id_Reporte");
            try{
               bd.conectar();
               String subir = "select * from Reporte where Id_Reporte = '"+titulo+"'";
               
               ResultSet info = bd.consulta(subir);
               Class.forName("com.mysql.jdbc.Driver").newInstance ();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
                stmt = conn.createStatement();
                stmt_consul = conn.createStatement();
               while (info.next()) {
               Id_Reporte = info.getString("Id_Reporte");
                System.out.println(Id_Reporte);
                
                Descripcion = info.getString("Descripcion");
                
                Estado = "En proceso";
                
                Fecha = info.getString("Fecha");
                
                Hora = info.getString("Hora");
                
                Solucion = info.getString("Solucion");
                
                
                    }
                Date fechaHoraActual = new Date();
                SimpleDateFormat dateFormatFecha = new SimpleDateFormat("dd/MM/yyyy");
                SimpleDateFormat dateFormatHora = new SimpleDateFormat("HH:mm:ss");
                String FechaNueva = dateFormatFecha.format(fechaHoraActual);
                String HoraNueva = dateFormatHora.format(fechaHoraActual);
                
                bd.conectar();
                
                String sql = "SELECT Admini.Id_Admini, Reporte.Id_Admini" + "FROM Admini" + 
                "INNER JOIN Reporte ON Admini.Id_Admini = Reporte.Id_Admini";
               
                String dato = "update Reporte set Id_Admini=1, Estado='"+Estado+"',Fecha='"+FechaNueva
                +"',Hora='"+HoraNueva+"' where Id_Reporte='"+Id_Reporte+"'";
                int resultadoEdita = bd.edita(dato);
                
                if (resultadoEdita == 1) {
                    response.sendRedirect("solicitudes2.jsp");
                    
                 
            }
               
        %>
        
        
        
        <%
                
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        %>
        
    </body>
</html>
