package servlet;

import callcenter.TborderMgr;
import callcenter.TbOrder;
import db.DBBean;

import javax.print.DocFlavor;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

public class TboServlet extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public TboServlet() {
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
        System.out.println("come TboServlet");

        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        response.setContentType("text/html");
        String operation = request.getParameter("operation");

        System.out.println("operation:"+operation);
        HttpSession session = request.getSession();

        if(operation.equals("serch")){
            String serchTbo = request.getParameter("serchtbo");
            System.out.println("getserchinput:"+serchTbo);//null
            request.setAttribute("serchTbo",serchTbo);
            request.getRequestDispatcher("../GOLF/Commercepage/serchTbo.jsp").forward(request, response);

        }

        if(operation.equals("del")){//删除操作
            TborderMgr tborderMgr = new TborderMgr();
            String counumber = request.getParameter("counumber");
            if(tborderMgr.jiesuanTbo(counumber)){
                request.getRequestDispatcher("../GOLF/Commercepage/Allorder.jsp").forward(request, response);

            }
            else{
                PrintWriter out = response.getWriter();
                out.println("<script> alert('结算失败!');</script>");
            }
        }






        }




    public boolean finTbo(TbOrder tborder) {
        // TODO Auto-generated method stub
        boolean result = false;
        String sql = "select * from tb_vip where cou_Number=('"
                +tborder.getCou_Number() + "')";
        result = DBBean.hasRecord(sql);

        return result;
    }






    public void init() throws ServletException {
        // Put your code here
    }

}
