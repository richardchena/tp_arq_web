
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
            
            input {
                margin-left: 10px;
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
                      <select style="margin-left: 10px" id="concepto" >
                      </select>
                        
                      <input style="display:none" type="date" id="fecha">
                      
                      <input style="display:none" type="number" id="doc" placeholder="Ingrese nro. doc.">
                      
                      <select style="margin-left: 10px" id="categoria" onchange="dinamico(this)">
                        <option value="1" selected>Concepto</option>
                        <option value="2">Fecha</option>
                        <option value="3">Doc cliente</option>
                      </select>
                      <button style="margin-left: 10px" id="boton" class="btn btn-success text-white" type="button" onclick="validar()">Consultar</button>
                    </div>
                    
                    <br>
                    
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre cliente</th>
                            <th>Doc. cliente</th>
                            <th>Fecha de uso</th>
                            <th>Concepto de uso</th>
                            <th>Puntaje utilizado</th>
                        </tr>
                    </thead>
                    <tbody id="content"></tbody>
                </table>
             </div>
        </div>
        <script>
            function dinamico(sel) {
                if(sel.value === '1') {
                    document.getElementById("concepto").style.display = "revert";
                    document.getElementById("fecha").style.display = "none";
                    document.getElementById("doc").style.display = "none";
                    
                } else if (sel.value === '2'){
                    document.getElementById("concepto").style.display = "none";
                    document.getElementById("fecha").style.display = "revert";
                    document.getElementById("doc").style.display = "none";
                } else {
                    document.getElementById("concepto").style.display = "none";
                    document.getElementById("fecha").style.display = "none";
                    document.getElementById("doc").style.display = "revert";
                }
            }
            
            
            $(document).ready(function(){
                añadirOpciones();
            });
            
            function añadirOpciones() {
                $.ajax({
                    url:"http://localhost:9090/api/v1/conceptos/",
                    dataType:"json",
                    success:function(res){
                        var len = res.length;
                        for( var i = 0; i<len; i++){
                            $("#concepto").append('<option value="'+res[i].descripcion+'">'+res[i].descripcion+'</option>');
                        }                
                    },
                    error:function() {
                        $alert("error occured");
                    }
                });
            }
            
            function validar(){
                const opc = document.getElementById("categoria").value;
                const fec = document.getElementById("doc").value;
                
                if (opc === '2' && document.getElementById("fecha").value !== ''){
                    cargar();
                    
                } else if (opc === '3' && document.getElementById("doc").value !== ''){
                    cargar();
                    
                } else if (opc === '1'){
                    cargar();
                    
                } else {
                    swal('', 'Debe ingresar un dato para consultar', 'error');
                }
            }
            
            function cargar() {
                const opc = document.getElementById("categoria").value;
                let bandera = 0;

                $.ajax({
                    url:"http://localhost:9090/api/v1/cabecera/ejecutar",
                    dataType:"json",
                    success:function(res){
                        var data="";
                        for(i=0;i<res.length;i++){
                             let p = res[i];

                             if(opc === '1'){
                                 const campo = document.getElementById("concepto").value;
                                 if(p.concepto === campo){
                                      bandera = 1;
                                      data+="<tr id="+ p.id + "><td>"+p.id+"</td><td>"+p.nombre+"</td><td>"+p.doc_nro+"</td><td>"+p.fecha.substr(0, 10)+"</td><td>"+p.concepto+"</td><td>"+p.puntaje_utilizado+"</td></tr>";
                                 }
                             } else if (opc === '2') {
                                 const campo = document.getElementById("fecha").value;
                                 if(p.fecha.substr(0, 10) === campo){
                                      bandera = 1;
                                      data+="<tr id="+ p.id + "><td>"+p.id+"</td><td>"+p.nombre+"</td><td>"+p.doc_nro+"</td><td>"+p.fecha.substr(0, 10)+"</td><td>"+p.concepto+"</td><td>"+p.puntaje_utilizado+"</td></tr>";
                                 }
                             } else {
                                 const campo = document.getElementById("doc").value;
                                 if(p.doc_nro === campo){
                                      bandera = 1;
                                      data+="<tr id="+ p.id + "><td>"+p.id+"</td><td>"+p.nombre+"</td><td>"+p.doc_nro+"</td><td>"+p.fecha.substr(0, 10)+"</td><td>"+p.concepto+"</td><td>"+p.puntaje_utilizado+"</td></tr>";
                                 }
                             }
                        }

                        if (bandera !== 1){
                            swal("", "No hay registros", "error");
                        }
                        
                        $('#status').html("Status : Content fetched");
                        $('#content').html(data);

                    },
                    error:function() {
                        swal("Ocurrio un error");
                    }
                });
            }
                        
        </script>
    </body>
</html>

