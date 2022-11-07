<%-- 
    Document   : cliente
    Created on : 20 sept. 2022, 09:38:19
    Author     : Admin
--%>

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
                <a class="nav-link text-white" href="/tp_arq_web/view/actualizacion/actualizacion.jsp">Actualización</a>
              </li>
            </ul>
          </div>
        </nav>  

        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <table class="table table-bordered text-center">
                    
                    <button onclick="location.href='createuser.jsp'" class="btn btn-success text-white" type="button">Agregar cliente</button>
                    <br>
                    <br>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <Th>Cedula</Th> 
                            <Th>Correo</Th> 
                            <Th>Nacionalidad</Th>
                            <th>Telefono</th>
                            <th>Controles</th>
                        </tr>
                    </thead>
                    <tbody id="content"></tbody>
                </table>
             </div>
        </div>
        <script>
            function fetch() {
                $.ajax({
                    url:"http://localhost:9090/api/v1/cliente",
                    dataType:"json",
                    success:function(res){
                       var data="";
                       for(i=0;i<res.length;i++){
                           let p = res[i];
                           data+="<tr id="+ p.id + "><td>"+p.id+"</td><td>"+p.nombre+"</td><td>"+p.doc_nro+"</td><td>"+p.email+"</td><td>"+p.nacionalidad+"</td><td>"+p.telefono+"</td>";
                           data+='<td><button class="btn btn-primary" onclick="modificar(' + p.id + ')" type="button">Modificar</button>';
                           data+='<button class="btn btn-danger" onclick="eliminar(' + p.id + ')" type="button">Eliminar</button></td></tr>';
                       }
                       $('#status').html("Status : Content fetched");
                       $('#content').html(data);
                    },
                    error:function() {
                        swal("Ocurrio un error");
                    }
                });
            }
            
            function modificar(id){
                window.location.href = 'modificar.jsp?id=' + id;
            }
            
            function obtener_datos(){
                let obj = {
                    nombre: document.getElementById("nombre").value,
                    apellido: document.getElementById("apellido").value,
                    doc_nro: document.getElementById("doc").value,
                    tipo_doc: document.getElementById("tipo").value,
                    nacionalidad: document.getElementById("nac").value,
                    email: document.getElementById("email").value,
                    telefono: document.getElementById("tel").value,
                    fec_nac: document.getElementById("fec").value
                };
                
                return obj;
            }

            function eliminar(id){
                swal(
                    "¿Desea eliminar el ID: " + id + "?", 
                    {
                        dangerMode: true,
                        buttons: true
                    }
                ).then(okay => { 
                    if (okay) {
                        $.ajax({
                            type: "DELETE",
                            url:"http://localhost:9090/api/v1/cliente/"+id,
                            dataType:"json",
                            success:function(){
                               window.location.reload();
                            },
                            error:function() {
                               swal("Ha ocurrido un error");
                            }
                        });
                    }
                });
            }
        </script>
    </body>
</html>
