package businesscenter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;
import businesscenter.Fax;
public class FaxMgr {
	private  ArrayList<Fax> faxList;

	public FaxMgr() {
		// TODO Auto-generated constructor stub
		super();
		faxList = new ArrayList<Fax>();
		
	}
	public ArrayList<Fax> getArrayList()
	{
		faxList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		Fax fax = null;
		try 
		{
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from tb_fax";
			rset = stmt.executeQuery(sql);
			while (rset.next())
			{
				fax = new Fax(
						rset.getInt("ord_Number"),
						rset.getString("cus_Phone"),
						rset.getInt("cou_Number"),
						rset.getInt("ser_ServiceID"),
						rset.getString("ord_ReDate"),
						rset.getFloat("ord_Price")
						);
				faxList.add(fax);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally 
		{
			try{
				rset.close();
				stmt.close();
				conn.close();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return faxList;
	}
	public static Fax getFax(int ord_Number)
	{
		String sql = "select * from tb_fax where ord_Number =('"
				+ ord_Number
				+ "')";
		Fax fax = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try
		{
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
		while(rset.next())
		{
			fax = new Fax(
					rset.getInt("ord_Number"),
					rset.getString("cus_Phone"),
					rset.getInt("cou_Number"),
					rset.getInt("ser_ServiceID"),
					rset.getString("ord_ReDate"),
					rset.getFloat("ord_Price")
					);
		}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBBean.clean(conn, stmt, rset);
		}
		return fax;
		
	}
	public static Fax getFaxfromOrder(int ord_Number)
	{
		String sql = "select * from tb_order where ord_Number =('"
				+ ord_Number
				+ "')";
		Fax fax = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try
		{
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
		while(rset.next())
		{
			fax = new Fax(
					rset.getInt("ord_Number"),
					rset.getString("vip_Phone"),
					rset.getInt("cou_Number"),
					rset.getInt("ser_ServiceID"),
					rset.getString("ord_ReDate"),
					rset.getFloat("ord_Price")
					);
			System.out.println("cou_Number: "+ fax.getCou_Number() +"\n"
					+ "cus_Phone: " +fax.getCus_Phone() + "\n"
					+"ser.ServiceId: " + fax.getSer_ServiceID()+"\n"
					+"ord_redate: " +fax.getOrd_ReDate()+"\n"
					+"ord_Price: " + fax.getOrd_Price()+"\n");
		}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBBean.clean(conn, stmt, rset);
		}
		return fax;
		
	}
	public static boolean findFax(Fax newfax)
	{
		boolean result = false;
		String sql ="select * from tb_fax where ord_Number = ('"
				+newfax.getOrd_Number() + "')";
		System.out.println("find fax:" +sql);
		result = DBBean.hasRecord(sql);
		return result;
	}
	public static boolean addFax(Fax newfax)
	{
		boolean result = false;
		if (findFax(newfax))
		{
			result = false;
		}else{
			System.out.print("come in addFax");
			String sql = "insert into tb_fax(ord_Number,cus_Phone,cou_Number,ser_ServiceID,ord_ReDate,ord_Price)"
					+"values('"
					+newfax.getOrd_Number()+"','"
					+newfax.getCus_Phone()+"','"
					+newfax.getCou_Number()+"','"
					+newfax.getSer_ServiceID()+"','"
					+newfax.getOrd_ReDate()+"','"
					+newfax.getOrd_Price()+"')";
			System.out.print(sql);
			if(DBBean.update(sql))
			{
				System.out.println("DBupdate");
				result = true;
			}
		}
		return result;
	}
	
 
}
