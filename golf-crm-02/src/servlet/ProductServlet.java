package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Cou_ser;
import entity.Cou_serMgr;
import entity.Pro_cou;
import entity.Pro_couMgr;
import entity.Product;
import entity.ProductMgr;

public class ProductServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProductServlet() {
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

	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("come ProductServlet");	
		
		response.setHeader("content-type", "text/html;charset=UTF-8");  
		response.setCharacterEncoding("UTF-8");  
		request.setCharacterEncoding("UTF-8");  
		
		response.setContentType("text/html");
		String operation = request.getParameter("operation");
		String del_edit_productnumber = request.getParameter("productnumber");////
		
		System.out.println("operation:"+operation);
		ProductMgr productMgr = new ProductMgr();
		Pro_couMgr pro_couMgr = new Pro_couMgr();
		Cou_serMgr cou_serMgr = new Cou_serMgr();
		
		if(operation.equals("addproduct")){
			int productnumber = Integer.parseInt(request.getParameter("productnumber"));
			String productname = request.getParameter("productname");
			int productvaliditydate = Integer.parseInt(request.getParameter("productvaliditydate"));
			int productequity = Integer.parseInt(request.getParameter("productequity"));
			int productweekday = Integer.parseInt(request.getParameter("productweekday"));
			int productholiday = Integer.parseInt(request.getParameter("productholiday"));
			String productprice = request.getParameter("productprice");
			int productenabled = 1;
			
			System.out.println(productnumber+" "+productname+" "+productvaliditydate+" "
					+productequity+" "+productweekday+" "+productholiday+" "+productprice);
			
			Product product = new Product(productnumber,productname,productvaliditydate,productprice,productequity,
					productweekday,productholiday,productenabled);
			
			if(productMgr.findProduct(product)){
				request.getRequestDispatcher("../GOLF/Template/adderror.jsp").forward(request, response);
				System.out.println("failedaddcustomer exist?");
				
			}else if(productMgr.addProduct(product)){
				
				request.setAttribute("productnumber",productnumber);//
				request.getRequestDispatcher("../GOLF/Template/addCourse.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("../errorPage.jsp").forward(request, response);
				System.out.println("failedaddproduct");
				}
			}
			
		if(operation.equals("addcourse")){
				//productnumber
			int productnumber_cou = Integer.parseInt(request.getParameter("productnumber"));
			int coursenumber = Integer.parseInt(request.getParameter("coursenumber"));
			String coursename = request.getParameter("coursename");
			String coursecountry = request.getParameter("coursecountry");
			String courseprovince = request.getParameter("courseprovince");
			String coursecity = request.getParameter("coursecity");
			String courseprice = request.getParameter("courseprice");
				
			System.out.println(productnumber_cou+" "+coursenumber+" "+coursename+" "
					+coursecountry+" "+courseprovince+" "+coursecity+" "+courseprice);
				
			Pro_cou pro_cou = new Pro_cou(productnumber_cou,coursenumber,coursename,coursecountry,courseprovince,
					coursecity,courseprice);
				
			if(pro_couMgr.findCourse(pro_cou)){
				request.getRequestDispatcher("../GOLF/Template/adderror.jsp").forward(request, response);
				System.out.println("failedaddcourse exist?");
				
			}else if(pro_couMgr.addCourse(pro_cou)){
				request.setAttribute("coursenumber",coursenumber);
				request.getRequestDispatcher("../GOLF/Template/addService.jsp").forward(request, response);
			}
			else{
				request.getRequestDispatcher("../errorPage.jsp").forward(request, response);
				System.out.println("failedaddcourse");
			}
		}
		
		if(operation.equals("addservice")){
			//productnumber
			int coursenumber_ser = Integer.parseInt(request.getParameter("coursenumber"));
			int serviceid = Integer.parseInt(request.getParameter("serviceid"));
			String servicegreen = request.getParameter("servicegreen");
			int servicecaddie= Integer.parseInt(request.getParameter("servicecaddie"));
			int servicegolfcar = Integer.parseInt(request.getParameter("servicegolfcar"));
			String servicecatering = request.getParameter("servicecatering");
			int servicewardrobe = Integer.parseInt(request.getParameter("servicewardrobe"));
			String servicelounge = request.getParameter("servicelounge");
			
			System.out.println(coursenumber_ser+" "+serviceid+" "+servicegreen+" "
					+servicecaddie+" "+servicegolfcar+" "+servicecatering+" "+servicewardrobe
					+" "+servicelounge);
				
			Cou_ser cou_ser = new Cou_ser(coursenumber_ser,+serviceid,servicegreen,
					servicecaddie,servicegolfcar,servicecatering,servicewardrobe,
					servicelounge);
			
			if(cou_serMgr.findService(cou_ser)){
				request.getRequestDispatcher("../GOLF/Template/adderror.jsp").forward(request, response);
				System.out.println("failedaddservice exist?");
			
			}else if(cou_serMgr.addService(cou_ser)){
		
				request.getRequestDispatcher("../GOLF/Template/productinfo.jsp").forward(request, response);
			}
			else{
				request.getRequestDispatcher("../errorPage.jsp").forward(request, response);
				System.out.println("failedaddservice");
				}
					
			}
			
			if(operation.equals("serch")){
				String serchProduct = request.getParameter("serchproductinfo");
				System.out.println("getserchinput:"+serchProduct);//null
				request.setAttribute("serchProduct",serchProduct);
				request.getRequestDispatcher("../GOLF/Template/serchProduct.jsp").forward(request, response);
			}
			
			if(operation.equals("del")){//在产品信息页面上废弃这个产品，数据库中启用标志置为0
				int productnumber = Integer.parseInt(request.getParameter("productnumber"));
				if(productMgr.deleteProduct(productnumber)){
					request.getRequestDispatcher("../GOLF/Template/productinfo.jsp").forward(request, response);
					
				}
				else{
					PrintWriter out = response.getWriter();
					out.println("<script> alert('删除失败!');javascript:history.go(-1);</script>");
				}
			}
			
			if(operation.equals("editproduct")){
				int pronumber = Integer.parseInt(request.getParameter("pronumber"));
				String productprice = request.getParameter("productprice");
				
				System.out.println("editproduct: "+pronumber+" "+productprice);
				if(productMgr.editProduct(pronumber, productprice)){
					request.getRequestDispatcher("../GOLF/Template/productinfo.jsp").forward(request, response);
				}
				else{
					PrintWriter out = response.getWriter();
					out.println("<script> alert('编辑失败!');javascript:history.go(-1);</script>");
				}
				
			}
			
		}
		
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request,response);
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
