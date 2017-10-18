package filter;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  
  
public class LoginFilter implements Filter {  
       
    public void doFilter(ServletRequest request, ServletResponse response,  
            FilterChain chain) throws IOException, ServletException {  
        HttpServletRequest req = (HttpServletRequest) request;  
        HttpServletResponse resp = (HttpServletResponse) response;  
        String conString = "";  
        conString = req.getHeader("REFERER"); 
        if("".equals(conString) || null==conString){ 
            String servletPath = req.getServletPath(); 
            if(servletPath.contains("index.jsp")){ 
                chain.doFilter(request, response);  
            } else {  
                resp.sendRedirect("/golf-crm-02/index.jsp");
            }  
        } else {  
            chain.doFilter(request, response);  
        }  
    }  
    public void init(FilterConfig filterConfig)throws ServletException{  
          
    }
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}  
  
}  