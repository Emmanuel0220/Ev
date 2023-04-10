<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editor FAQs</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>        
        <%
                Connection conn = null;
                Statement stm = null;
                ResultSet rst = null;

                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ModuloSoporte?user=root&password=n0m3l0");
                    stm = conn.createStatement();
                }
                catch(SQLException error){
                    out.println(error.toString());
                    error.printStackTrace();
                }
                try{
                    out.println("<h1 align='center' style='font-size: 1.5em;'>EDITOR</h1>");
                    out.println("<h3 align='center' style='font-size: 1.5em;'>Tabla de reportes</h1>");
                    out.println("<br>"); 
                    out.println("<table border='1'>");  
                    out.println("<tr>");
                    out.println("<td width='5%'>#reporte</td>");
                    out.println("<td width='5%'>idusuario</td>");
                    out.println("<td width='30%'>descripcion</td>");
                    out.println("<td width='30%'>solucion</td>");
                    out.println("<td width='10%'>fecha</td>");
                    out.println("<td width='10%'>hora</td>");
                    out.println("<td width='10%'>estado</td>");
                    out.println("</tr>");
                    
                    rst = stm.executeQuery("select * from Reporte where Estado='Cerrado'");

                    rst.next();
                do{
                    
                    String reporte = rst.getString("Id_Reporte");
                    String usuario = rst.getString("Id_Usu");
                    String descripcion = rst.getString("Descripcion");
                    String solucion = rst.getString("Solucion");
                    Time hora = rst.getTime("Hora");
                    String estado = rst.getString("Estado");
                    
                    out.println("<tr>");
                    out.println("<td width='5%' align='center'>" + reporte + "</td>    ");
                    out.println("<td width='5%'>" + usuario + "</td>"); 
                    out.println("<td width='30%'>" + descripcion + "</td>");
                    out.println("<td width='30%'>" + solucion + "</td>");
                    out.println("<td width='10%'>" + hora + "</td>");
                    out.println("<td width='10%'>" + estado + "</td>");
                    out.println("</tr>");
                    
                }
                while(rst.next());
                    out.println("<table border='1'>");
                                    
            }
            catch(SQLException error){
                out.println(error.toString());
            }
        %>
        
        
        <%
            Connection conF = null;
            Statement comF = null;
            ResultSet resultaditoF = null;
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conF = DriverManager.getConnection("jdbc:mysql://localhost:3306/ModuloSoporte?user=root&password=n0m3l0");
                comF = conF.createStatement();
            }
            catch(SQLException error){
                out.println(error.toString());
                error.printStackTrace();
            }
            try{
                   
                    out.println("<br>");
                    out.println("<h1 align='right' style='font-size: 1.5em;'>Tabla FAQs</h1>");
                    out.println("<h1 align='left' style='font-size: 1.5em;'>Crear FAQ</h1>");
                    out.println("<br>");    
                    out.println("<table border='1' table width='60%' align='right'>");  
                    out.println("<tr>");
                    out.println("<td width='5%'>#FAQ</td>");
                    out.println("<td width='30%'>Problemea</td>");
                    out.println("<td width='30%'>Solucion</td>");
                    out.println("</tr>");
                    
                    resultaditoF = comF.executeQuery("select * from FAQs");
                    resultaditoF.next();
                do{
                    
                    String reporte = resultaditoF.getString("Id_Faq");
                    String usuario = resultaditoF.getString("Pregunta");
                    String descripcion = resultaditoF.getString("Respuesta");
                    
                    
                    out.println("<tr>");
                    out.println("<td width='5%' align='center'>" + reporte + "</td>");
                    out.println("<td width='30%'>" + usuario + "</td>"); 
                    out.println("<td width='30%'>" + descripcion + "</td>");
                    out.println("</tr>");
                    
                }
                while(resultaditoF.next());
                    out.println("<table border='1'>");
                                    
            }
            catch(SQLException error){
                out.println(error.toString());
            }
        %>
            <form>
                
                <label for="numero_FAQ">Número de FAQ</label>
                <input type="text" id="numero_reporte" name="numero_reporte"><br><br>
                <label for="pregunta" >Pregunta:</label>
                <input type="text" id="pregunta" name="pregunta"><br><br>
                <label for="respuesta" >Respuesta:</label>
                <input type="text" id="respuesta" name="respuesta"><br><br>
                <div class="sumit">
                <input type="submit" name="CREAR" value="CREAR">
                </div>
              </form>
                    <%
            if (request.getParameter("CREAR") != null) {

                String numero_reporte = request.getParameter("numero_reporte");
                String pregunta = request.getParameter("pregunta");
                String respuesta = request.getParameter("respuesta");

                Connection con = null;
                Statement sta = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
                    sta = con.createStatement();

                    sta.executeUpdate("INSERT INTO FAQs VALUES('" + numero_reporte + "','" + pregunta + "','" + respuesta + "')");
                     response.sendRedirect(request.getContextPath() + "/EDITOR.jsp");
                    out.println("<script>alert('Los datos han sido guardados');</script>");
                } catch (SQLException error) {
                    out.println(error.toString());
                } catch (ClassNotFoundException error) {
                    out.println(error.toString());
                } finally {
                    try {
                        if (sta != null) {
                            sta.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException error) {
                        out.println(error.toString());
                    }
                }
            }
            %>
       
        <BR>
        <BR>
        <h1 align='left'>Generar Reporte a FAQ</h1>
        <form>
            <label for="numero_reporte">Número de reporte:</label>
            <input type="text" id="numero_reporte" name="numero_reporte"><br>
            <div class="sumit">
            <input type="submit" name="submit" value="Crear">
            </div>
        </form>
         
