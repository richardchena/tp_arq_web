<%-- 
    Document   : login
    Created on : 25 nov. 2022, 22:28:52
    Author     : richard
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <title>SFC - ERROR 401</title>
        <style>
            span{
                font-family: 'Poppins', sans-serif;
                padding-top: 25px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark tp-color">
          <a class="navbar-brand" href="/tp_arq_web">
            <img src="/tp_arq_web/img/logo.png" width="30" height="30" class="d-inline-block tp-color alejar" alt="">
          </a>
          <a href="/tp_arq_web" 
             <span style="text-align: center" class="navbar-brand mb-0 h1 text-black text-center">SFC</span>
          </a>
        </nav>
        
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8" style="width: 500px; margin-top: 80px">
            
            <div class="py-4 px-4 bg-white overflow-hidden shadow p-3 mb-5 bg-white rounded">
                <h3 style="padding-top: 5px;">Acceso no permitido</h3>
                <br> 
                <img src="/tp_arq_web/img/no-autorizado.png" width="100" height="100" class="mx-auto d-block" alt="">
                <br>
                <div style="text-align: center;">
                    <span align="center">Contactar con el administrador para ingresar</span>
                </div>
                <br>
                <div class="campo">
                    <button onclick="location.href='/tp_arq_web/view/login/login.jsp'" class="btn btn-success text-white" type="button">VOLVER A INICIO</button>
                </div>
            </div>
        </div>
        
    </body>
</html>
