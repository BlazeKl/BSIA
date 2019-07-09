package bsia;

import java.sql.*;

public class BSIA {

    public static void main(String[] args) {
		Connection con = null;
		
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SIA1","testuser","pass");
			System.out.println("Conectado!");
		}catch (SQLException e){
			System.err.println(e);
		}
		
		Login.main(args);
    }
    
}
