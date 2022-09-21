<%-- 
    Document   : actualizacion
    Created on : Sep 20, 2022, 11:25:47 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
    </head>
    <body>
        <footer>
            <iframe src="/tp_arq_web/view/cabecera/cabecera.jsp"></iframe>
        </footer>
        <h1>Actualización de estado de bolsas</h1>
        <form>
            <br/>
            Introduzca cada cuanto se actualizaran las bolsas, en horas: <input type="text" name="horas" value="">
            <br/> <br/>
            <input value="Guardar" type="button" />
        </form>
    </body>
</html>
