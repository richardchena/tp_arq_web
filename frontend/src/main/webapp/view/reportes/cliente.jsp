
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
                <a class="nav-link text-muted" href="/tp_arq_web/view/cliente/cliente.jsp">Clientes</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/concepto/listar.jsp">Conceptos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/parametros/parametro.jsp">Par??metros</a>
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
                <a class="nav-link text-white" href="/tp_arq_web/view/actualizacion/actualizacion.jsp">Actualizaci??n</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/sorteos/sorteo.jsp">Sorteo</a>
              </li>
            </ul>
          </div>
        </nav>  

        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <table class="table table-bordered text-center">
                    
                    <div class="consulta">
                      <input style="width: 250px" type="text" placeholder="Ingrese aqu?? para filtrar" id="valor_" required></label>
                      <select style="margin-left: 10px" id="categoria" onchange="dinamico(this)">
                        <option value="1" selected>Nombre</option>
                        <option value="2">Apellido</option>
                        <option value="3">Cumplea??os</option>
                      </select>
                      <button onclick="validar()" style="margin-left: 10px" id="boton" class="btn btn-success text-white" type="button">Buscar</button>
                    </div>
                   
                    <br>
                    
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <Th>Cedula</Th> 
                            <Th>Correo</Th> 
                            <Th>Nacionalidad</Th>
                            <th>Fecha nacimiento</th>
                        </tr>
                    </thead>
                    <tbody id="content"></tbody>
                </table>
             </div>
        </div>
        <script>
            function dinamico(sel)
            {
                if(sel.value === '3') {
                    document.getElementById("valor_").type = 'date';
                } else {
                    document.getElementById("valor_").type = 'text';
                }
            }
            
            function validar () {
                if (document.getElementById("valor_").value === '') {
                    swal('El campo no puede estar vac??o');
                } else {
                    cargar();
                }
            }

            function cargar() {
                const valor = document.getElementById("valor_").value;
                const seleccion = document.getElementById("categoria").value;
                let url_valido = '';
                
                if (seleccion === '1') {
                    url_valido = 'http://localhost:9090/api/v1/cliente/aprox?nombre=';
                } else if (seleccion === '2') {
                    url_valido = 'http://localhost:9090/api/v1/cliente/aprox?apellido='
                } else {
                    url_valido = 'http://localhost:9090/api/v1/cliente/aprox?fec_nac='
                }
                
                $.ajax({
                    type: 'GET',
                    url: url_valido + valor + "",
                    success:function(res){
                       var data="";
                       for(i=0;i<res.length;i++){
                           let p = res[i];
                           data+="<tr id="+ p.id + "><td>"+p.id+"</td><td>"+p.nombre+"</td><td>"+p.doc_nro+"</td><td>"+p.email+"</td><td>"+p.nacionalidad+"</td><td>"+p.fec_nac+"</td></tr>";
                        }
                       $('#content').html(data);
                       
                       if (res.length === 0){
                           swal("", "No hay registros", "error");
                       }
                       
                    },
                    error:function() {
                        swal("Ocurrio un error");
                    }
                });  
            }       
        </script>
    </body>
</html>

