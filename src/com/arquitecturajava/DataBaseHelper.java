package com.arquitecturajava;
/**
 * Created by Jhoseph Arango on 08/10/2015.
 */
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataBaseHelper<T> {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost/arquitecturajava";
    private static final String USER = "root";
    private static final String PW = "";

    public int modificarRegistro(String consultaSQL){
        Connection conexion = null;
        Statement sentencia = null;
        int filasAfectadas = 0;
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL,USER,PW);
            sentencia = conexion.createStatement();
            filasAfectadas = sentencia.executeUpdate(consultaSQL);

        }catch (SQLException e){
            System.out.println("Error al acceder a la base de datos " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Error con el Driver " + e.getMessage());
        }
        finally{
            if (sentencia != null){
                try {
                    if (sentencia != null){
                        sentencia.close();
                    }
                }catch (SQLException e){
                    System.out.println("Error al cerrar la sentencia" + e.getMessage());
                }
            }
            if (conexion != null){
                try {
                    if (conexion != null){
                        conexion.close();
                    }
                }catch (SQLException e){
                    System.out.println("Error al cerrar la conexion" + e.getMessage());
                }
            }
        }
        return filasAfectadas;
    }
    public List<T> seleccionarRegistros(String consultaSQL,Class clase){
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet filas = null;
        List<T> listaDeObjetos = new ArrayList<T>();
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL,USER,PW);
            sentencia = conexion.createStatement();
            filas = sentencia.executeQuery(consultaSQL);
            while (filas.next()){
                T objeto =(T) Class.forName(clase.getName()).newInstance();
                Method[] metodos = objeto.getClass().getDeclaredMethods();
                for (int i = 0; i < metodos.length ; i++) {
                    if (metodos[i].getName().startsWith("set")){
                        System.out.println("listado");
                        metodos[i].invoke(objeto,
                                filas.getString(metodos[i].getName().substring(3)));
                    }
                    if (objeto.getClass().getName().equals("java.lang.String")){
                        System.out.println("categoria");
                        objeto = (T)filas.getString(1);
                    }
                }
                listaDeObjetos.add(objeto);
            }
        }catch (Exception e){
            System.out.println("Error al acceder a la base de datos " + e.getMessage());

        }
        finally {
            if (sentencia != null){
                try {sentencia.close();}catch (SQLException e){}
            }
            if (conexion != null){
                try {conexion.close();}catch (SQLException e){}
            }
        }
        return listaDeObjetos;
    }



}
