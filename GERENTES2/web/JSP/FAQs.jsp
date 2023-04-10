<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%@page import="java.sql.*" %>
        <%
            Connection conF = null;
            Statement staF = null;
            ResultSet rsF = null;
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conF = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
                staF = conF.createStatement();
            }
            catch(SQLException error){
                out.println(error.toString());
                error.printStackTrace();
            }
            try{
                   
                    out.println("<br>");
                    out.println("<h1 align='center' style='font-size: 1.5em;'>Tabla FAQs</h1>");
                    out.println("<br>");    
                    out.println("<table border='1' table width='60%' align='center'>");  
                    out.println("<tr>");
                    out.println("<td width='5%'>#FAQ</td>");
                    out.println("<td width='30%'>Problemea</td>");
                    out.println("<td width='30%'>Solucion</td>");
                    out.println("</tr>");
                    
                    //rsF = conF.executeQuery("select * from FAQs");
                    rsF.next();
                do{
                    
                    String reporte = rsF.getString("IDFAQ");
                    String usuario = rsF.getString("PREGUNTA");
                    String descripcion = rsF.getString("RESPUESTA");
                    
                    
                    out.println("<tr>");
                    out.println("<td width='5%' align='center'>" + reporte + "</td>");
                    out.println("<td width='30%'>" + usuario + "</td>"); 
                    out.println("<td width='30%'>" + descripcion + "</td>");
                    out.println("</tr>");
                    
                }
                while(rsF.next());
                    out.println("<table border='1'>");
                                    
            }
            catch(SQLException error){
                out.println(error.toString());
            }
        %>
</body>   
</html>
