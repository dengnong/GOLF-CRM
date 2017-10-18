package servlet;

import entity.VipMgr;
import entity.Vip;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

public class VipServlet extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public VipServlet() {
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


    private void processRequest(HttpServletRequest request,
                                HttpServletResponse response) throws ServletException, IOException {
        System.out.println("come VipServlet");

        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        response.setContentType("text/html");
        String operation = request.getParameter("operation");

        System.out.println("operation:"+operation);
        HttpSession session = request.getSession();

        if(operation.equals("serch")){
            String serchVip = request.getParameter("serchvip");
            System.out.println("getserchinput:"+serchVip);//null
            request.setAttribute("serchVip",serchVip);
            request.getRequestDispatcher("../GOLF/Template/serchVip.jsp").forward(request, response);

        }

        if(operation.equals("del")){
            VipMgr vipMgr = new VipMgr();
            String vipphone = request.getParameter("vipphone");
            String pronumber = request.getParameter("pronumber");
            if(vipMgr.deleteVip(vipphone,pronumber)){
                request.getRequestDispatcher("../GOLF/Template/VIPinfo.jsp").forward(request, response);

            }
            else{
                PrintWriter out = response.getWriter();
                out.println("<script> alert('删除失败!');</script>");
            }
        }
        if(operation.equals("addvip")){
        	String vipphone =request.getParameter("vipphone");
        	String customername =request.getParameter("customername");
			int  productnumber = Integer.parseInt(request.getParameter("productnumber"));
			String enddate = "000-00-00";
			String startdate = "000-00-00";
			Vip vip = new Vip(customername,vipphone,productnumber,startdate,enddate,0,0,1);
			System.out.println(vipphone+" "+customername+" "+productnumber);
			if(VipMgr.addVip(vip))
			{
				request.setAttribute("vipphone",vipphone);
				request.getRequestDispatcher("../GOLF/Template/VIPinfo.jsp").forward(request, response);
			}
			else{
				request.getRequestDispatcher("../GOLF/Template/vipalredyexist.jsp").forward(request, response);
				System.out.println("failedaddvip");
			}
			}
        if(operation.equals("addvip1")){
        	System.out.println("come in addvip1");
        	String vipphone =request.getParameter("vipphone");
        	String customername =request.getParameter("customername");
        	
			System.out.println(vipphone+" "+customername+" ");
			
			
			request.setAttribute("vipphone",vipphone);
			request.setAttribute("customername",customername);
			request.getRequestDispatcher("../GOLF/Template/addVip02.jsp").forward(request, response);
			
			
			}
        if(operation.equals("actproduct")){
        	String phone = request.getParameter("phone");
        	int card = Integer.parseInt(request.getParameter("card"));
        	System.out.println("come vipservlet "+phone+" "+card);
        	
        	if(VipMgr.actPro(phone,card)){
        		request.getRequestDispatcher("../GOLF/Callcenterpage/actinfo.jsp?phonenumber="+phone+"").forward(request, response);
        		
        	}
        }
        
        if(operation.equals("serchaddvip")){
        	String info = request.getParameter("serch");
        	System.out.println("getserchinput:"+info);//null
        	request.setAttribute("serchaddVip",info);
            request.getRequestDispatcher("../GOLF/Template/serchaddVip.jsp").forward(request, response);
        }
        

    }

    public void init() throws ServletException {
        // Put your code here
    }

}
