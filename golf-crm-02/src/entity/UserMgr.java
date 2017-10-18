package entity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;

public class UserMgr{
	private ArrayList<User> userList;
	
	public UserMgr(){
		super();
		userList = new ArrayList<User>();
	}

	public static  int verifyUser(String username, String password){
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		int result = -1;
		try {
			conn = DBBean.getConnection();
			
			String sql = "select * from tb_administrator where adm_Account='" + username
					+ "' and adm_password='" + password + "'";
			System.out.println("sql: " + sql);
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			if (rset.next()) {
				result = rset.getInt("adm_Permission");
				System.out.println("user type: " + result);
			}
		} catch (SQLException e) {
			System.out.println("SQLException inside verify user");
			e.printStackTrace();

		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}
	return result;
	}
	
	
}