package db;

import java.sql.*;

public class DBBean {	
	/**
	 * 创建数据库连接
	 * @return
	 */
	/*
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			String url = "jdbc:mysql://localhost:3306/mysql?user=root&password=dengnong1&useUnicode=true&characterEncoding=utf-8";
			conn = DriverManager.getConnection(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	*/
	
	/**
	 * 关闭数据库的连接、语句以及结果集等资源
	 * @param conn
	 * @param stmt
	 * @param rset
	 */

	
	
	public static Connection getConnection() {
		// TODO Auto-generated method stub
        String driver = "com.mysql.jdbc.Driver";
		
		// URL指向要访问的数据库名scutcs
		String url = "jdbc:mysql://localhost:3306/golf-crm?"
				+ "useUnicode=true&characterEncoding=gbk&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true";
		// MySQL配置时的用户名
		String user = "root";
		// Java连接MySQL配置时的密码
		String password = "dengnong1";

			// 加载驱动程序
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			// 连续数据库
			Connection conn = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				conn = DriverManager.getConnection(url, user, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   //1
	
			try {
				if(!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return conn;
	}
	
	public static void clean(Connection conn,Statement stmt, ResultSet rset) {
		try{
			if(rset != null)
				rset.close();
			if(stmt != null)
				stmt.close();
			if(conn != null)
				conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	//更新数据库 用于更新信息后刷新
	public static boolean update(String sql) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			result = true;
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			clean(conn,stmt,rset);
		}
		return result;
	}
	
	
	//删除数据
	public static boolean delete(String sql) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.execute(sql);
			result = true;
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			clean(conn,stmt,rset);
		}
		System.out.println("delet!!!");
		return result;
	}

	
//执行查询
public static ResultSet query(String SqlString) {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rset = null;
	try {
		conn = getConnection();
		stmt = conn.createStatement();			
	    rset = stmt.executeQuery(SqlString);		    
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();			
	} finally{
		clean(conn,stmt,rset);
	}
	return rset;
	}

public static boolean hasRecord(String sql) {
	// TODO Auto-generated method stub
	boolean result = false;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rset = null;
	try {
		conn = getConnection();
		stmt = conn.createStatement();			
	    rset = stmt.executeQuery(sql);
	    while(rset.next()){
	    	result = true;
	    }
	} catch (SQLException e) {
		e.printStackTrace();			
	} finally{
		clean(conn,stmt,rset);
	}
	
	return result;
}

public static void StartTransaction(Connection con, String[] sqls) throws Exception {    
    
    if (sqls == null) {    
        return;    
    }    
    Statement sm = null;    
    try {    
        // 事务开始    
        System.out.println("事务处理开始！");    
        con.setAutoCommit(false);   // 设置连接不自动提交，即用该连接进行的操作都不更新到数据库    
        sm = con.createStatement(); // 创建Statement对象    
            
        //依次执行传入的SQL语句    
        for (int i = 0; i < sqls.length; i++) {    
            sm.execute(sqls[i]);// 执行添加事物的语句    
        }    
        System.out.println("提交事务处理！");    
            
        con.commit();   // 提交给数据库处理    
            
        System.out.println("事务处理结束！");    
        // 事务结束    
            
    //捕获执行SQL语句组中的异常        
    } catch (SQLException e) {    
        try {    
            System.out.println("事务执行失败，进行回滚！\n");    
            con.rollback(); // 若前面某条语句出现异常时，进行回滚，取消前面执行的所有操作    
        } catch (SQLException e1) {    
            e1.printStackTrace();    
        }    
    } finally {    
        sm.close();    
    }    
}  

}
	
	/**
	 * 检查是否存在满足SQL语句的记录，在创建新用户时用于检查用户名是否已存在
	 * @param SqlString
	 * @return
	 */


