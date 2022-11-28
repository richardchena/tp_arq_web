<%-- 
    Document   : sorteo
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
        <title>Sortear</title>
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
              <li class="nav-item">
                <a class="nav-link text-muted" href="/tp_arq_web/view/sorteos/sorteo.jsp">Sorteo</a>
              </li>
            </ul>
          </div>
        </nav>
        <h3>Sortear Premios </h3>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <form>
    
                    <div class="campo">
                        <label class="label_campo"> Premio: </label>
                        <input class="label_campo" type="text" id="premio">
                    </div>
                    <div class="campo">
                      
                        <label class="label_campo" for="inferior" >Puntos mínimos:</label>
                        <input class="label_campo" id="minimo"  type="number" name="lim_inf" />
                    </div>
                    <div class="campo">
                        <label class="label_campo" for="superior" >Puntos máximos:</label>
                        <input class="label_campo" id="maximo"  type="number" name="lim_sup" />
                    </div>

                    <div class="campo">
                      <label  class="label_campo" for="montoperacion">Fecha límite:</label>
                      <input class="label_campo" type="date" id="fecha">
                    </div>
                    <br>
                    <div class="campo">
                       <button onclick="sortear();" class="btn btn-success text-white" id="boton" type="button" >Sortear</button>
                    </div>
                    <div class="sorteo-disabled" id="sorteo">
                      <label class="label_sorteo" id="ganadorx"></label>
                      <label class="label_sorteo" id="nro_doc"></label>
                      <label class="label_sorteo" id="texto"></label>
                      <div class="campo">
                        <button style="visibility: hidden" onclick="location.href='/tp_arq_web/view/sorteos/sorteo.jsp'" id="boton_sorteo" class="btn btn-success text-white" type="button">REALIZAR OTRO SORTEO</button>
                      </div>
                    </div>
                </form>   
            </div>
        </div>
        <script>

            
            function sortear(){
                var premio = $('#premio').val();
                var minimo = $('#minimo').val();
                var maximo = $('#maximo').val();
                var fecha = "'"+($('#fecha').val())+"'";
                
                $.ajax({
                    type: 'GET',
                    url:"http://localhost:9090/api/v1/cliente/ganadorx/"+premio+"/"+minimo+"/"+maximo+"/"+fecha,
                    dataType:"json",
                    success:function(res){
                        mostrarMensaje(res); 
                        //enviar(res);  
                        
                    },
                    error:function(err) {
                        swal("Ocurrio un error: " + err);
                    }
                });
            }
            
            function mostrarMensaje(res) {
                document.getElementById('boton_sorteo').style.visibility = "visible";
                $('#sorteo').addClass("sorteo");
                if(res.nom_comp===""){
                    document.getElementById('ganadorx').innerHTML = '';
                    document.getElementById('nro_doc').innerHTML = 'NO SE ENCONTRO UN/A GANADOR/A';
                    document.getElementById('texto').innerHTML = '';
                }else{
                    document.getElementById('ganadorx').innerHTML = (res.nom_comp).toUpperCase();
                    document.getElementById('nro_doc').innerHTML = 'N° DOCUMENTO: '+(res.cedula).toUpperCase();
                    document.getElementById('texto').innerHTML = 'GANÓ UN/A '+ (res.premio).toUpperCase()+'!!';
                }
            }
            
   
            function enviar(res){
                let json = datos(res);
                console.log(json);
                $.ajax({
                    type: 'get',
                    url:"http://localhost:9090/api/v1/envio_mail",
                    dataType:"json",
                    data: json,
                    success:function(data){             
                        swal(data.message.toUpperCase());
                    },
                    error:function(err) {
                        console.log(err);
                        swal("Ocurrio un error: " + err);
                    }
                });
            }
            
            function datos(res){
                let obj = {
                    premio: res.premio,
                    email: res.correo,
                    nombre:res.nom_comp
                };
                
               return obj;
            }         
           
        </script>
     
    </body>
</html>