<%
    if (request.getParameter("numero_reporte") != null) {
        String numero_reporte = request.getParameter("numero_reporte");
        String pregunta = "";
        String respuesta = "";
        String estado = "";

        // Consultar la descripción y solución correspondientes al número de reporte
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
            ps = con.prepareStatement("SELECT DESCRIPCION, SOLUCION, ESTADO FROM REPORTES WHERE IDREPORTE = ?");
            ps.setString(1, numero_reporte);
            rs = ps.executeQuery();
            if (rs.next()) {
                pregunta = rs.getString("DESCRIPCION");
                respuesta = rs.getString("SOLUCION");
                estado = rs.getString("ESTADO");
            }
        } catch (SQLException | ClassNotFoundException error) {
            out.println(error.toString());
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) {}
            try { if (ps != null) ps.close(); } catch (SQLException e) {}
            try { if (con != null) con.close(); } catch (SQLException e) {}
        }

        // Insertar el nuevo FAQ en la tabla FAQs
        con = null;
        PreparedStatement insert = null;
        try {
            if (estado.equals("CERRADO")) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
            insert = con.prepareStatement("INSERT INTO FAQs (IDFAQ, PREGUNTA, RESPUESTA) VALUES (?, ?, ?)");
            insert.setString(1, numero_reporte);
            insert.setString(2, pregunta);
            insert.setString(3, respuesta);
            insert.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/EditorFAQs.jsp");
            out.println("<script>alert('FAQ guardado con éxito');</script>");
             }   
            
        } catch (SQLException | ClassNotFoundException error) {
            out.println(error.toString());
        } finally {
            try { if (insert != null) insert.close(); } catch (SQLException e) {}
            try { if (con != null) con.close(); } catch (SQLException e) {}
        }
    }
%>
        <BR>
        <BR>
        <h1>Consultar FAQ</h1>
        <form>
            <label for="numero_FAQ">Número de FAQ:</label>
            <input type="text" id="numero_FAQ" name="numero_FAQ">
            <div class="sumit">
            <input type="submit" name="Consultar" value="Consultar">
            </div>
        </form>

<%
    if (request.getParameter("Consultar") != null){
        String numero_FAQ = request.getParameter("numero_FAQ");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
            ps = con.prepareStatement("SELECT PREGUNTA, RESPUESTA FROM FAQs WHERE IDFAQ = ?");           
            ps.setString(1, numero_FAQ);
            rs = ps.executeQuery();
            if (rs.next()) {
                String preguntaC = rs.getString("PREGUNTA");
                String respuestaC = rs.getString("RESPUESTA");
    %>
        <BR>
        <form method="post" action="">
            <label for="pregunta">Pregunta:</label><bR>
            <input type="text" id="pregunta" name="pregunta" value="<%=preguntaC%>" size="50" style="width: 40%; height: 40px;"><br>
            <label for="respuesta">Respuesta:</label><bR>
            <input type="text" id="respuesta" name="respuesta" value="<%=respuestaC%>" style="width: 40%; height: 40px;"><br>
            <input type="hidden" name="numero_FAQ" value="<%=numero_FAQ%>">
            <div class="sumit">
            <input type="submit" name="cambiar" value="cambiar">
            </div>
        </form>
    <% if(request.getParameter("cambiar") != null) {
                String preguntaNueva = request.getParameter("pregunta");
                String respuestaNueva = request.getParameter("respuesta");
                try {
                    ps = con.prepareStatement("UPDATE FAQs SET PREGUNTA = ?, RESPUESTA = ? WHERE IDFAQ = ?");
                    ps.setString(1, preguntaNueva);
                    ps.setString(2, respuestaNueva);
                    ps.setString(3, numero_FAQ);
                    ps.executeUpdate();
                    response.sendRedirect(request.getContextPath() + "/EDITOR.jsp");
                } catch (SQLException error) {
                    out.println(error.toString());
                }
            }

    
                } else {
                     out.println("<script>alert('Ese reporte no existe');</script>");
                  }
              } catch (SQLException | ClassNotFoundException error) {
                  out.println(error.toString());
              } finally {
                  try { if (rs != null) rs.close(); } catch (SQLException e) {}
                  try { if (ps != null) ps.close(); } catch (SQLException e) {}
                  try { if (con != null) con.close(); } catch (SQLException e) {}
              }
              
            }
            %>
            <BR>
            <BR>
<h1>Eliminar FAQ</h1>  
<BR>
<form method="post" action="">
    <label for="numero_FAQ">Número de FAQ:</label>
    <input type="text" id="numero_FAQ" name="numero_FAQ">
    <input type="submit" name="eliminar" value="Eliminar">
</form>
        
<%
if(request.getParameter("eliminar") != null) {
    String numero_FAQ = request.getParameter("numero_FAQ");
    Connection con = null;
    PreparedStatement ps = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
        ps = con.prepareStatement("DELETE FROM FAQs WHERE IDFAQ = ?");
        ps.setString(1, numero_FAQ);
        int rows = ps.executeUpdate(); 
        if (rows > 0) {
             out.println("<script>alert('FAQ eliminado exitosamente');</script>");
        } else {
             out.println("<script>alert('No se puedo eliminar el FAQ');</script>");
        }
         response.sendRedirect(request.getContextPath() + "/EditorFAQs.jsp");
    } catch (SQLException | ClassNotFoundException error) {
        out.println(error.toString());
    } finally {
        try { if (ps != null) ps.close(); } catch (SQLException e) {}
        try { if (con != null) con.close(); } catch (SQLException e) {}
    }
}
%>

    <BR>
    <h1>FORO</h1>  
    <BR>
    <form method="post" action="FAQs.jsp" target="_blank">
        <input type="submit" name="FAQs" value="FAQs">
    </form>


    </body>
    </body>
</html>
