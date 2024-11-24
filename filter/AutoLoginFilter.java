package net.hb.filter;

import java.io.IOException;

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
import jakarta.servlet.http.HttpSession;
import net.hb.utils.CookieUtil;

@WebFilter("/*")
public class AutoLoginFilter extends HttpFilter implements Filter {


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// HttpServletRequest와 HttpServletResponse로 변환.
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        HttpSession session = httpRequest.getSession(); // 세션 가져오기
        
        String cookieMemberId = CookieUtil.readCookie(httpRequest, "cookieMemberId"); 
        String cookiePwd = CookieUtil.readCookie(httpRequest, "cookiePwd");
        String cookieName = CookieUtil.readCookie(httpRequest, "cookieName");
        String cookieType = CookieUtil.readCookie(httpRequest, "cookieType");
        
        if(cookieMemberId != null && cookiePwd != null) { // 쿠키가 있을 때 (여기만 살짝 수정-미경)
//        	System.out.println("자동로그인");
        	session.setAttribute("sessionMemberId", cookieMemberId); // 쿠키값 세션에 저장 [아이디]
        	session.setAttribute("sessionPwd", cookiePwd); 			 // 쿠키값 세션에 저장 [비밀번호]
        	session.setAttribute("sessionName", cookieName); 		 // 쿠키값 세션에 저장 [이름]
        	session.setAttribute("sessionType", cookieType); 		 // 쿠키값 세션에 저장 [이름]
        }
        chain.doFilter(request, response);
	}

}
