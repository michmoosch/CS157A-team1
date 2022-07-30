import java.sql.*;

class MysqlCon{
	public static void main(String args[]){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Driveways?autoReconnect=true&useSSL=false","root","Root123@");
					//here wu is database name, root is username and password
					Statement stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery("select * from Driveways.Test");
					while(rs.next())
						System.out.println(rs.getInt(1));
					con.close();
		}catch(Exception e){ System.out.println(e);}
	}
}