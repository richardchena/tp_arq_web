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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        *{
            margin: 0;
            padding: 5px;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .row{
            border: 1px solid;
            border-radius: 10px;
            margin-top: 10px;
        }

        
    </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-info">
            <span class="navbar-brand mb-3 h1">Electiva 3</span>
            <a href='cliente.jsp' class="text-white justify-content-center"  >Cliente</a>
            <a href='index.html' class="text-white justify-content-center"  >Reportes</a>
            <a href='index.html' class="text-white justify-content-center"  >Bolsa de puntos</a>
            <button onclick="location.href='./'" class="btn btn-outline-dark text-white"  type="button">INICIO</button>
        </nav>
        <h1>Agregar Cliente</h1>
        
        <form class="row g-1">
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Nombre</label>
    <input type="email" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Apellido</label>
    <input type="password" class="form-control" id="inputPassword4">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">Nacionalidad</label>
    <input type="text" class="form-control" id="inputAddress" >
  </div>
  <div class="col-12">
    <label for="inputAddress2" class="form-label">Correo</label>
    <input type="text" class="form-control" id="inputAddress2" >
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">Telefono</label>
    <input type="text" class="form-control" id="inputCity">
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">Fecha de nacimiento</label>
    <select id="inputState" class="form-select">
      <option selected>Choose...</option>
      <option>...</option>
    </select>
  </div>
  
  
  <div class="col-12">
       <a href="cliente.jsp" class="btn btn-primary">Volver</a>
           
    <button type="submit" class="btn btn-success">Confirmar</button>
  </div>
</form>
        
    </body>
</html>
