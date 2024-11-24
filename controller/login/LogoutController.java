package net.hb.controller.login;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.utils.CookieUtil;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.invalidate(); // 세션 삭제 --> [아이디][비밀번호][이름] 일괄 삭제
		
		CookieUtil.deleteCookie(response, "cookieMemberId"); // 쿠키 삭제 [아이디]
		CookieUtil.deleteCookie(response, "cookiePwd");		 // 쿠키 삭제 [비밀번호]
		CookieUtil.deleteCookie(response, "cookieName");	 // 쿠키 삭제 [이름]
		CookieUtil.deleteCookie(response, "cookieType");	 // 쿠키 삭제 [이름]
		
		response.sendRedirect("/main");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
