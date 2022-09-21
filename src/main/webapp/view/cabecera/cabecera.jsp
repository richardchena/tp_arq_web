<%-- 
    Document   : cabecera
    Created on : Sep 20, 2022, 11:49:42 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

            *{
                margin: 0;
                padding: 1px;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            
            .tp-color{
                background-color: #FFB700;
            }
            
            .alejar{
                margin-left: 10px
            }
            
        </style>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
        <footer>
            <nav class="navbar navbar-expand-lg navbar-dark tp-color">
                <a class="navbar-brand" href="/tp_arq_web">
                  <img src="/tp_arq_web/img/logo.png" width="30" height="30" class="d-inline-block tp-color alejar" alt="">
                </a>
                <a href="/tp_arq_web"
                    <span class="navbar-brand mb-0 h1 text-black">SFC</span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                  <ul class="navbar-nav">
                    <li class="nav-item">
                      <a class="nav-link text-white" href="#">Clientes</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-white" href="#">Conceptos</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-muted">Parámetros</a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link text-white dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Reportes
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Uso de puntos</a>
                        <a class="dropdown-item" href="#">Bolsa de puntos</a>
                        <a class="dropdown-item" href="#">Clientes con puntos a vencer</a>
                        <a class="dropdown-item" href="#">Clientes</a>
                      </div>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link text-white dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Servicios
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Cargar puntos</a>
                        <a class="dropdown-item" href="#">Utilizar puntos</a>
                        <a class="dropdown-item" href="#">Consulta de puntos</a>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-white" href="#">Reglas</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-white" href="#">Actualización</a>
                    </li>
                  </ul>
                </div>
              </nav>
        </footer>
    </body>
</html>
