package net.hb.controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.dao.MemberDAO;
import net.hb.dto.MemberDTO;
import net.hb.utils.CookieUtil;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		if (req.getSession().getAttribute("sessionMemberId") != null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('이미 로그인 하셨습니다.');history.back();</script>");
			return;
		}

		req.getRequestDispatcher("/login/login.jsp").forward(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 로그인 폼 제출 시 여기로 들어오게 됨
		HttpSession session = req.getSession(); // 세션 사용

		if (session.getAttribute("sessionMemberId") != null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('이미 로그인 하셨습니다.');history.back();</script>");
			return;
		}

		// 아이디, 비밀번호의 파라미터를 받아와서 DB와 대조
		String inputId = req.getParameter("userId");
		String inputPwd = req.getParameter("password");
		String autoLogin = req.getParameter("loginSave") != null ? req.getParameter("loginSave") : ""; // 여기는 value를
																										// 기본값으로 지정하면
																										// "on"이 들어오고,
																										// 지정하면 바뀜. 나중에
																										// 바꿀거면 아래에
																										// "on"으로 되어있는
																										// 부분 전부 다 교체
		// [printWriter]
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8"); // 응답 콘텐츠 타입을 html로 지정
		PrintWriter out = res.getWriter();
		// 아이디 비밀번호 컨트롤러에서 널체크
		if (inputId == null || inputPwd == null) {
			out.append("<script>");
			out.append("alert('필수 정보를 입력하세요.');");
			out.append("history.back();");
			out.append("</script>");
			return;
		}
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.login(inputId, inputPwd);
		dao.close();

		if (dto == null || dto.getStatus().equals('Y')) {
			out.append("<script>");
			out.append("alert('아이디를 확인해주세요.');");
			out.append("history.back();");
			out.append("</script>");
			return;
		}

		session.setAttribute("sessionMemberId", dto.getMemberId()); // 세션에 아이디 저장
		session.setAttribute("sessionPwd", dto.getPwd()); // 세션에 비밀번호 저장
		session.setAttribute("sessionName", dto.getName()); // 세션에 이름도 저장
		session.setAttribute("sessionType", dto.getMemType()); // 세션에 이름도 저장
		// 세션에 저장해야할 정보는 추가될 수 있음
		if (autoLogin.equals("on")) { // 로그인 정보 저장을 체크했을 때 --> [세션][쿠키] 저장

			CookieUtil.makeCookie(res, "cookieMemberId", dto.getMemberId(), 86400); // 아이디 쿠키에 저장(하루)
			CookieUtil.makeCookie(res, "cookiePwd", dto.getPwd(), 86400); // 비밀번호 쿠키에 저장(하루)
			CookieUtil.makeCookie(res, "cookieName", dto.getName(), 86400);
			CookieUtil.makeCookie(res, "cookieType", dto.getMemType(), 86400);
			// 쿠키 저장 정보는 추가될 수 있음

		}

		res.sendRedirect("/main");

	}

}
