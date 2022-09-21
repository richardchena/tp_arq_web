<%-- 
    Document   : listar_conceptos
    Created on : Sep 20, 2022, 6:27:49 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>LISTA</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
    </head>
    <body>
        <h1>Conceptos</h1>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <table class="table table-bordered">
                    <button onclick="location.href='agregar.jsp'" class="btn btn-success text-white" type="button">Agregar concepto</button>
                    <br>
                    <thead>
                        <tr>
                            <th>Concepto</th>
                            <th>Puntos</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td>Vale de compra</td>
                            <td>50</td>                            
                            <td>
                                <button class="btn btn-primary" type="button">Editar</button>
                            </td>
                            <td>
                                <button  class="btn btn-danger" type="button">Eliminar</button>
                            </td>
                        </tr>     
                        <tr>
                            <td colspan="6"></td>
                        </tr>
                       
                    </tbody>
                </table>
             </div>
        </div>
    </body>
</html>
