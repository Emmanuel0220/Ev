<%-- 
    Document   : salir
    Created on : 31/05/2022, 12:05:57 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
    miSessiondelUsuario.invalidate();
    response.sendRedirect("Login.jsp");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
