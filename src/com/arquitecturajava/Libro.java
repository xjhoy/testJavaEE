package com.arquitecturajava;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jhoseph Arango on 09/10/2015.
 */
public class Libro {
    private String isbn;
    private String titulo;
    private String categoria;

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Libro(String isbn, String titulo,String categoria) {
        this.isbn       = isbn;
        this.titulo     = titulo;
        this.categoria  = categoria;
    }

    public static List<Libro> buscarTodos(){
        String consultaSQL = "SELECT isbn,titulo,categoria FROM libros";
        DataBaseHelper<Libro> helper = new DataBaseHelper<Libro>();
        List<Libro> listaDeLibros = helper.seleccionarRegistros(consultaSQL,Libro.class);
        return listaDeLibros;
    }

    public static List<String> buscarTodasLasCategorias(){
        String consultaSQL = "SELECT DISTINCT(categoria) FROM libros";
        DataBaseHelper<String> helper = new DataBaseHelper<String>();
        List<String> listaDeCategorias = helper.seleccionarRegistros(consultaSQL,String.class);
        return listaDeCategorias;
    }

    public void insertar(){
        String consultaSQL = "INSERT INTO libros(isbn,titulo,categoria) VALUES ";
                consultaSQL += "('"+ this.isbn +"','"+ this.titulo +"','"+ this.categoria +"')";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
}
