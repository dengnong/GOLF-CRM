package servlet;
import callcenter.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public OrderServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request,response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request,response);
		System.out.println("come OrderServlet");
		
		response.setHeader("content-type", "text/html;charset=UTF-8");  
		response.setCharacterEncoding("UTF-8");  
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html");
		String operation = request.getParameter("operation");
		
		System.out.println("operation:"+operation);
		
		if(operation.equals("selectservice")){
			TborderMgr tborderMgr = new TborderMgr();
			String phonenumber = request.getParameter("phonenumber");
			int selectproduct = Integer.parseInt(request.getParameter("mli"));
			int selectcourse = Integer.parseInt(request.getParameter("list1"));
			int selectservice = Integer.parseInt(request.getParameter("list2"));
			
			//添加成员列表
			String[] usernames = request.getParameterValues("username"); 
	        String[] passwords = request.getParameterValues("password");
	        
			//得到long类型当前时间
			long l = System.currentTimeMillis();
			//new日期对象
			Date date = new Date(l);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String buildtime = dateFormat.format(date);//订单生成日期
			String redate = request.getParameter("redate");//选择到场日期
			int state = 0;//订单结算状态
			//总共人数
			int member = 1;
			float price = TborderMgr.getprice(selectproduct); //从数据库中找到场地的价格
			int shouldequity = TborderMgr.getequity(redate);//从数据库中找到与日期比较后的应扣权益
			//检查会员现在的权益够不够扣
			boolean nowequity;
			
			if((usernames!=null&&passwords!=null)&&(usernames[0]!=""&&passwords[0]!="")){
				member = usernames.length+1;
				price = member*price;
				shouldequity=member*shouldequity;
		        for(int i = 0;i<usernames.length;i++){
		        	System.out.println(usernames[i]);
		        }
		        for(int i = 0;i<passwords.length;i++){
		        	System.out.println(passwords[i]);
		        }
		        nowequity = TborderMgr.getresidualequity(phonenumber,selectproduct,shouldequity);
			
				if(nowequity){
					TbOrder tborder = new TbOrder(1,phonenumber,selectproduct,selectcourse,selectservice,
							buildtime,redate,state,price,shouldequity,member);
					
					if(tborderMgr.addOrder(tborder))
					{
						int orderid = tborderMgr.getorderid();//获取订单id
						for(int j=0;j<passwords.length;j++){
						if(MemberMgr.addMember(orderid,usernames[j],passwords[j])){
							System.out.println("addmember success");
						}
						}
						System.out.println("电话  "+phonenumber+"|卡 "+ selectproduct +"|场地 "+selectcourse+"|服务 "+selectservice+"|订单时间 "+
								buildtime+"|结算状态 "+state+"|到场时间 "+redate+"|价格 "+price+"|成员 "+member+"|余额 "+
								nowequity+"|应扣权益 "+shouldequity);
						System.out.println("build a order sucess!the order number is "+orderid);
						
						request.setAttribute("orderid",orderid);
						request.getRequestDispatcher("../GOLF/Callcenterpage/buildorder.jsp").forward(request, response);
					
					}else
					{
						System.out.println("false build order");
					}
				}else{
					System.out.println("剩余权益不够");
					PrintWriter out = response.getWriter();
					out.println("<script> alert('会员权益不足，生成订单!');</script>");
				}
	        }else{
	        	nowequity = TborderMgr.getresidualequity(phonenumber,selectproduct,shouldequity);
	        	if(nowequity){
					TbOrder tborder = new TbOrder(1,phonenumber,selectproduct,selectcourse,selectservice,
							buildtime,redate,state,price,shouldequity,member);
					
					if(tborderMgr.addOrder(tborder))
					{
						int orderid = tborderMgr.getorderid();
						System.out.println("build a order sucess!the order number is "+orderid);
						request.setAttribute("orderid",orderid);
						request.getRequestDispatcher("../GOLF/Callcenterpage/buildorder.jsp").forward(request, response);
						
					}else
					{
						System.out.println("false build order");
					}
	        	
	        	}else{
	        		System.out.println("剩余权益不够");
	        		PrintWriter out = response.getWriter();
					out.println("<script> alert('会员权益不足，生成订单!');</script>");
	        	}
	        }
			
		}
		
	}

	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) {
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
