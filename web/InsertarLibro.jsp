<%--
  Created by IntelliJ IDEA.
  User: Jhoseph Arango
  Date: 08/10/2015
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!-- Sentencia de import necesarias para el jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.arquitecturajava.DataBaseHelper" %>
<%@ page import="com.arquitecturajava.Libro" %>

<%
    String isbn         =   request.getParameter("isbn");
    String titulo       =   request.getParameter("titulo");
    String categoria    =   request.getParameter("categoria");

    Libro libro = new Libro(isbn,titulo,categoria);
    libro.insertar();
    response.sendRedirect("MostrarLibros.jsp");
%>




