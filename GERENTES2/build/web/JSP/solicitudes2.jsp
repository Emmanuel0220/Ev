<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%!Statement stmt_consul = null;%>
<%!Connection conn = null;%>
<%!ResultSet rs = null; %>
<% String usuario = null; %>
<% String Id_Admini = null; %>

<% String Descripcion = null; %>
<% String Hora = null; %>
<% String Fecha = null; %>
<% String contra = null; %>
<% String Estado = null; %>

<%Statement stmt = null;%>
<%! String Id_Reporte = null; %>
<%! String Solucion = null; %>

<%!ResultSet rs2 = null;%>
<%!Connection con = null;%>
<html>
    <head>
          <link rel="stylesheet" href="../estilos.css">
        <TITLE>Soli </TITLE> 
        
        
    </head>
    <%
    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
    int idPersona = (int) (miSessiondelUsuario.getAttribute("Id_Admini") == null ? 0 : miSessiondelUsuario.getAttribute("Id_Admini"));
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3308/ModuloSoporte?user=root&password=n0m3l0");
    stmt_consul = conn.createStatement();
    stmt = con.createStatement();
    rs = stmt_consul.executeQuery("SELECT * FROM Admini where Id_Admini ='"+idPersona+"'");
    while (rs.next()) {                 
            usuario = rs.getString("Tipo_Admin");
        }
          

            //cerrar  la conexión
            try {
                conn.close();
            } catch (SQLException sqlEx) {
            };
    rs2 = stmt.executeQuery("SELECT * FROM Reporte where Estado='En Mantenimiento'");
    
    %>
    <body style="background-image: url(../Imagenes/foto.jpg)" >
        <a href="salir.jsp" style="color: white">Cerrar Sesión</a>
    <center>
        <h1 class="letrabl" style="color: white">Que alegría verte de nuevo <%out.print(usuario);%>, estos son tus reportes pendientes</h1>
         </center>
          </div>
            <BR><br>
        
            
        
                <%while (rs2.next()) {
                 
                Id_Admini = rs2.getString("Id_Admini");
                
                usuario = rs2.getString("Id_Usu");
                
                Id_Reporte = rs2.getString("Id_Reporte");
                
                Descripcion = rs2.getString("Descripcion");
                
                Estado = rs2.getString("Estado");
                
                Fecha = rs2.getString("Fecha");
                
                Hora = rs2.getString("Hora");
                
                Solucion = rs2.getString("Solucion");
                %>
        <div class="container">         
        <div class= "half-width" style="background-color: #4697b4">
            <div class="contenedorSolicitudes">
          
        <table> <form action="datosEditar_1.jsp" method="post" name="altas"> 
                <td width=100px;>
                    Número de reporte:
               <a class="" href="AltasIReporte.jsp" ><input style="width: 18px;" type="text" name="Id_Reporte" value="<%=Id_Reporte%>" readonly></input></a>
               <br>
               
               <table>
                <td >
                    Estado del reporte:  
                    <input style="width: 165px;" type="text" name="estado" value="<%=Estado%>" readonly=""><span style="color: #264476;"></input> </span>
                </td>
                
                <td width=100px;>
                     Descripción:
                <input type="text" name="descripcion" value="<%=Descripcion%>" readonly><span style="color: #264476;"></input></span>
                </td>
                
                <td width=100px;>
                     Hora: 
                <input style="width: 45px;" type="text" name="hora" value="<%=Hora%>" readonly><span style="color: #264476;"></input></span>
                </td>
                
                <td width=100px;>
                    Fecha:
                <input style="width: 60px;" type="text" name="fecha" value="<%=Fecha%>" readonly><span style="color: #264476;">  </input></span>
                </td>
                
                
               </table><br>
     
                <br>
                <strong>Reporte hecho por:</strong>
                <input style="width: 20px;" type="text" name="usuario" value="<%=usuario%>" readonly><span style="color: #264476;"></span> </input>
                
                 Id el Admin que mandó el reporte:
                <input style="width: 20px;" type="text" name="usuario" value="<%=Id_Admini%>" readonly><span style="color: #264476;"><strong></strong></span> </input>
           </td>
          
         </tr>
         
         </table>
           <input class="boton" name="boton" type="submit" value="Continuar" />   
               
              <br>
         </form>         
        </DIV> </DIV> 
        
                <script>
        const boton = document.querySelector(".eliminar");
        
        function aceptar(){
            var resultado = window.confirm('¿Estas seguro que deseas aceptar la solicitud?');
            if (resultado === true) {
                window.location.href="datosEditar.jsp?Id_Reporte=<%=Id_Reporte%>";
                window.alert('Cambio de estado');
            } else { 
                window.alert('El inmueble no fue aceptado');
            }
        }
                
    </script>
                <DIV style="background-color: #4697b4" class="half-width">
            
                
        <%           
            }
            rs2 = stmt.executeQuery("SELECT * FROM Reporte where Estado='Programacion Finalizada'");
%>
           
<%while (rs2.next()) {
                 
                Id_Admini = rs2.getString("Id_Admini");

                usuario = rs2.getString("Id_Usu");
                
                Id_Reporte = rs2.getString("Id_Reporte");
                
                Descripcion = rs2.getString("Descripcion");
                
                Estado = rs2.getString("Estado");
                
                Fecha = rs2.getString("Fecha");
                
                Hora = rs2.getString("Hora");
                
                Solucion = rs2.getString("Solucion");
                %>
                
                <div class="half-width" style="background-color: #a6d0d2">
          <div class="contenedorSolicitudes">
        <table> <form action="datosEditar_1.jsp" method="post" name="altas"> 
                <td width=100px;>
                    Número de reporte:
               <a class="" href="AltasIReporte.jsp" ><input style="width: 18px;" type="text" name="Id_Reporte" value="<%=Id_Reporte%>" readonly></input></a>
               <br>
               
               <table>
                <td >
                    Estado del reporte:  
                    <input style="width: 165px;" type="text" name="estado" value="<%=Estado%>" readonly=""><span style="color: #264476;"></input> </span>
                </td>
                
                <td width=100px;>
                    Descripción:
                <input  type="text" name="descripcion" value="<%=Descripcion%>" readonly><span style="color: #264476;"> </input></span>
                </td>
                
                <td width=100px;>
                     Hora: 
                <input style="width: 45px;" type="text" name="hora" value="<%=Hora%>" readonly><span style="color: #264476;"></input></span>
                </td>
                
                <td width=100px;>
                     Fecha: 
                <input style="width: 60px;" type="text" name="fecha" value="<%=Fecha%>" readonly><span style="color: #264476;"></input></span>
                </td>
                 
               
               </table>
                
                Solución:
                <input style="width: 200px;" type="text" name="Solucion" value="<%=Solucion%>" readonly><span style="color: #264476;"></input></span>
                <br>
                Id el usuario que hizo el reporte:
                <input style="width: 20px;" type="text" name="usuario" value="<%=usuario%>" readonly><span style="color: #264476;"><strong></strong></span> </input>
                Id el Admin que mandó el reporte:
                <input style="width: 20px;" type="text" name="usuario" value="<%=Id_Admini%>" readonly><span style="color: #264476;"><strong></strong></span> </input>
           </td>
          
         </tr>
         
         </table>
           <input class="boton" name="boton" type="submit" value="Continuar" />   
               
               <br><br>
         </form>         
        </DIV> </DIV>
        </DIV>
        </DIV> <br><br>
          
               
        <%           
            }
          

            //cerrar  la conexión
            try {
                con.close();
            } catch (SQLException sqlEx) {
            };%>
        
        
    </body>
</html>