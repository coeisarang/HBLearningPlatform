package net.hb.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.dao.MemberDAO;
import net.hb.utils.CookieUtil;

@WebServlet("/mypage/delete")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("sessionMemberId");
		
		MemberDAO dao = new MemberDAO();
		int result = dao.delete(memberId);
		dao.close();
		
		// [printWriter]
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8"); //응답 콘텐츠 타입을 html로 지정
        PrintWriter out = res.getWriter();
        
		if(result > 0) { // 탈퇴 성공 (UPDATE 성공)
			session.invalidate(); // 세션 삭제 --> [아이디][비밀번호][이름] 일괄 삭제
			
			CookieUtil.deleteCookie(res, "cookieMemberId"); // 쿠키 삭제 [아이디]
			CookieUtil.deleteCookie(res, "cookiePwd");		 // 쿠키 삭제 [비밀번호]
			CookieUtil.deleteCookie(res, "cookieName");	 // 쿠키 삭제 [이름]
			
			out.append("<script>");
			out.append("alert('탈퇴가 완료되었습니다.');");
			out.append("location.href='/main';");
			out.append("</script>");
			
		} else { // 탈퇴 실패 시 (UPDATE 실패)
			out.append("<script>");
			out.append("alert('회원 탈퇴 시 오류가 발생했습니다. 다시 시도해주세요');");
			out.append("history.back();");
			out.append("</script>");
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
		//POST는 없습니다.
	}

}
