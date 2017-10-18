package businesscenter;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.BitSet;

import db.DBBean;

public class BirthdayMgr {
	private  ArrayList<Birthday> birthdayList;

	public BirthdayMgr() {
		// TODO Auto-generated constructor stub
		super();
		birthdayList = new ArrayList<Birthday>();
		
	}
	public ArrayList<Birthday> getBirthdayList()
	{
		birthdayList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		Birthday birthday= null;
		try 
		{
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from view_vip_grade";
			rset = stmt.executeQuery(sql);
			while (rset.next())
			{
				birthday = new Birthday(
						rset.getString("cus_Name"),
						rset.getString("cus_Phone"),
						rset.getString("cus_Birthday"),
						rset.getString("cus_Address"),
						rset.getString("cus_Email"),
						rset.getString("cus_Interest"),
						rset.getInt("Grade")
						);
				birthdayList.add(birthday);
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
		return birthdayList;
	}
	
	
	public static Birthday getBirthday()
	{
		String sql = "select * from view_vip_grade";
		Birthday birthday= null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try
		{
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next())
			{
				birthday = new Birthday(
						rset.getString("cus_Name"),
						rset.getString("cus_Phone"),
						rset.getString("cus_Birthday"),
						rset.getString("cus_Address"),
						rset.getString("cus_Email"),
						rset.getString("cus_Interest"),
						rset.getInt("Grade")
						);
		}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBBean.clean(conn, stmt, rset);
		}
		return birthday;
		
	}
	
	

}
