package net.hb.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter({"/payment", "/course/cart", "/mypage/*"
	, "/mycourse" ,"/course/archive/*"
	, "/teacher/*/modify", "/course/lesson/view", "/*/regist"
	})
public class LoginCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginCheckFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		if(req.getSession().getAttribute("sessionMemberId") == null) {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter wrt = res.getWriter();
			
			wrt.print("<script>alert('로그인 후 이용할 수 있습니다.');location.href='/login';</script>");
			wrt.close();
			return;
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
