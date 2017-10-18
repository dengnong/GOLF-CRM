package entity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;

public class Cou_serMgr {
	private ArrayList<Cou_ser> cou_serList;
	
	public Cou_serMgr(){
		super();
		cou_serList = new ArrayList<Cou_ser>();
	}
	
	public ArrayList<Cou_ser> getCou_serList(){
		cou_serList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		Cou_ser cou_ser = null;
		
		try {
			conn = DBBean.getConnection();
			String sql = "select * from tb_service";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				cou_ser = new Cou_ser(rset.getInt("cou_Number"),
						rset.getInt("ser_ServiceID"),
						rset.getString("ser_Green"),
						rset.getInt("ser_Caddie"),
						rset.getInt("ser_GolfCar"),
						rset.getString("ser_Catering"),
						rset.getInt("ser_Wardrobe"),
						rset.getString("ser_Lounge")
						);
				
				cou_serList.add(cou_ser);
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
		
				return cou_serList;
	}
	
	public static Cou_ser getCou_ser(int cou_Number){
		String sql = "select * from tb_service where cou_Number=('" + cou_Number
				+ "')" ;
		Cou_ser cou_ser = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			
			while (rset.next()) {
				cou_ser = new Cou_ser(rset.getInt("cou_Number"),
						rset.getInt("ser_ServiceID"),
						rset.getString("ser_Green"),
						rset.getInt("ser_Caddie"),
						rset.getInt("ser_GolfCar"),
						rset.getString("ser_Catering"),
						rset.getInt("ser_Wardrobe"),
						rset.getString("ser_Lounge")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		
		
		return cou_ser;
		
	}

	public boolean addService(Cou_ser newService){
		boolean result = false;
		//如果添加项已经存在的情况
		if(findService(newService)){
			result = false;
		}else{
		String sql = "insert into tb_service(cou_Number,ser_ServiceID,ser_Green,ser_Caddie,"
				+ "ser_GolfCar,ser_Catering,ser_Wardrobe,ser_Lounge)values('"
				+newService.getCou_Number()+"','"
				+newService.getSer_ServiceID()+"','"
				+newService.getSer_Green()+"','"
				+newService.getSer_Caddie()+"','"
				+newService.getSer_GolfCar()+"','"
				+newService.getSer_Catering()+"','"
				+newService.getSer_Wardrobe()+"','"
				+newService.getSer_Lounge()
				+"')";
		
		if (DBBean.update(sql)) {
			System.out.println("DBupdate");
			result = true; //
		}
		}
		return result;
	}
	
	public boolean findService(Cou_ser cou_ser) {
		// TODO Auto-generated method stub
		boolean result = false;
		String sql = "select * from tb_service where cou_Number=('"
				+cou_ser.getCou_Number() + "') and ser_ServicID=('"
				+cou_ser.getCou_Number() + "')";
		System.out.println("find service:"+sql);
		result = DBBean.hasRecord(sql);
		
		return result;
	}
	
	public boolean deletService(Cou_ser cou_ser) {
		// TODO Auto-generated method stub
		boolean result = false;
		String sql = "select * from tb_service where cou_Number=('"
				+cou_ser.getCou_Number() + "') and ser_ServicID=('"
				+cou_ser.getCou_Number() + "')";
		result = DBBean.delete(sql);
		System.out.println("delet service:"+sql);
		
		return result;
	}
	

}
