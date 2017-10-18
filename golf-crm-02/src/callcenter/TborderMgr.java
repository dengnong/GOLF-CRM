package callcenter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;
import entity.Cou_ser;
import entity.Customer;
public class TborderMgr {
	
	private static ArrayList<TbOrder> tborderList;
	public TborderMgr() {
		
		super();
		tborderList = new ArrayList<TbOrder>();
		// TODO Auto-generated constructor stub
	}
	public static ArrayList<TbOrder> getTbOrderList( ){
		
	tborderList.clear();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rset = null;
	 
	TbOrder tborder = null;
	try {
	conn = DBBean.getConnection();
	String sql = "select * from tb_Order";
	stmt = conn.createStatement();
	rset = stmt.executeQuery(sql);
	while (rset.next())
	{
		tborder = new TbOrder(rset.getInt("ord_Number"),
				rset.getString("vip_Phone"),
				rset.getInt("pro_Number"),
				rset.getInt("cou_Number"),
				rset.getInt("ser_ServiceID"),
				rset.getString("ord_Date"),
				rset.getString("ord_ReDate"),
				rset.getInt("ord_State"),
				rset.getFloat("ord_Price"),
				rset.getInt("ord_Shouldequity"),
				rset.getInt("ord_Member"),
				rset.getInt("ord_Pay")
				);
		tborderList.add(tborder);
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
	return tborderList;
	}
	public static TbOrder getTbOrder( ){
		String sql = "select * from tb_Order  " ;
		TbOrder tborder= null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while (rset.next()) {
				tborder = new TbOrder(rset.getInt("ord_Number"),
						rset.getString("vip_Phone"),
						rset.getInt("pro_Number"),
						rset.getInt("cou_Number"),
						rset.getInt("ser_ServiceID"),
						rset.getString("ord_Date"),
						rset.getString("ord_ReDate"),
						rset.getInt("ord_State"),
						rset.getFloat("ord_Price"),
						rset.getInt("ord_Shouldequity"),
						rset.getInt("ord_Member"),
						rset.getInt("ord_Pay")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		return tborder;
	}
	public static TbOrder getTborder( int ord_number){
		String sql = "select * from tb_Order where ord_Number = ('"+ord_number+"')" ;
		TbOrder tborder= null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while (rset.next()) {
				tborder = new TbOrder(rset.getInt("ord_Number"),
						rset.getString("vip_Phone"),
						rset.getInt("pro_Number"),
						rset.getInt("cou_Number"),
						rset.getInt("ser_ServiceID"),
						rset.getString("ord_Date"),
						rset.getString("ord_ReDate"),
						rset.getInt("ord_State"),
						rset.getFloat("ord_Price"),
						rset.getInt("ord_Shouldequity"),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
						rset.getInt("ord_Member")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		return tborder;
	}
	public static float getprice(int selectproduct){
		float price = 0;
		String sql = "select cou_Price from tb_course where pro_Number = ('"+selectproduct+"')";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			
			while (rset.next()) {
				price = rset.getFloat("cou_Price");
						
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		System.out.println(price);
		return price;
	}
	
	public static int getequity(String redate){
		int equity = 1;
		String date = null;
		String sql = "select holidayDate from tb_holiday where holidayDate = ('"+redate+"')";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			
			while (rset.next()) {
				date = rset.getString("holidayDate");
						
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		System.out.println("day "+redate+"--"+"holiday "+date);
		if(redate.equals(date))
			equity=2;
		System.out.println(equity);
	
		return equity;
	}
	
	public static <Stirng> boolean getresidualequity(Stirng phonenumber,int selectproduct,int shouldequity){
		boolean result = false;
		int residualequity=0;
		
		String sql = "select view_vip_Residualequity from view_vip02 where view_cus_Phone= ('"
		+phonenumber+"') and view_pro_Number=('"+selectproduct+"')";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			
			while (rset.next()) {
				residualequity = rset.getInt("view_vip_Residualequity");
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		System.out.println("should "+shouldequity+" "+"have "+residualequity);
		if(residualequity>=shouldequity)
		{
			result = true;
			return result;
		}
		else
		return result;
	}
	
	public boolean addOrder(TbOrder newTbOrder){
		boolean result = false;
		//如果添加项已经存在的情况
		String sql = "insert into tb_order(vip_Phone,pro_Number,cou_Number,ser_ServiceID,ord_Date,"
				+ "ord_ReDate,ord_State,ord_Price,ord_Shouldequity,ord_Member)values('"
				+newTbOrder.getVip_Phone()+"','"
				+newTbOrder.getPro_Number()+"','"
				+newTbOrder.getCou_Number()+"','"
				+newTbOrder.getSer_ServiceID()+"','"
				+newTbOrder.getOrd_Date()+"','"
				+newTbOrder.getOrd_ReDate()+"','"
				+newTbOrder.getOrd_State()+"','"
				+newTbOrder.getOrd_Price()+"','"
				+newTbOrder.getOrd_Shouldequity()+"','"
				+newTbOrder.getOrd_Member()
				+"')";
		
		if (DBBean.update(sql)) {
			System.out.println("DBupdate");
			result = true; //
		}
		
		return result;
	}
	public int getorderid() {
		int orderid = 0;
		String sql = "SELECT (Auto_increment-1) as id FROM information_schema.tables  WHERE table_name='tb_order' LIMIT 1";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			
			while (rset.next()) {
				orderid = rset.getInt("id");
						
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		return orderid;
	}
	public static boolean getresidualequity(int member, String phonenumber,
			int selectproduct, int shouldequity) {
		// TODO Auto-generated method stub
		return false;
	}
	
	//=================================
	public static int cheakState(int ord_number)
	{
		int state =-1;
		String sql = "SELECT ord_State FROM tb_order WHERE ord_Number =('"+ord_number+"')";
		Connection conn =null;
		Statement stmt = null;
		ResultSet rset = null;
		try 
		{
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next())
			{
				state = rset.getInt("ord_State");
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBBean.clean(conn, stmt, rset);
		}
		return state;
	}
	public static int getvip_Residualequity( String cus_phone,int pro_number)
	{
		int vip_Residualequity =0;
		String sql = "SELECT vip_Residualequity FROM tb_vip WHERE cus_phone =('"+cus_phone+"') and pro_number =('"+ pro_number + "')";
		Connection conn =null;
		Statement stmt = null;
		ResultSet rset = null;
		try 
		{
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next())
			{
				vip_Residualequity = rset.getInt("vip_Residualequity");
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBBean.clean(conn, stmt, rset);
		}
		return vip_Residualequity;
	}
	public static String getcus_Phone( int ord_number)
	{
		String cus_phone =null;
		String sql = "SELECT vip_Phone FROM tb_order WHERE ord_Number =('"+ord_number+"')";
		Connection conn =null;
		Statement stmt = null;
		ResultSet rset = null;
		try 
		{
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next())
			{
				cus_phone = rset.getString("vip_Phone");
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBBean.clean(conn, stmt, rset);
		}
		return cus_phone;
	}
	public static boolean subEquity( int ord_number,int pro_number,int shouldequity)
	{
		
		boolean result = false;
		int vip_Residualequity =0;
		String cus_phone = null;
		if(cheakState(ord_number)!=0)
		{
			result = false;
		}else{
			cus_phone = getcus_Phone(ord_number);
			vip_Residualequity = getvip_Residualequity(cus_phone,pro_number);
			vip_Residualequity = vip_Residualequity - shouldequity;
			if(vip_Residualequity>=0)
			{
				System.out.println(ord_number + "\n" + cus_phone+ "\n" +pro_number +"\n" +vip_Residualequity);
				String sql = "UPDATE tb_vip"+ " "
							+"SET"+ " "
							+"vip_Residualequity = ('"+vip_Residualequity+"')" +" "
							+"WHERE"+ " "
							+"cus_Phone =('"+cus_phone+"')"+ " "
							+"AND"+ " "
							+"pro_Number = ('" +pro_number+ "');" +" "
							+"UPDATE tb_order"+ " "
							+"SET"+" "
							+"ord_State = 1"+ " "
							+"where" + " "
							+"ord_Number = ('"+ord_number+"')";
				System.out.println(sql);
				if(DBBean.update(sql))
				{
					System.out.println("DBupdate");
					result = true;
				}
			}else{
				String sql1="UPDATE tb_order set ord_State = -1 where ord_Number = ('"+ord_number+"')";
				System.out.println(sql1);
				if(DBBean.update(sql1))
				{
					System.out.println("DBupdate,Failure order");
				}
			}
		}
		return result;
	}

	public static TbOrder getTbOrder(int cou_Number){
		String sql = "select * from tb_order where  cou_Number =('"+ cou_Number +"')";
		TbOrder tborder= null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			
			while (rset.next()) {
				tborder = new TbOrder(rset.getInt("cou_Number"),
						rset.getString("vip_Phone"),
						rset.getInt("pro_Number"),
						rset.getInt("cou_Number"),
						rset.getInt("ser_ServiceID"),
						rset.getString("ord_Date"),
						rset.getString("ord_ReDate"),
						rset.getInt("ord_State"),
						rset.getInt("ord_Price"),
						rset.getInt("ord_Shouldequity"),
						rset.getInt("ord_Member"),
						rset.getInt("ord_Pay")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		
		
		return tborder;
		
	}
	public boolean jiesuanTbo(String counumber) {
		// TODO Auto-generated method stub
		boolean result = false;
		String sql = "update tb_order set ord_Pay = 1 where cou_Number=('"
				+counumber
				+ "') and ord_State = 1";
		result = DBBean.update(sql);
		System.out.println("结算场地订单成功"+sql);


		return result;
	}
		
	

}
