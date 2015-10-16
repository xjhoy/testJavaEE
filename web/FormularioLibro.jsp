<%@ page contentType="text/html; charset=UTF-8" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html
        PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario Libro</title>
    <!-- Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
    <link rel="stylesheet" href="css/main.css">

</head>
<body>
<div class="wrapper">
    <h2 class="titulo">Alta de Libros <img src="img/books1.png" alt=""></h2>
    <form action="InsertarLibro.jsp" id="miformulario">

        <div class="input-field col s6">
            <input id="isbn" type="text" name="isbn" class="validate"/>
            <label for="isbn">ISBN</label>
        </div>

        <div class="input-field col s6">
            <input id="titulo" type="text" name="titulo" class="validate"/>
            <label for="titulo">Titulo</label>
        </div>
        <label for="categorias">Categoria</label>
        <select name="categoria" id="categorias" class="browser-default">
            <option value="programacion">Programación</option>
            <option value="web">Web</option>
            <option value="database">Base de datos</option>
        </select>

        <br><br>
        <input type="button" value="Insertar" onclick="validacion()" class="btn"/>

    </form>

</div>

    <script src="js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>

</body>
</html>