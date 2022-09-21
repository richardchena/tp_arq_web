<%-- 
    Document   : agregar_concepto
    Created on : Sep 20, 2022, 6:47:00 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
      
    </head>
    <body>
        <h1>Agregar Concepto</h1>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <form>
                    
                    <div>
                        <label for="name" >Descripcion</label>
                        <input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')"  required autofocus />
                    </div>
                    <div>
                        <label for="cedula" >Puntos requeridos</label>
                        <input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')"  required autofocus />
                    </div>
                   
                     <div>
                        <button onclick="location.href='./listar.jsp'" class="btn btn-primary text-white" type="button">Volver</button>
                        <button class="btn btn-success text-white" type="button">Guardar cliente</button>

                     </div>
                </form>
            </div>
        </div>
    </body>
</html>

