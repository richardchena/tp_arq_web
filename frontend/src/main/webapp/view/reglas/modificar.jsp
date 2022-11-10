<%-- 
    Document   : modificar
    Created on : Sep 22, 2022, 6:16:21 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reglas - Modificar</title>
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body onload="validar_url()">
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
                <a class="nav-link text-muted" href="/tp_arq_web/view/reglas/listar.jsp">Reglas</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="/tp_arq_web/view/actualizacion/actualizacion.jsp">Actualización</a>
              </li>
            </ul>
          </div>
        </nav>
        <h3>Modificar Regla</h3>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <form>
                    <div>
                        <input type="radio" id="reglaOp1"
                               name="contact" value="sinRango" checked="true"> Sin rango  <br>

                        <input type="radio" id="reglaOp2"
                                name="contact" value="conRango"> Con rango <br>
                    </div>
                    <div class="campo">
                      
                        <label class="la" for="inferior" >Limite inferior</label>
                        <input class="in" id="limite_inferior"  type="number" name="lim_inf" disabled="true"/>
                    </div>
                    <div class="campo">
                        <label class="la" for="superior" >Limite superior</label>
                        <input class="in" id="limite_superior"  type="number" name="lim_sup" disabled="true"/>
                    </div>
                    <div class="campo">
                        <label class="la" for="monto" >1 punto cada</label>
                        <input class="in" id="monto" class="block mt-1 w-full" type="number" name="monto" :value="old('name')"  required autofocus />
                    </div>
                    <br>
                    <div class="campo">
                       <button onclick="location.href='./listar.jsp'" class="btn btn-primary text-white" type="button">Volver</button>
                       <button onclick="validar_campos()" class="btn btn-success text-white" type="button">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
        <script>
            function obtener_datos(){
                const queryString = window.location.search;
                const urlParams = new URLSearchParams(queryString);
                
                let selection = document.getElementById("reglaOp1").checked;
                let obj = null;
                
                if(!selection){
                    obj = {
                        id: urlParams.get('id'),
                        limite_inferior: document.getElementById("limite_inferior").value,
                        limite_superior: document.getElementById("limite_superior").value,
                        monto: document.getElementById("monto").value
                    };
                } else {
                    obj = {
                        id: urlParams.get('id'),
                        monto: document.getElementById("monto").value
                    };
                }

                return obj;
            }
            
            function validar_campos(){
                let selection = document.getElementById("reglaOp1").checked;
                let j = obtener_datos();
                
                if(selection){
                    if(j.monto === ''){
                        swal("Debe completar el campo monto");
                    }
                    else{
                        modificar_regla();
                    }
                } else {
                    if(j.monto === '' || j.limite_inferior === '' || j.limite_superior === ''){
                        swal("Debe completar todos los campos");
                    }
                    else{
                        modificar_regla();
                    }
                }
            }
            
            function modificar_regla(){
                let json = obtener_datos();
                
                $.ajax({
                    type: 'put',
                    url:"http://localhost:9090/api/v1/reglas/",
                    dataType:"json",
                    data: json,
                    success: function(data){
                        //EL BACKEND RETORNA UN MENSAJE Y ESO OBTENGO
                        swal(data.message.toUpperCase(), 
                        ).then(okay => { 
                            if (okay) {
                                window.location.href='./listar.jsp';
                            }
                        });
                    },
                    
                    error: function(data) {
                        let mess = JSON.parse(data.responseText);
                        //EL BACKEND RETORNA UN MENSAJE Y ESO OBTENGO
                        swal(
                            mess.message.toUpperCase(), 
                            {
                                dangerMode: true,
                                buttons: true
                            }
                        ).then(okay => { 
                            if (okay) {
                                //window.location.reload();
                            }
                        });
                    }
                });
            }
            
            function validar_url(){
                const queryString = window.location.search;
                const urlParams = new URLSearchParams(queryString);
                
                if (urlParams.has('id') && !isNaN(urlParams.get('id'))){
                    obtener(urlParams.get('id'));
                } else {
                    window.location.href='./lista.jsp';
                }
            }
            
            function obtener(id){
                $.ajax({
                    type: 'GET',
                    dataType:"json",
                    url:"http://localhost:9090/api/v1/reglas/" + id,
                    success:function(res){
                        if(res.limite_inferior === null){
                            document.getElementById("reglaOp1").checked = true;

                        }else{
                            document.getElementById("reglaOp2").checked = true;
                            document.getElementById("limite_inferior").removeAttribute('disabled');
                            document.getElementById("limite_superior").removeAttribute('disabled');
                        }
                        
                        document.getElementById("limite_inferior").value = res.limite_inferior;
                        document.getElementById("limite_superior").value = res.limite_superior;
                        document.getElementById("monto").value = res.monto;
                    },
                    error:function(err) {
                        swal(err.responseJSON.message)
                            .then(okay => { 
                                if (okay) {
                                    window.location.href='./listar.jsp';
                                }
                            });
                    }
                });
            }
        </script>
    </body> 
    <script> 
        $(document).ready(function() { 
          $("#reglaOp1").click(function(){ 
            $("#limite_inferior").prop("disabled", true); 
            $("#limite_superior").prop("disabled", true);
            }); 

          $("#reglaOp2").click(function(){ 
            $("#limite_inferior").prop("disabled", false); 
            $("#limite_superior").prop("disabled", false); 
            }); 
        }); 
    </script> 
</html>
