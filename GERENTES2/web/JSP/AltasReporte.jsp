
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>         

<% String Curp = "a";%>
<% String Tipo_Admin = null; %>
<% String Contrasena_Vend = null; %>
<% String Fecha = null; %>
<% String Hora = null; %>
<% String Estado = null; %>
<% String Descripcion = null; %>
<% String Id_Admini = null; %>
<% String Id_reporte = null; %>
<% String Id_Usu = null; %>
<% String Nombre = null; %>
<% String Solucion = null; %>
<%Statement stmt = null;%>
<%!ResultSet rs = null; %>
<%!Connection conn = null; %>
<%!String query = "SELECT * FROM Usuario"; %>
<% String usuario = null; %>

<%
//conexion a la base de datos 
    
   HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
    int idPersona = (int) (miSessiondelUsuario.getAttribute("Id_Usu") == null ? 0 : miSessiondelUsuario.getAttribute("Id_Usu"));
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    stmt = conn.createStatement();
    rs = stmt.executeQuery("Select * from Usuario where Id_Usu ='"+idPersona+"'");
    while(rs.next()){
   Nombre = rs.getString("Nombre");
   
    }           
    
    //TABLA Reporte     
    Tipo_Admin = request.getParameter("tipoAdmin");//se quita es el id
    Contrasena_Vend = request.getParameter("Contrasena");
    Descripcion=request.getParameter("info");//Info
    Contrasena_Vend= request.getParameter("contra");//costo
    Fecha = request.getParameter("fecha");
    Hora = request.getParameter("hora");
    usuario = (Tipo_Admin);
    
    Id_Admini = request.getParameter("destinatario");

    stmt.executeUpdate("INSERT INTO Reporte (Descripcion, Fecha, Solucion, Hora, Estado, Id_Usu, Id_Admini) "
        + "VALUES("+"'" + Descripcion +"','"+ Fecha +"','"+ Solucion +"','"+Hora+"','"
        + Estado +"','"+ String.valueOf(idPersona) +"','"+ String.valueOf(Id_Admini)+"')");
    
    rs = stmt.executeQuery(query);   

%>

<HTML>

    <HEAD>
       
        <TITLE>a </TITLE> 
    </HEAD>
    <BODY>
    
     
<script>
    window.alert("El registro del reporte puede tardar unos dias en resuelto");
</script>
<%   
    response.sendRedirect("ola.jsp");
%>
    </BODY>
    </HTML>
       