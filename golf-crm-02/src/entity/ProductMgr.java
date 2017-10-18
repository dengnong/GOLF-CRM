package entity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;

public class ProductMgr {
	private ArrayList<Product> productList;
	
	public ProductMgr(){
		super();
		productList = new ArrayList<Product>();
	}

	public ArrayList<Product> getProductList(){
		productList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		Product product = null;
		
		try {
			conn = DBBean.getConnection();
			String sql = "select * from tb_product";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				product = new Product(rset.getInt("pro_Number"),
						rset.getString("pro_Name"),
						rset.getInt("pro_Validitydate"),
						rset.getString("pro_Price"),
						rset.getInt("pro_Equity"),
						rset.getInt("pro_Weekdays_times"),
						rset.getInt("pro_Holiday_times"),
						rset.getInt("pro_Enabled"));
				
				productList.add(product);
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
		
				return productList;
	}
	
	public static Product getProduct(int pro_Number){
		String sql = "select * from tb_product where pro_Number=('" + pro_Number
				+ "')";
		Product product = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			while (rset.next()) {
				product = new Product(rset.getInt("pro_Number"),
						rset.getString("pro_Name"),
						rset.getInt("pro_Validitydate"),
						rset.getString("pro_Price"),
						rset.getInt("pro_Equity"),
						rset.getInt("pro_Weekdays_times"),
						rset.getInt("pro_Holiday_times"),
						rset.getInt("pro_Enabled"));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		
		
		return product;
		
	}
	
	public boolean addProduct(Product newProduct){
		boolean result = false;
		//如果添加项已经存在的情况
		if(findProduct(newProduct)){
			result = false;
		}else{
		String sql = "insert into tb_product(pro_Number,pro_Name,pro_Validitydate,pro_Price,"
				+ "pro_Equity,pro_Weekdays_times,pro_Holiday_times,pro_Enabled)values('"
				+newProduct.getPro_Number()+"','"
				+newProduct.getPro_Name()+"','"
				+newProduct.getPro_Validitydate()+"','"
				+newProduct.getPro_Price()+"','"
				+newProduct.getPro_Equity()+"','"
				+newProduct.getPro_Weekdays_times()+"','"
				+newProduct.getPro_Holiday_times()+"','"
				+newProduct.getPro_Enabled()
				
				+"')";
		
		if (DBBean.update(sql)) {
			System.out.println("DBupdate");
			result = true; //
		}
		}
		return result;
	}
	
	public boolean findProduct(Product product) {
		// TODO Auto-generated method stub
		System.out.println("come find product");
		boolean result = false;
		String sql = "select * from tb_product where pro_Number=('"
				+product.getPro_Number() + "')";
		System.out.println("find product:"+sql);
		result = DBBean.hasRecord(sql);
		System.out.println(result);
		return result;
	}
	
	public boolean deleteProduct(int productnumber) {
		// TODO Auto-generated method stub
		boolean result = false;
		String sql = "update tb_product set pro_Enabled = 0 where pro_Number=('"
				+productnumber
				+ "')";
		result = DBBean.update(sql);
		System.out.println("hidden product:"+sql);
		
		return result;
	}
	
	public boolean editProduct(int number,String price ){
		
		System.out.println("come edit product");
		boolean result = false;
		String sql = "update tb_product set pro_Price=('"+price+"') where pro_Number=('"+number+"')";
		System.out.println("edit product:"+sql);
		result = DBBean.update(sql);
		System.out.println(result);
		return result;
	}
	
	
	
	
}
