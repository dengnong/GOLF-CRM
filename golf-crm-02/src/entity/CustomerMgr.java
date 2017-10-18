package entity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;

public class CustomerMgr {
	private ArrayList<Customer> customerList ;
	
	public CustomerMgr(){
		super();
		customerList = new ArrayList<Customer>();
	
	}
	
	public ArrayList<Customer> getCustomerList(){
		customerList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		Customer customer = null;
		
		try {
			conn = DBBean.getConnection();
			String sql = "select * from tb_customerinfo";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				customer = new Customer(rset.getString("cus_Phone"),
						rset.getString("cus_Name"),
						rset.getString("cus_Sex"),
						rset.getInt("cus_Status"),
						rset.getString("cus_Birthday"),
						rset.getString("cus_Email"),
						rset.getString("cus_Address"),
						rset.getString("cus_Postcode"),
						rset.getString("cus_Nativeplace"),
						rset.getString("cus_City"),
						rset.getString("cus_Prouince"),
						rset.getString("cus_Nationallity"),
						rset.getString("cus_Position"),
						rset.getString("cus_Cardtype"),
						rset.getString("cus_Postnumber"),
						rset.getString("cus_interest"),
						rset.getInt("cus_Enabled"));
				
				customerList.add(customer);
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
		
				return customerList;
	}
	
	
	public static Customer getCustomer(String cus_Phone ){
		String sql = "select * from tb_customerinfo where cus_Phone=('" + cus_Phone
				+ "')";
		Customer customer = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			while (rset.next()) {
				customer = new Customer(rset.getString("cus_Phone"),
						rset.getString("cus_Name"),
						rset.getString("cus_Sex"),
						rset.getInt("cus_Status"),
						rset.getString("cus_Birthday"),
						rset.getString("cus_Email"),
						rset.getString("cus_Address"),
						rset.getString("cus_Postcode"),
						rset.getString("cus_Nativeplace"),
						rset.getString("cus_City"),
						rset.getString("cus_Prouince"),
						rset.getString("cus_Nationallity"),
						rset.getString("cus_Position"),
						rset.getString("cus_Cardtype"),
						rset.getString("cus_Postnumber"),
						rset.getString("cus_interest"),
						rset.getInt("cus_Enabled"));
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		
		
		return customer;
		
	}
	
	public boolean addCustomer(Customer newCustomer){
		boolean result = false;
		//如果添加项已经存在的情况
		if(findCustomer(newCustomer)){
			result = false;
		}else{
		String sql = "insert into tb_customerinfo(cus_Name,cus_Phone,cus_Sex,cus_Status,cus_Birthday,"
				+ "cus_Email,cus_Address,cus_Postcode,cus_Nativeplace,cus_City,"
				+ "cus_Prouince,cus_Nationallity,cus_Position,cus_Cardtype,"
				+ "cus_Postnumber,cus_interest,cus_Enabled)values('"
				+newCustomer.getCus_Name()+"','"
				+newCustomer.getCus_Phone()+"','"
				+newCustomer.getCus_Sex()+"','"
				+newCustomer.getCus_Status()+"','"
				+newCustomer.getCus_Birthday()+"','"
				+newCustomer.getCus_Email()+"','"
				+newCustomer.getCus_Address()+"','"
				+newCustomer.getCus_Postcode()+"','"
				+newCustomer.getCus_Nativeplace()+"','"
				+newCustomer.getCus_City()+"','"
				+newCustomer.getCus_Prouince()+"','"
				+newCustomer.getCus_Nationallity()+"','"
				+newCustomer.getCus_Position()+"','"
				+newCustomer.getCus_Cardtype()+"','"
				+newCustomer.getCus_Postnumber()+"','"
				+newCustomer.getCus_interest()+"','"
				+newCustomer.getCus_Enabled()
				+"')";
		
		if (DBBean.update(sql)) {
			System.out.println("DBupdate");
			result = true; //
		}
		}
		return result;
	}
	
	public boolean findCustomer(Customer customer) {
		// TODO Auto-generated method stub
		boolean result = false;
		String sql = "select * from tb_customerinfo where cus_Phone=('"
				+customer.getCus_Phone() + "')";
		System.out.println("find customer:"+sql);
		result = DBBean.hasRecord(sql);
		
		return result;
	}
	
	public boolean findexistphone(String phonenumber){
		boolean result = false;
		String sql = "select * from tb_customerinfo where cus_Phone=('"
				+phonenumber + "')";
		System.out.println("finding this customer:"+sql);
		result = DBBean.hasRecord(sql);
		return result;
	}
	
	public boolean deleteCustomer(String customerphone) {
		// TODO Auto-generated method stub
		boolean result = false;
		String sql = "update tb_customerinfo set cus_Enabled = 0 where cus_Phone=('"
				+customerphone
				+ "')";
		result = DBBean.update(sql);
		System.out.println("hidden customer:"+sql);
		
		String sql2 = "update tb_vip set vip_Enabled = 0 where cus_Phone=('"
				+customerphone
				+ "')";
		result = DBBean.update(sql2);
		System.out.println("hidden customer:"+sql2);
		
		return result;
	}

	public boolean editCustomer(String customername, String customerphone,
			String customerbirthday, String customeremail,
			String customeraddress, String customerpostcode,
			String customernationallity, String customerprouince,
			String customercity, String customernativeplace,
			String customerposition, String customercardtype,
			String customerpostnumber, String customerinterest) {

		boolean result=false;
		String sql = "update tb_customerinfo set cus_Name = ('"+customername+"'),cus_Birthday=('"+customerbirthday+"'),"
				+ "cus_Email=('"+customeremail+"'),cus_Address=('"+customeraddress+"'),cus_Postcode=('"+customerpostcode+"'),"
				+ "cus_Nativeplace=('"+customernativeplace+"'),cus_City=('"+customercity+"'),cus_Prouince=('"+customerprouince+"'),"
				+ "cus_Nationallity=('"+customernationallity+"'),cus_Position=('"+customerposition+"'),cus_Cardtype=('"+customercardtype+"'),"
				+ "cus_Postnumber=('"+customerpostnumber+"'),cus_interest=('"+customerinterest+"') "
				+ " where cus_Phone=('"
				+customerphone
				+ "')";
		
		result = DBBean.update(sql);
		System.out.println("edit customer :"+sql);
		
		
		return result;
	}
		
		
}

