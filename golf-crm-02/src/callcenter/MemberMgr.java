package callcenter;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBBean;

public class MemberMgr {
	private static ArrayList<Member> memberList;
	public MemberMgr(){
		super();
		memberList=new ArrayList<Member>();
	}
	
	public static ArrayList<Member> getMemberList(){
        memberList.clear();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        Member member= null;

        try {
            conn = DBBean.getConnection();
            //String sql = "select * from tb_vip ";
            
            String sql = "select * from tb_member";
            System.out.println(sql);
            stmt = conn.createStatement();
            rset = stmt.executeQuery(sql);
            while (rset.next()) {
                member = new Member(rset.getInt("ord_Number"),
                		rset.getString("ord_Phone"),
                        rset.getString("ord_Name"),
                        rset.getInt("ord_Message"));
                memberList.add(member);
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

        return memberList;
    }
	
	 public static Member getMember(int ordnumber){
//       String sql = "select * from tb_vip where cus_Phone=('" + cus_Phone
//               + "')";
   	
   	String sql = "select ord_Number,ord_Name,ord_Phone from tb_member where ord_Number=('"+ordnumber+"')";
   	System.out.println(sql);
       Member member = null;
       Connection conn = null;
       Statement stmt = null;
       ResultSet rset = null;

       try {
           conn = DBBean.getConnection();
           stmt = conn.createStatement();
           rset = stmt.executeQuery(sql);
           int i = 0;
           while (rset.next()) {
               member = new Member(rset.getInt("ord_Number"),
               		rset.getString("ord_Phone"),
                       rset.getString("ord_Name"));
                       
           }
       } catch (SQLException e) {
           e.printStackTrace();

       } finally {
           DBBean.clean(conn, stmt, rset);
       }


       return member;

   }
	
	public static boolean addMember(int a,String b,String c){
		boolean result = false;
		//如果添加项已经存在的情况
		String sql = "insert into tb_member(ord_Number,ord_Name,ord_Phone)values('"+a+"','"+b+"','"+c+"')";
				
		
		if (DBBean.update(sql)) {
			System.out.println("DBupdate");
			result = true; //
		}
		
		return result;
	}
}
	
	
	
