package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Cou_serMgr;
import entity.Customer;
import entity.CustomerMgr;

public class CustomerServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CustomerServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request,response);
	}

	
	@SuppressWarnings("unused")
	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("come CustomerServlet");
		
		response.setHeader("content-type", "text/html;charset=UTF-8");  
		response.setCharacterEncoding("UTF-8");  
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html");
		String operation = request.getParameter("operation");
		
		System.out.println("operation:"+operation);
		HttpSession session = request.getSession();
		
		if(operation.equals("serch")){
			String serchCustomer = request.getParameter("serchcustomerinfo");
			System.out.println("getserchinput:"+serchCustomer);//null
			request.setAttribute("serchCustomer",serchCustomer);
			request.getRequestDispatcher("../GOLF/Template/serchCustomer.jsp").forward(request, response);
		
		}
		
		if(operation.equals("del")){//删除操作
			CustomerMgr customerMgr = new CustomerMgr();
			String customerphone = request.getParameter("customerphone");
			if(customerMgr.deleteCustomer(customerphone)){
				request.getRequestDispatcher("../GOLF/Template/customerinfo.jsp").forward(request, response);
				
			}
			else{
				PrintWriter out = response.getWriter();
				out.println("<script> alert('删除失败!');javascript:history.go(-1);</script>");
			}
		}
		
		if(operation.equals("addcustomer")){//增加操作
			CustomerMgr customerMgr = new CustomerMgr();
			String customername = request.getParameter("customername");
			String customerphone = request.getParameter("customerphone");
			String customersex = request.getParameter("radio");
			int customerstatus = 0;
			String customerbirthday = request.getParameter("customerbirthday");
			String customeremail = request.getParameter("customeremail");
			String customeraddress = request.getParameter("customeraddress");
			String customerpostcode = request.getParameter("customerpostcode");
			String customernationallity = request.getParameter("customernationallity");
			String customerprouince = request.getParameter("customerprouince");
			String customercity = request.getParameter("customercity");
			String customernativeplace = request.getParameter("customernativeplace");
			String customerposition = request.getParameter("customerposition");
			String customercardtype = request.getParameter("customercardtype");
			String customerpostnumber = request.getParameter("customerpostnumber");
			String customerinterest = request.getParameter("customerinterest");
			int customerenabled = 1;
			
			System.out.println(customername+" "+customerphone+" "+customersex+" "+customerstatus+" "+customerbirthday+" "+
					customeremail+" "+customeraddress+" "+customerpostcode+" "+customernationallity+" "+
					customerprouince+" "+customercity+" "+customernativeplace+" "+customerposition+" "+
					customercardtype+" "+customerpostnumber+" "+customerinterest);
			Customer customer = new Customer(customerphone,customername,customersex,customerstatus,customerbirthday,
					customeremail,customeraddress,customerpostcode,customernationallity,
					customerprouince,customercity,customernativeplace,customerposition,
					customercardtype,customerpostnumber,customerinterest,customerenabled);
			if(customerMgr.addCustomer(customer)){
				
				request.getRequestDispatcher("../GOLF/Template/customerinfo.jsp").forward(request, response);
			}
			else if(customerMgr.findCustomer(customer)){
				request.getRequestDispatcher("../GOLF/Template/adderror.jsp").forward(request, response);
				System.out.println("failedaddcustomer exist?");
				}
			else {
				
				System.out.println("failedaddcustomer");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('编辑失败，用户存在或键入不合法!');javascript:history.go(-1);</script>");
			}
			}
		
		if(operation.equals("phonecall")){
			CustomerMgr customerMgr = new CustomerMgr();
			String phonenumber = request.getParameter("phonenumber");
			System.out.println("in-coming call: "+ phonenumber);
			if(customerMgr.findexistphone(phonenumber)){
				System.out.println("this customer already existed");
				request.setAttribute("phonenumber",phonenumber);
				request.getRequestDispatcher("../GOLF/Callcenterpage/callinfo.jsp").forward(request, response);
			}
			else
			{
				System.out.println("this customer not exist");
				request.setAttribute("phonenumber",phonenumber);
				request.getRequestDispatcher("../GOLF/Template/addCustomer02.jsp").forward(request, response);
			}
			
		}
		
		if(operation.equals("editcustomer")){//增加操作
			CustomerMgr customerMgr = new CustomerMgr();
			String customername = request.getParameter("customername");
			String customerphone = request.getParameter("customerphone");
			String customerbirthday = request.getParameter("customerbirthday");
			String customeremail = request.getParameter("customeremail");
			String customeraddress = request.getParameter("customeraddress");
			String customerpostcode = request.getParameter("customerpostcode");
			String customernationallity = request.getParameter("customernationallity");
			String customerprouince = request.getParameter("customerprouince");
			String customercity = request.getParameter("customercity");
			String customernativeplace = request.getParameter("customernativeplace");
			String customerposition = request.getParameter("customerposition");
			String customercardtype = request.getParameter("customercardtype");
			String customerpostnumber = request.getParameter("customerpostnumber");
			String customerinterest = request.getParameter("customerinterest");
			
			System.out.println(customername+" "+customerphone+" "+customerbirthday+" "+
					customeremail+" "+customeraddress+" "+customerpostcode+" "+customernationallity+" "+
					customerprouince+" "+customercity+" "+customernativeplace+" "+customerposition+" "+
					customercardtype+" "+customerpostnumber+" "+customerinterest);
			
			
			
			if(customerMgr.editCustomer(customername,customerphone,customerbirthday,customeremail,
					customeraddress,customerpostcode,customernationallity,customerprouince,
					customercity,customernativeplace,customerposition,
					customercardtype,customerpostnumber,customerinterest)){
				
				request.getRequestDispatcher("../GOLF/Template/customerinfo.jsp").forward(request, response);
			}
			else{
				System.out.println("failededitcustomer");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('编辑失败!');javascript:history.go(-1);</script>");
				}
			}
		
		
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
