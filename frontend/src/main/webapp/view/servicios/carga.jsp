<%-- 
    Document   : carga
    Created on : 22 sept. 2022, 16:47:55
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
        <title>Cargar puntos</title>
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
                  <a class="dropdown-item" href="/tp_arq_web/view/reportes/usopuntos.jsp">Uso de puntos</a>
                  <a class="dropdown-item" href="/tp_arq_web/view/reportes/bolsapuntos.jsp">Bolsa de puntos</a>
                  <a class="dropdown-item" href="/tp_arq_web/view/reportes/puntoavencer.jsp">Clientes con puntos a vencer</a>
                  <a class="dropdown-item" href="/tp_arq_web/view/reportes/cliente.jsp">Clientes</a>
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
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/sorteos/sorteo.jsp">Sorteo</a>
              </li>
            </ul>
          </div>
        </nav>
        <h3>Cargar Puntos</h3>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <form>
                    <div class="campo">
                      <input class="input_cedula" type="number" id="cedula" placeholder="Cedula del cliente">
                      <button onclick="encontrarId();" class="boton text-white" type="button">Buscar</button>
                      <input type="number" id="id_cliente" type hidden>
                    </div>
                    <div class="campo">
                        <label class="label_campo"> Cliente: </label>
                        <label class="label_campo" id="nombre" ></label>
                    </div>
                    <div class="campo">
                      <label class="label_campo"> Puntos disponibles: </label>
                      <label class="label_campo" id="puntos" ></label>
                    </div>

                    <div class="campo">
                      <label  for="montoperacion">Monto de la operacion</label>
                      <input class="monto" type="number" id="monto">
                    </div>
                    <br>
                    <div class="campo">
                       <button onclick="obtenerPuntos();" class="btn btn-success text-white" id="boton" type="button" disabled="true">Cargar puntos</button>
                    </div>
                </form>   
            </div>
        </div>
        <script>
            $('#cedula').on("keyup",function(){
                var cedula = $('#cedula').val();
                if (cedula === ""){
                    $('#boton').prop('disabled', true);
                }else if(verificarMonto()){
                    $('#boton').prop('disabled', false);
                }
                });
                
            function verificarMonto(){
                monto = document.getElementById('monto').value;
                if (monto > 0){
                    return true;
                }
                return false;
            }
                
            $('#monto').on("keyup",function(){
                var monto = $('#monto').val();
                if (monto > 0){
                    if(verificarCedula()){
                        $('#boton').prop('disabled', false);
                    } 
                }else{
                    $('#boton').prop('disabled', true);
                }
                });
                
            function verificarCedula(){
                id = document.getElementById('cedula').value;
                if (id === ""){
                    return false;
                }
                return true;
            }
            
            function cargarInfo(cliente, saldo){
                var id_cliente = cliente[0].id; 
                id = document.getElementById('id_cliente');
                id.value = id_cliente;
                document.getElementById('nombre').innerHTML = cliente[0].nombre + ' ' +cliente[0].apellido;
                document.getElementById('puntos').innerHTML = saldo + ' puntos';
            }
            
            function encontrarId() {
                var cedula = $('#cedula').val();
                $.ajax({
                    url:"http://localhost:9090/api/v1/cliente/cedula/"+cedula,
                    dataType:"json",
                    success:function(res){
                        var id_cliente = res[0].id;  
                        verificarSaldo(id_cliente, 0, res);
                     
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
            
            function verificarSaldo(id_cliente, monto, data) {
                $.ajax({
                    url:"http://localhost:9090/api/v1/bolsa/saldo/"+id_cliente+"/"+monto,
                    dataType:"json",
                    success:function(res){
                        cargarInfo(data, res);                               
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
                var monto = $('#monto').val();
                let obj = {
                    c: monto,
                };
                return obj;
            }
            
            function obtenerPuntos(){
                j = obtenerMonto();
                
                $.ajax({
                    url:"http://localhost:9090/api/v1/reglas/query/" + j.c,
                    dataType:"json",
                    success:function(res){
                        let valor = res[0][0].prueba;
                        if (valor === null) {
                            swal({
                              text: "¡Verificar las reglas!",
                              icon: "error"
                            });
                        }else{
                            calcularFecha(valor);
              
                        }
                        
                    },
                    error:function(err) {
                        swal("Ocurrio un error: " + err);
                    }
                });
            }
            
            function calcularFecha(puntos) {
    
                $.ajax({
                    type: 'GET',
                    url:"http://localhost:9090/api/v1/parametro/caducidad/",
                    dataType:"json",
                    success:function(res){
                        crearBolsa(res, puntos);
                    },
                    error:function() {
                        alert("error occured");
                    }
                });
            }
            
            function crearBolsa(res, puntos){
                bolsa = obtenerDatos(res, puntos);
                $.ajax({
                    type: 'POST',
                    url:"http://localhost:9090/api/v1/bolsa",
                    dataType:"json",
                    data: bolsa,
                    success:function(data){
                        swal({
                          text: "¡Se ha cargado correctamente!",
                          icon: "success"
                        }).then(okay => { 
                            if (okay) {
                                window.location.reload();
                            }
                        });                  
                    },
                    error:function() {
                        $alert("error occured");
                    }
                });
            }
            
            function obtenerDatos(res, puntos){
                var id_cliente = $('#id_cliente').val();
                var monto = $('#monto').val();
                var puntos_asignados = puntos;
                var fecha_asignacion = Date();
                var fecha_caducidad = res;
                var puntaje_utilizado = 0;

                let bolsa = {
                    id_cliente: id_cliente,
                    asignacion_puntaje: fecha_asignacion,
                    caducidad_puntaje: fecha_caducidad,
                    puntaje_asignado: puntos_asignados,
                    puntaje_utilizado: puntaje_utilizado,
                    saldo_puntos: puntos_asignados,
                    monto_operacion: monto
                };
                
                return bolsa;
            }
        </script>
     
    </body>
</html>
