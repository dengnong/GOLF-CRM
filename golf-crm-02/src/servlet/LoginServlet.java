package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.UserMgr;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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

	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		UserMgr usermgr = new UserMgr();
		
		int result = -1;
		result = UserMgr.verifyUser(username,password);
		String priv = "" + result;
		switch(result){
		case -1:
			response.sendRedirect("../index.jsp");
			//request.getRequestDispatcher("/index.jsp").forward(request, response);
			break;
			
		case 1://产品中心
			session.setAttribute("priv", priv);
			session.setAttribute("user", username);
			response.sendRedirect("../GOLF/ProductPage.jsp");
			//request.getRequestDispatcher("/GOLF/ProductPage.jsp").forward(request, response);
			break;
		case 2://呼叫中心
			session.setAttribute("priv", priv);
			session.setAttribute("user", username);
			response.sendRedirect("../GOLF/CallPage.jsp");
			//request.getRequestDispatcher("/GOLF/CallPage.jsp").forward(request, response);
			break;
			
		case 3://商务中心
			session.setAttribute("priv", priv);
			session.setAttribute("user", username);
			response.sendRedirect("../GOLF/BusinessPage.jsp");
			//request.getRequestDispatcher("/GOLF/BusinessPage.jsp").forward(request, response);
			break;
			
		case 4://业务中心
			session.setAttribute("priv", priv);
			session.setAttribute("user", username);
			response.sendRedirect("../GOLF/CommercePage.jsp");
			//request.getRequestDispatcher("/GOLF/CommercePage.jsp").forward(request, response);
			break;
			
		
		
		}
		
		
		
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
