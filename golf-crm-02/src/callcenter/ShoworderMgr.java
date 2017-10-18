package callcenter;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;

public class ShoworderMgr {

	private ArrayList<Showorder> showorderList;
	public ShoworderMgr() {
		
		super();
		showorderList = new ArrayList<Showorder>();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Showorder> getShoworderList(){
		
	showorderList.clear();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rset = null;
	 
	Showorder showorder = null;
	try {
	conn = DBBean.getConnection();
	String sql = "select tb_order.ord_Number,tb_customerinfo.cus_Name,tb_customerinfo.cus_Phone,"
			+"tb_product.pro_Name,tb_course.cou_Name,tb_service.ser_ServiceID,"
			+"tb_order.ord_ReDate,tb_order.ord_Member,tb_order.ord_Price,"
			+"tb_order.ord_Shouldequity,tb_order.ord_Date "
			+"from tb_customerinfo,tb_order,tb_service,tb_course,tb_product "
			+"where tb_customerinfo.cus_Phone=tb_order.vip_Phone and tb_course.pro_Number=tb_product.pro_Number "
			+"and tb_course.cou_Number=tb_service.cou_Number "
			+"and tb_order.cou_Number=tb_course.cou_Number and tb_order.ser_ServiceID=tb_service.ser_ServiceID ";
	stmt = conn.createStatement();
	rset = stmt.executeQuery(sql);
	while (rset.next())
	{
		showorder = new Showorder(rset.getInt("ord_Number"),
				rset.getString("cus_Name"),
				rset.getString("cus_Phone"),
				rset.getString("pro_Name"),
				rset.getString("cou_Name"),
				rset.getInt("ser_ServiceID"),
				rset.getString("ord_ReDate"),
				rset.getInt("ord_Member"),
				rset.getFloat("ord_Price"),
				rset.getInt("ord_Shouldequity"),
				rset.getString("ord_Date"));
		showorderList.add(showorder);
	}	
	}catch (SQLException e){
		e.printStackTrace();	
	}finally{
		try{
			rset.close();
			stmt.close();
			conn.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	return showorderList;
	}
	public static Showorder getShoworder(int ord_Number){
		String sql = "select tb_order.ord_Number,tb_customerinfo.cus_Name,tb_customerinfo.cus_Phone,"
				+"tb_product.pro_Name,tb_course.cou_Name,tb_service.ser_ServiceID,"
				+"tb_order.ord_ReDate,tb_order.ord_Member,tb_order.ord_Price,"
				+"tb_order.ord_Shouldequity,tb_order.ord_Date "
				+"from tb_customerinfo,tb_order,tb_service,tb_course,tb_product "
				+"where tb_customerinfo.cus_Phone=tb_order.vip_Phone and tb_course.pro_Number=tb_product.pro_Number "
				+"and tb_course.cou_Number=tb_service.cou_Number  and tb_order.pro_Number=tb_product.pro_Number "
				+"and tb_order.cou_Number=tb_course.cou_Number and tb_order.ser_ServiceID=tb_service.ser_ServiceID ";
		Showorder showorder= null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			
			while (rset.next())
			{
				showorder = new Showorder(rset.getInt("ord_Number"),
						rset.getString("cus_Name"),
						rset.getString("cus_Phone"),
						rset.getString("pro_Name"),
						rset.getString("cou_Name"),
						rset.getInt("ser_ServiceID"),
						rset.getString("ord_ReDate"),
						rset.getInt("ord_Member"),
						rset.getFloat("ord_Price"),
						rset.getInt("ord_Shouldequity"),
						rset.getString("ord_Date")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		return showorder;
	}
	
}
