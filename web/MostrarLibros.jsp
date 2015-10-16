<%--
  Created by IntelliJ IDEA.
  User: Jhoseph Arango
  Date: 08/10/2015
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.arquitecturajava.DataBaseHelper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.arquitecturajava.Libro" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type=" content="text/html"; charset="UTF-8">
    <title>Lista de Libros</title>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
</head>
<body>
    <div class="container">
        <br>
        <label>Seleccionar categoria</label>
        <select name="categorias" class="browser-default">
        <option value="seleccionar">Seleccionar</option>
        <%
            List<String>listaDeCategoria = null;
            listaDeCategoria = Libro.buscarTodasLasCategorias();
            for (String categoria : listaDeCategoria){
        %>
                <option value="<%=categoria%>"><%=categoria%></option>
            <%}%>
        <br>

    </select>
    <br><br>
        <div class="collection">
        <%
        // MOSTRAR LISTADO
            List<Libro> listaDeLibros = null;
            listaDeLibros = Libro.buscarTodos();
            for (Libro libro: listaDeLibros){%>
                <a href="#!" class="collection-item">
                    <%=libro.getIsbn()%>
                    <%=libro.getTitulo()%>
                    <%=libro.getCategoria()%>
                </a>
            <%}
        %>
        </div>
    <a href="FormularioLibro.jsp" class="waves-effect waves-light btn">Insertar libro</a><br><br>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
    <script>
        $(document).ready(function() {
        $('select').material_select();
        });
    </script>
</body>
</html>