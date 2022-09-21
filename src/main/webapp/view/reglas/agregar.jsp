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
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
    </head>
    <body>
        <footer>
            <iframe src="/tp_arq_web/view/cabecera/cabecera.jsp"></iframe>
        </footer>
        <h1>Agregar Regla</h1>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="py-4 px-4 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <form>
                    
                    <div>
                        <input type="radio" id="reglaOp1"
                               name="contact" value="sinRango" checked="true"> Sin rango<br>           

                       <input type="radio" id="reglaOp2"
                                name="contact" value="conRango"> Con rango<br>
                      
                        <label for="inferior" >Limite inferior</label>
                        <input id="lim_inf" class="block mt-1 w-full" type="text" name="lim_inf" disabled="true"/>
                        <label for="superior" >Limite superior</label>
                        <input id="lim_sup" class="block mt-1 w-full" type="text" name="lim_sup" disabled="true"/>
                    </div>
                    <div>
                        <label for="monto" >1 punto cada</label>
                        <input id="monto" class="block mt-1 w-full" type="text" name="monto" :value="old('name')"  required autofocus />
                    </div>
                   <br><br><br>
                     <div>
                        <button onclick="location.href='./listar.jsp'" class="btn btn-primary text-white" type="button">Volver</button>
                        <button onclick="location.href='./'" class="btn btn-success text-white" type="button">Guardar regla</button>

                     </div>
                </form>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-1.6.2.min.js"></script> 
    <script> 
    $(document).ready(function() { 

      $("#reglaOp1").click(function(){ 
        $("#lim_inf").prop("disabled", true); 
        $("#lim_sup").prop("disabled", true);
        }); 

      $("#reglaOp2").click(function(){ 
        $("#lim_inf").prop("disabled", false); 
        $("#lim_sup").prop("disabled", false); 
        }); 
    }); 
    </script> 
</html>

