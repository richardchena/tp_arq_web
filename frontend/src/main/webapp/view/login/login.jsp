<%-- 
    Document   : login
    Created on : 25 nov. 2022, 22:28:52
    Author     : richard
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style.css">
        <link rel="stylesheet" type="text/css" href="/tp_arq_web/styles/style_cabecera.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <title>SFC - Inicia sesión</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark tp-color">
          <a class="navbar-brand" href="/tp_arq_web">
            <img src="/tp_arq_web/img/logo.png" width="30" height="30" class="d-inline-block tp-color alejar" alt="">
          </a>
          <a href="/tp_arq_web" 
             <span style="text-align: center" class="navbar-brand mb-0 h1 text-black text-center">SFC</span>
          </a>
        </nav>
        
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8" style="width: 500px; margin-top: 80px">
            
            <div class="py-4 px-4 bg-white overflow-hidden shadow p-3 mb-5 bg-white rounded">
                <h3 style="padding-top: 5px;">¡Te damos la bienvenida!</h3>
                <br> 
                
                <img src="/tp_arq_web/img/logo.png" width="100" height="100" class="mx-auto d-block" alt="">
                
                <br>
                
                <div class="campo">
                    <a class="btn btn-outline-dark" href="#" role="button" style="text-transform:none" id="my_tag_a">
                    <img width="20px" style="margin-bottom:3px; margin-right:5px" alt="Google sign-in" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" />
                    Inicia sesión con Google
                  </a>
                </div>

            </div>
        </div>
        
    </body>
    <script>
        $("#my_tag_a").on('click', function() {
          obtener_link();
        });
        
        function obtener_link() {
            $.ajax({
                type: 'GET',
                url:"http://localhost:9090/auth/google/",
                dataType:"json",
                success:function(res){
                    mostrar_ventana(res.message);
                },
                error:function(err) {
                    swal(err);
                }
            });
        }
        
        function mostrar_ventana(url){
            let left = (screen.width - 500) / 2;
            let top = (screen.height - 600) / 4;
                        
            window.open(url, 
            'popup', 
            'width=500px, height=600px, top='+ top +'px, left=' + left + 'px');
        }
    </script>
</html>
