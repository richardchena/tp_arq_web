<%-- 
    Document   : cliente
    Created on : 20 sept. 2022, 09:38:19
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
        <nav class="navbar navbar-dark bg-info">
            <span class="navbar-brand mb-3 h1">Electiva 3</span>
            <a href='cliente.jsp' class="text-white justify-content-center"  >Cliente</a>
            <a href='index.html' class="text-white justify-content-center"  >Reportes</a>
            <a href='index.html' class="text-white justify-content-center"  >Bolsa de puntos</a>
            <button onclick="location.href='./'" class="btn btn-outline-dark text-white"  type="button">INICIO</button>
        </nav>
        <h1>Clientes</h1>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <table class="table table-bordered">
                    <button onclick="location.href='createuser.jsp'" class="btn btn-success text-white" type="button">Agregar cliente</button>
                    <br>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <Th>Cedula</Th> 
                            <Th>Correo</Th> 
                            <Th>Nacionalidad</Th>
                            <th>Telefono</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td>1</td>
                            <td>Maiki</td>
                            <td>123456</td>
                            <td>maiki@gmail.com</td>
                            <td>Paraguayo</td>
                            <td>0983925798 </td>
                            
                            <td>
                                <a href="{{ url('/edit-user/'.$user->id) }}" class="btn btn-primary">Editar</a>
                            </td>
                            <td>
                                <form action="{{ url('/delete-user/'.$user->id)}}" method="POST">
                                    
                                    <button  class="btn btn-danger">Eliminar</button>
                                </form>
                                
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
