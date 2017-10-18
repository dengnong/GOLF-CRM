package businesscenter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

import db.DBBean;
import callcenter.*;
public class MessageMgr {
	private ArrayList<Message> messageList;

	public MessageMgr() {
		super ();
		messageList = new ArrayList<Message>();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Message> getArrayList()
	{
		messageList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		Message message = null;
		try 
		{
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from tb_message";
			rset = stmt.executeQuery(sql);
			while (rset.next())
			{
				message = new Message(
						rset.getInt("ord_Number"),
						rset.getString("cus_Phone"),
						rset.getString("mes_Date")
						);
				messageList.add(message);
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
		return messageList;
	}
	public static Message getMessage(int ord_Number)
	{
		String sql = "select * from tb_message where ord_Number =('"
				+ ord_Number
				+ "')";
		Message message = null;
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
			message = new Message(
					rset.getInt("ord_Number"),
					rset.getString("cus_Phone"),
					rset.getString("mes_Date")
					);
		}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBBean.clean(conn, stmt, rset);
		}
		return message;
	}

	public static int getVipstate( int ord_number)
	{
		boolean result = false;
		int state = 0 ;
		String sql = "select cus_Phone from tb_message where ord_Number = ('" + ord_number + "')";
		System.out.println(sql);
		result = DBBean.hasRecord(sql);
		System.out.println(result);
		if(result == true )
		{
			state = 1;
		}
		System.out.println(state);
		return state;
	}
	public static boolean findmessage( String  cus_Phone,int ord_Number)
	{
		boolean result = false;
		String sql = "select * from tb_message where cus_Phone = ('"+ cus_Phone+"') and ord_Number = ('"+ord_Number+"')";
		result = DBBean.hasRecord(sql);
		return result;
	}
	public static boolean addvipMessage(TbOrder newtborder)
	{
		boolean result = false;
		int ord_Number = newtborder.getOrd_Number();
		String cus_Phone = newtborder.getVip_Phone();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date= new Date();
		String mes_Date = format.format(date);
		if(findmessage(cus_Phone,ord_Number))
		{
			result = false;
		}else
		{
			String sql = "insert into tb_message(ord_Number,cus_Phone,mes_Date)values('"
					+ord_Number+"','"
					+cus_Phone +"','"
					+mes_Date+"')";
			System.out.println(sql);
			if(DBBean.update(sql))
			{
				System.out.println("DBupdate,addvipmessage");
				result = true;
			}
		}
		return result;
	}
	public static boolean addcusMessage(int ord_Number)
	{
		boolean result = false;
		String cus_Phone = null;
		String sql = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date= new Date();
		String mes_Date = format.format(date);
		java.util.ArrayList<Member> memberList = new java.util.ArrayList<Member>();
		memberList = MemberMgr.getMemberList();
		for(Member member : memberList)
		{
			if(member.getOrd_Number()==ord_Number)
			{
				cus_Phone = member.getOrd_Phone();
				sql="insert into tb_message(ord_Number,cus_Phone,mes_Date)values('"
						+ ord_Number+ "','"
						+ cus_Phone + "','"
						+ mes_Date +"');" +" "
						+"UPDATE tb_member set ord_Message = 1 where ord_Number=('"+ord_Number+"')"
						+"and"+" "
						+"ord_Phone = ('"
						+cus_Phone+"')";
				if(DBBean.update(sql))
				{
					
					System.out.println("DBupdate,addcusMessage");
					result = true;
				}
			}
			
		}
		
		return result;
	}

}
