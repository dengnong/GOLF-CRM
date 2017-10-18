package callcenter;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;
import entity.Cou_ser;

public class OrderMgr {
	private ArrayList<Order> orderList;
	public OrderMgr(){
		super();
		orderList = new ArrayList<Order>();	
	}
	
	public ArrayList<Order> getOrderList(){
		orderList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		Order order= null;
		
		try {
			conn = DBBean.getConnection();
			String sql = "select * from view_vip03";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				order = new Order(rset.getString("view_vip_Name"),
						rset.getString("view_vip_Phone"),
						rset.getInt("view_pro_Number"),
						rset.getInt("view_vip_Residualdate"),
						rset.getInt("view_vip_Residualequity"),
						rset.getInt("view_vip_Enabled")
						);
				
				orderList.add(order);
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
		
				return orderList;
	}
	
	public static Order getOrder(String view_cus_Phone){
		String sql = "select * from view_vip03 where view_cus_Phone=('" + view_cus_Phone
				+ "')" ;
		Order order= null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			
			while (rset.next()) {
				order = new Order(rset.getString("view_vip_Name"),
						rset.getString("view_vip_Phone"),
						rset.getInt("view_pro_Number"),
						rset.getInt("view_vip_Residualdate"),
						rset.getInt("view_vip_Residualequity"),
						rset.getInt("view_vip_Enabled")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		
		
		return order;
		
	}
	
}
