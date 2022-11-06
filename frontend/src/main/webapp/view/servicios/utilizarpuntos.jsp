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
                      <input type="number" id="cedula" value=10010>
                    </div>
                    <div class="campo">
                      <label for="inputState">Concepto</label>
                      <select id="inputState">
                        <option selected>Seleccionar</option>
                        <option>Vale de consumision</option>
                        <option>Vale de regalo</option>
                        <option>...</option>
                      </select>
                    </div>
                    <br>
                    <div class="campo">
                       <button onclick="encontrar_id();" class="btn btn-success text-white" type="button">Utilizar puntos</button>
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
            
            function encontrar_id() {
                $.ajax({
                    url:"http://localhost:9090/api/v1/bolsa?id="+1,
                    dataType:"json",
                    success:function(res){
                        var j=0;
                        var caducidad = res[0].caducidad_puntaje;
                        
                        for(i=0;i<res.length;i++){
                            let p = res[i];
                            if(p.caducidad_puntaje > caducidad){
                                caducidad=p.caducidad_puntaje;
                                j=i;
                            }
                            alert(id);
                        }
                        
                        var id = res[j].id;
                        var id_cliente= res[j].id_cliente;
                        var asignacion_puntaje= res[j].asignacion_puntaje;
                        var caducidad_puntaje= res[j].caducidad_puntaje;
                        var puntaje_asignado= res[j].puntaje_asignado;
                        var puntaje_utilizado= res[j].puntaje_utilizado;
                        var saldo_puntos= res[j].saldo_puntos;
                        var monto_operacion= res[j].monto_operacion;
                        var bolsa = {
                            "id":id,
                            "id_cliente": id_cliente,
                            "asignacion_puntaje": asignacion_puntaje,
                            "caducidad_puntaje": caducidad_puntaje,
                            "puntaje_asignado": puntaje_asignado,
                            "puntaje_utilizado": 1,
                            "saldo_puntos": saldo_puntos-1,
                            "monto_operacion": monto_operacion
                        };
                        $.ajax({
                            data: bolsa,
                            type: "POST",
                            url:"http://localhost:9090/api/v1/bolsa",
                            dataType:"json",
                            success:function(data){
                                   alert("holis");
                            },
                            error:function() {
                                $alert("error occured");
                            }
                        });

                       
                       
                    },
                    error:function() {
                        $alert("error occured");
                    }
                });
            }

            
            function hola(){
                alert("sfskflm");
            }
        </script>
    </body>
</html>
