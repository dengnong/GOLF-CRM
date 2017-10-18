package entity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;

public class Pro_couMgr {
	private ArrayList<Pro_cou> pro_cou_serList;
	
	public Pro_couMgr(){
		super();
		pro_cou_serList = new ArrayList<Pro_cou>();
	}
	
	public ArrayList<Pro_cou> getPro_cou_serList(){
		pro_cou_serList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		Pro_cou pro_cou_ser = null;
		
		try {
			conn = DBBean.getConnection();
			String sql = "select * from tb_course";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				pro_cou_ser = new Pro_cou(rset.getInt("pro_Number"),
						rset.getInt("cou_Number"),
						rset.getString("cou_Name"),
						rset.getString("cou_Country"),
						rset.getString("cou_Province"),
						rset.getString("cou_City"),
						rset.getString("cou_Price")
						);
				
				pro_cou_serList.add(pro_cou_ser);
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
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
		
				return pro_cou_serList;
	}
	
	public static Pro_cou getPro_cou_ser(int pro_Number){
		String sql = "select * from tb_course where pro_Number=('" + pro_Number
				+ "')" ;
		Pro_cou pro_cou_ser = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			
			while (rset.next()) {
				pro_cou_ser = new Pro_cou(rset.getInt("pro_Number"),
						rset.getInt("cou_Number"),
						rset.getString("cou_Name"),
						rset.getString("cou_Country"),
						rset.getString("cou_Province"),
						rset.getString("cou_City"),
						rset.getString("cou_Price")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		
		
		return pro_cou_ser;
		
	}
	
	public boolean addCourse(Pro_cou newCourse){
		boolean result = false;
		//如果添加项已经存在的情况
		if(findCourse(newCourse)){
			result = false;
		}else{
		String sql = "insert into tb_course(pro_Number,cou_Number,cou_Name,cou_Country,"
				+ "cou_Province,cou_City,cou_Price)values('"
				+newCourse.getPro_Number()+"','"
				+newCourse.getCou_Number()+"','"
				+newCourse.getCou_Name()+"','"
				+newCourse.getCou_Country()+"','"
				+newCourse.getCou_Province()+"','"
				+newCourse.getCou_City()+"','"
				+newCourse.getCou_Price()
				+"')";
		
		if (DBBean.update(sql)) {
			System.out.println("DBupdate");
			result = true; //
		}
		}
		return result;
	}
	
	public boolean findCourse(Pro_cou pro_cou) {
		// TODO Auto-generated method stub
		boolean result = false;
		String sql = "select * from tb_course where pro_Number=('"
				+pro_cou.getPro_Number() + "') and cou_Number=('"
				+pro_cou.getCou_Number() + "')";
		System.out.println("find course:"+sql);
		result = DBBean.hasRecord(sql);
		
		return result;
	}
	
	public boolean deletCourse(Pro_cou pro_cou) {
		// TODO Auto-generated method stub
		boolean result = false;
		String sql = "select * from tb_course where pro_Number=('"
				+pro_cou.getPro_Number() + "') and cou_Number=('"
				+pro_cou.getCou_Number() + "')";
		result = DBBean.delete(sql);
		System.out.println("delet course:"+sql);
		
		return result;
	}
	

}
