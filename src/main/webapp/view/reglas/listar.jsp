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
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <footer>
            <iframe src="/tp_arq_web/view/cabecera/cabecera.jsp"></iframe>
        </footer>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <table class="table table-bordered text-center">
                    <button onclick="location.href='agregar.jsp'" class="btn btn-success text-white" type="button">Agregar regla</button>
                    <br><br>
                    <thead>
                        <tr>
                            <th>Limite inferior</th>
                            <th>Limite superior</th>
                            <th>Monto</th>
                            <th>Controles</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td>200000</td>
                            <td>499999</td>     
                            <td>30000</td> 
                            <td>
                                <button class="btn btn-primary" type="button">Modificar</button>
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
        </script>
    </body>
</html>
