<%-- 
    Document   : createuser
    Created on : 20 sept. 2022, 11:51:13
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
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Cliente - Agregar</title>
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
        <h3>Agregar Cliente</h3>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <form>
                    <div class="campo">
                      <label for="inputEmail4">Nombre</label>
                      <input type="text" id="nombre" required>
                    </div>
                    <div class="campo">
                      <label for="inputPassword4">Apellido</label>
                      <input type="text" id="apellido" required>
                    </div>
                    <div class="campo">
                      <label for="inputPassword4">Nro. Documento</label>
                      <input type="number" id="doc" required>
                    </div>
                    <div class="campo">
                      <label for="inputPassword4">Tipo documento</label>
                      <!--<input type="text" id="tipo">-->
                      <select name="select" id="tipo">
                            <option value="C.I." selected>C.I.</option>
                            <option value="Pasaporte">Pasaporte</option>
                      </select>
                    </div>
                    <div class="campo">
                      <label for="inputAddress">Nacionalidad</label>
                      <input type="text" id="nac" required>
                    </div>
                    <div class="campo">
                      <label for="inputAddress2">Correo</label>
                      <input type="email" id="email" required>
                    </div>
                    <div class="campo">
                      <label for="inputCity">Telefono</label>
                      <input type="text" id="tel" required>
                    </div>
                    <div class="campo">
                      <label for="inputState">Fecha de nacimiento</label>
                      <input type="date" name="fec_nacimiento" id="fec" required>
                    </div>
                    <br>
                    <div class="campo">
                       <button onclick="location.href='./cliente.jsp'" class="btn btn-primary text-white" type="button">Volver</button>
                       <button onclick="validar_campos()" class="btn btn-success text-white" type="button">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
        <script>
            function validar_campos(){
                let j = obtener_datos();
                
                if(j.nombre === '' || 
                   j.apellido === '' || 
                   j.doc_nro === '' || 
                   j.tipo_doc === '' ||
                   j.nacionalidad === '' || 
                   j.email === '' || 
                   j.telefono === '' ||
                   j.fec_nac === '') {
                    swal("Debe completar todos los campos");
                } else{
                    crear_user();
                }
            }
            
            function crear_user(){
                let json = obtener_datos();
                
                $.ajax({
                    type: 'post',
                    url:"http://localhost:9090/api/v1/cliente/",
                    dataType:"json",
                    data: json,
                    success:function(data){
                        //EL BACKEND RETORNA UN MENSAJE Y ESO OBTENGO
                        swal(data.message.toUpperCase(), 
                        ).then(okay => { 
                            if (okay) {
                                window.location.href='./cliente.jsp';
                            }
                        });
                    },
                    
                    error:function(data) {
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
        </script>
    </body>
</html>
