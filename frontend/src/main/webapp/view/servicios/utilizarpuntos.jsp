<%-- 
    Document   : utilizarpuntos
    Created on : 22 sept. 2022, 17:05:25
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Utilizar puntos</title>
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                <a class="nav-link text-muted dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
        <h3>Utilizar Puntos</h3>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <form>
                    <div class="campo">
                      <label for="cedula">Cedula del cliente</label>
                      <input type="number" id="cedula">
                      <input type="number" id="id_cliente" type hidden>
                    </div>
                    <div class="campo">
                      <label  for="inputState">Concepto</label>
                      <select id="selector"> 
                          <option value=0 selected>Seleccionar</option>
                      </select>
                    </div>
                    <br>
                    <div class="campo">
                       <button onclick="utilizarPuntos();" class="btn btn-success text-white" type="button">Utilizar puntos</button>
                    </div>
                </form> 
            </div>
        </div>
            <script>
            $(document).ready(function(){
                $(".btn-danger").click(function(){
                    swal(
                        "¿Desea eliminar lo seleccionado?", 
                        {
                            dangerMode: true,
                            buttons: true
                        }
                    ).then(okay => { 
                        if (okay) {
                            window.location.reload();
                        }
                    });
                });
            });
            
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
                            $("#selector").append('<option value="'+res[i].puntos+'">'+res[i].descripcion+'</option>');
                        }                
                    },
                    error:function() {
                        $alert("error occured");
                    }
                });
            }
            
            function utilizarPuntos(){
                var cedula = $('#cedula').val();
                encontrarId(cedula);

            }
            
            function encontrarId(cedula) {
                $.ajax({
                    url:"http://localhost:9090/api/v1/cliente/cedula/"+cedula,
                    dataType:"json",
                    success:function(res){
                        var id_cliente = res[0].id;  
                        id = document.getElementById('id_cliente');
                        id.value = id_cliente;
                        obtenerMonto();
                                      
                    },
                    error:function(res) {
                         let mess = JSON.parse(res.responseText);
                        //EL BACKEND RETORNA UN MENSAJE Y ESO OBTENGO
                        swal(
                            mess.message.toUpperCase(), 
                            {
                                dangerMode: true,
                                buttons: true
                            }
                        ).then(okay => { 
                            if (okay) {
                                window.location.reload();
                            }
                        });
                    }
                });
            }
            
            function obtenerMonto() {
                var monto = $('#selector').val();
                var id_cliente = $('#id_cliente').val();
                verificarSaldo(id_cliente, monto);
            }
            
            function verificarSaldo(id_cliente, monto) {
                $.ajax({
                    url:"http://localhost:9090/api/v1/bolsa/saldo/"+id_cliente+"/"+monto,
                    dataType:"json",
                    success:function(res){
                        obtenerBolsas(id_cliente, monto);
                                        
                    },
                    error:function(res) {
                        let mess = JSON.parse(res.responseText);
                        //EL BACKEND RETORNA UN MENSAJE Y ESO OBTENGO
                        swal(
                            mess.message.toUpperCase(), 
                            {
                                dangerMode: true,
                                buttons: true
                            }
                        ).then(okay => { 
                            if (okay) {
                                window.location.reload();
                            }
                        });
                    }
                });
            }
            
            function obtenerBolsas(id_cliente, monto) {
                $.ajax({
                    url:"http://localhost:9090/api/v1/bolsa/bolsas/"+id_cliente+"/"+monto,
                    dataType:"json",
                    success:function(res){
                        //alert(res.bolsas[0].puntaje_utilizado);
                        actualizarBolsas(res);
                                      
                    },
                    error:function() {
                        $alert("error occured");
                    }
                });
            }
            
            function actualizarBolsas(bolsas) {
                $.ajax({
                    type: 'put',
                    url:"http://localhost:9090/api/v1/bolsa/bolsas",
                    dataType:"json",
                    data: bolsas,
                    success:function(data){
                         crearCabecera();
                                      
                    },
                    error:function() {
                        $alert("error occured");
                    }
                });
            }
            
            
            function crearCabecera() {
                let cabecera = obtenerDatosCabecera();

    
                $.ajax({
                    type: 'POST',
                    url:"http://localhost:9090/api/v1/cabecera",
                    dataType:"json",
                    data: cabecera,
                    success:function(data){
                                                 
                    },
                    error:function() {
                        $alert("error occured");
                    }
                });
            }
            
            function obtenerDatosCabecera(){
                var monto = $('#selector').val();
                var id_cliente = $('#id_cliente').val();
                var concepto = $('#selector option:selected').text().toString();
                var fecha = Date();
                let cabecera = {
                    id_cliente: id_cliente,
                    puntaje_utilizado: monto,
                    fecha: fecha,
                    concepto: concepto
                };
                
                return cabecera;
            }

          
        </script>
    </body>
</html>
