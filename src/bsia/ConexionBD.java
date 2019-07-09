/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bsia;

import java.sql.*;

/**
 *
 * @author pipe
 */
public class ConexionBD {
	Connection cn;
	
	public Connection conexion(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SIA1","testuser","pass");
			System.out.println("Conectado!");
		}catch(Exception e){
			System.out.println(e.getMessage());
		}return cn;
	}
	Statement createStatement(){
		throw new UnsupportedOperationException("Error!");
	}
}
