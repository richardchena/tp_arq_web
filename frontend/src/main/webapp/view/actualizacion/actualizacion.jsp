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
        <title>Actualizacion</title>
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
<!--    <body onload="iniciar()">-->
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
                <a class="nav-link text-white" href="/tp_arq_web/view/cliente/cliente.jsp">Clientes</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/concepto/listar.jsp">Conceptos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/parametros/parametro.jsp">Parámetros</a>
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
                  <a class="dropdown-item" href="/tp_arq_web/view/servicios/carga.jsp">Cargar puntos</a>
                  <a class="dropdown-item" href="/tp_arq_web/view/servicios/utilizarpuntos.jsp">Utilizar puntos</a>
                  <a class="dropdown-item" href="/tp_arq_web/view/servicios/consulta.jsp">Consulta de puntos</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/reglas/listar.jsp">Reglas</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-muted" href="/tp_arq_web/view/actualizacion/actualizacion.jsp">Actualización</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/sorteos/sorteo.jsp">Sorteo</a>
              </li>
            </ul>
          </div>
        </nav>
        <h3>Automatización de envios de mail</h3>
        
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 text-center">
            <form>
                <div class="campo">
                    <i><b>Consulta con el administrador la hora de los envios de mails</b></i>
                </div>
                
                <div class="campo">
                    Introduzca el parametro de días para programar los envios: <input type="number" id="dias_" value="">
                </div>

                <div class="campo">
                    <input class="btn btn-success text-white" value="ASIGNAR" type="button" onclick="asignar()"/>
                </div>

            </form>
        </div>
        
        <!--<button class="btn btn-success text-white" id="encender" disabled>ENCENDER TAREA</button>
        <button class="btn btn-success text-white" id="apagar" disabled>DESACTIVAR TAREA</button>-->
    </body>
    <script>
        function iniciar() {
            const encender = document.getElementById('encender');
            const apagar = document.getElementById('apagar');
            
            $.ajax({
                type: 'get',
                url:"http://localhost:9092/check",
                dataType:"json",
                success:function(data){
                    if (data.status === true){
                        encender.disabled = true;
                        apagar.disabled = false;

                    } else {
                        encender.disabled = false;
                        apagar.disabled = true;
                    }
                },
                error:function(err) {
                    console.log(err);
                    swal("Ocurrio un error: " + err);
                }
            });
        }
        
        function asignar () {
            const dias = document.getElementById('dias_').value;
            
            if(dias === ''){
                swal('', 'Debes de ingresar una cantidad', 'error');
            } else {
                $.ajax({
                    type: 'get',
                    url:"http://localhost:9092/set_date?dias="+dias,
                    success:function(data){
                        swal("", data.mensaje, "success");
                        activar_task();
                    },
                    error:function(err) {
                        console.log(err);
                        swal("Ocurrio un error: " + err);
                    }
                });
            }
            
        }
        
        function activar_task(){
            $.ajax({
                type: 'get',
                url:"http://localhost:9092/iniciar",
                success:function(data){
                    console.log(data);
                },
                error:function(err) {
                    console.log(err);
                    swal("Ocurrio un error al activar la tarea!");
                }
            });
        }
    </script>
</html>
