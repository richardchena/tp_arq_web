<%-- 
    Document   : modificar
    Created on : 22 sept. 2022, 19:23:05
    Author     : Richard Cabrera
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Parametros - Modificar</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
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
                <a class="nav-link text-white" href="/tp_arq_web/view/concepto/listar.jsp">Conceptos</a>
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
                <a class="nav-link text-white" href="/tp_arq_web/view/reglas/listar.jsp">Reglas</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/actualizacion/actualizacion.jsp">Actualización</a>
              </li>
            </ul>
          </div>
        </nav>
        <h3>Modificar registro</h3>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <form>
                   
                    <div class="campo">
                      
                        <label class="la" for="inferior" >ID. Operación</label>
                        <input class="in" id="lim_inf"  type="number" value="145621" disabled="true"/>
                    </div>
                    <div class="campo">
                        <label class="la" for="superior" >Nombre Cliente</label>
                        <input class="in" id="lim_sup"  type="text" value="Richard Cabrera" disabled="true"/>
                    </div>
                    <div class="campo">
                        <label class="la" for="superior" >Puntos</label>
                        <input class="in" id="lim_sup"  type="number" value="25" disabled="true"/>
                    </div>
                    <div class="campo">
                        <label class="la" for="monto" >Fecha Vencimiento</label>
                        <input type="date" id="start" name="trip-start" class="in"
                               value="2021-10-10"
                                min="2021-10-10" max="2022-10-10">
                       
                    </div>
                   <br>
                    <div class="campo">
                       <button onclick="location.href='./parametro.jsp'" class="btn btn-primary text-white" type="button">Volver</button>
                       <button onclick="location.href='#'" class="btn btn-success text-white" type="button">Guardar</button>

                    </div>
                </form>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-1.6.2.min.js"></script> 
    <script> 
    $(document).ready(function() { 

      $("#reglaOp1").click(function(){ 
        $("#lim_inf").prop("disabled", true); 
        $("#lim_sup").prop("disabled", true);
        }); 

      $("#reglaOp2").click(function(){ 
        $("#lim_inf").prop("disabled", false); 
        $("#lim_sup").prop("disabled", false); 
        }); 
    }); 
    </script> 
</html>