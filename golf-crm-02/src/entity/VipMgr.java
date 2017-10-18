package entity;

import db.DBBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class VipMgr {
    private ArrayList<Vip> vipList ;

    public  VipMgr(){
        super();
        vipList = new ArrayList<Vip>();

    }

    public ArrayList<Vip> getVipList(){
        vipList.clear();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

      Vip vip= null;

        try {
            conn = DBBean.getConnection();
            //String sql = "select * from tb_vip ";
            
            String sql = "select* "
            		+ "from tb_vip,tb_customerinfo,tb_product "
            		+ "where tb_vip.cus_Phone=tb_customerinfo.cus_Phone and tb_product.pro_Number=tb_vip.pro_Number";
            stmt = conn.createStatement();
            rset = stmt.executeQuery(sql);
            while (rset.next()) {
                vip = new Vip(rset.getString("cus_Name"),
                		rset.getString("cus_Phone"),
                        rset.getInt("pro_Number"),
                        rset.getString("vip_Activationdate"),
                        rset.getString("vip_Expirydate"),
                        rset.getInt("vip_Residualequity"),
                        rset.getInt("vip_Valid"),
                        rset.getInt("vip_Enabled"));

                vipList.add(vip);
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

        return vipList;
    }


    public static Vip getVip(String cus_Phone ){
//        String sql = "select * from tb_vip where cus_Phone=('" + cus_Phone
//                + "')";
    	
    	String sql = "select* "
        		+ "from tb_vip,tb_customerinfo,tb_product "
        		+ "where tb_vip.cus_Phone=tb_customerinfo.cus_Phone "
        		+ "and tb_product.pro_Number=tb_vip.pro_Number "
        		+ "and tb_vip.cus_Phone=('" + cus_Phone
                + "')";
        Vip vip = null;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        try {
            conn = DBBean.getConnection();
            stmt = conn.createStatement();
            rset = stmt.executeQuery(sql);
            int i = 0;
            while (rset.next()) {
                vip = new Vip(rset.getString("cus_Name"),
                		rset.getString("cus_Phone"),
                        rset.getInt("pro_Number"),
                        rset.getString("vip_Activationdate"),
                        rset.getString("vip_Expirydate"),
                        rset.getInt("vip_Residualequity"),
                        rset.getInt("vip_Valid"),
                        rset.getInt("vip_Enabled"));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DBBean.clean(conn, stmt, rset);
        }


        return vip;

    }

    public static boolean findVip(Vip vip) {
        // TODO Auto-generated method stub
        boolean result = false;
        String sql = "select * from tb_vip where cus_Phone=('"
                +vip.getCus_Phone() + "') and pro_Number=('"+vip.getPro_Number()+"')";
        result = DBBean.hasRecord(sql);

        return result;
    }

    public boolean deleteVip(String vipphone, String pronumber) {
        // TODO Auto-generated method stub
        boolean result = false;
        String sql = "update tb_vip set vip_Enabled = 0 where cus_Phone=('"
                +vipphone
                + "') and pro_Number=('"+pronumber+"')";
        result = DBBean.update(sql);
        System.out.println("hidden vip:"+sql);

        return result;
    }
    public static boolean addVip(Vip vip) {
        // TODO Auto-generated method stub
    	boolean result = false;
    	
    	result=findVip(vip);
    	System.out.println("fine result "+result);
    	if(result==false){
	    	String sql = "insert into tb_vip(cus_Phone,pro_Number,vip_Activationdate,vip_Expirydate,"
					+ "vip_Residualequity,vip_Valid,vip_Enabled)values('"
					+vip.getCus_Phone()+"','"
					+vip.getPro_Number()+"','"
					+vip.getVip_Activationdate()+"','"
					+vip.getVip_Expirydate()+"','"
					+vip.getVip_Residualequity()+"','"
					+vip.getVip_Valid()+"','"
					+vip.getVip_Enabled()
					+"')";
	    	String sql2 = "update tb_customerinfo set cus_Status = 1 where cus_Phone=('"
	                +vip.getCus_Phone()
	                + "')";
			System.out.println(sql);
			if (DBBean.update(sql)) {
				System.out.println("DBupdate");
			
				result=DBBean.update(sql2); 
				System.out.println(sql2);
				System.out.println("DBupdate");
				return result;
			}
    	}else{
    	System.out.println("faliaddvip chongfu?");
    	result = false;
		
		}
    	return result;
			
    }
    
    public static boolean actPro(String phone,int card) {
        // TODO Auto-generated method stub
    	boolean result = false;
    	String sql = "update tb_vip set vip_Valid = 1,vip_Activationdate=NOW(), "
    			+"vip_Residualequity=(SELECT tb_product.pro_Equity FROM tb_product where tb_product.pro_Number = ('"+card+"')) "
    			+" where cus_Phone=('"
                +phone
                + "') and pro_Number=('"
                +card
                +"')";
    	
		System.out.println(sql);
		if (DBBean.update(sql)) {
			System.out.println("DBupdate");
			result = true; //
		}
		return result;
    }
    
   
    


}

