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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Utilizar Puntos</h1>
         <form class="col g-1">
  <div class="col-md-4">
    <label for="inputEmail4" class="form-label">Cedula del cliente</label>
    <input type="email" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">Concepto</label>
    <select id="inputState" class="form-select">
      <option selected>Seleccionar</option>
      <option>Vale de consumision</option>
      <option>Vale de regalo</option>
      <option>...</option>
    </select>
  </div>
   <div class="col-12">
       <a href="cliente.jsp" class="btn btn-primary">Cancelar</a>
           
    <button type="submit" class="btn btn-success">Utilizar puntos</button>
  </div>
</form> 
    </body>
</html>
