
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <style>
            .btn-primary{
                margin-right: 5px;
            }
        </style>
        <title>Clientes</title>
    </head>
    <body onload="fetch();">
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
                <a class="nav-link text-muted" href="/tp_arq_web/view/cliente/cliente.jsp">Clientes</a>
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
                  <a class="dropdown-item" href="/tp_arq_web/view/reportes/usopuntos.jsp">Uso de puntos</a>
                  <a class="dropdown-item" href="/tp_arq_web/view/reportes/bolsapuntos.jsp">Bolsa de puntos</a>
                  <a class="dropdown-item" href="/tp_arq_web/view/reportes/puntoavencer.jsp">Clientes con puntos a vencer</a>
                  <a class="dropdown-item" href="/tp_arq_web/view/reportes/cliente.jsp">Clientes</a>
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
                <a class="nav-link text-white" href="/tp_arq_web/view/actualizacion/actualizacion.jsp">Actualización</a>
              </li>
            </ul>
          </div>
        </nav>  

        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <table class="table table-bordered text-center">
                    
                    <div class="consulta">
                      <label for="nombre">Ingrese concepto, fecha o cliente
                      <input type="text" id="nombre" required></label>
                      <button id="boton" class="btn btn-success text-white" type="button">Consultar</button>
                    </div>
                    
                    <thead>
                        <tr>
                            <th>Concepto de uso</th>
                            <th>Fecha de uso</th>
                            <Th>Cliente</Th>                             
                        </tr>
                    </thead>
                    <tbody id="content"></tbody>
                </table>
             </div>
        </div>
        <script>
            
            function fetch() {
                const nombre = document.querySelector('#nombre');
                const boton = document.querySelector('#boton');
                const filtrar = () =>{
                    const campo = nombre.value.toLowerCase();
                    $.ajax({
                        url:"http://localhost:9090/api/v1/cabecera",
                        dataType:"json",
                        success:function(res){
                           var data="";
                           for(i=0;i<res.length;i++){
                               let p = res[i];
                               if(p.concepto === campo || p.fecha === campo || p.id_cliente === campo){
                                    data+="<tr id="+ p.id + "><td>"+p.concepto+"</td><td>"+p.fecha.substr(0, 10)+"</td><td>"+p.id_cliente+"</td></tr>";
                                }
                            }
                           $('#status').html("Status : Content fetched");
                           $('#content').html(data);
                        },
                        error:function() {
                            swal("Ocurrio un error");
                        }
                    });
                };     
                boton.addEventListener('click', filtrar); 
            }
                        
        </script>
    </body>
</html>
